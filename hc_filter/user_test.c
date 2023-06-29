/* SPDX-License-Identifier: GPL-2.0 */
static const char *__doc__ = "Simple XDP prog doing XDP_PASS\n";

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <getopt.h>
#include <fcntl.h>

#include <bpf/bpf.h>
#include <linux/bpf.h>
#include <bpf/libbpf.h>

#include <arpa/inet.h>

#include <net/if.h>
#include <linux/if_link.h> /* depend on kernel-headers installed */

#include "../common/common_params.h"

#define PREF_MAXLEN 32

static const struct option_wrapper long_options[] = {
	{{"help", no_argument, NULL, 'h'},
	 "Show help",
	 false},

	{{"dev", required_argument, NULL, 'd'},
	 "Operate on device <ifname>",
	 "<ifname>",
	 true},

	{{"skb-mode", no_argument, NULL, 'S'},
	 "Install XDP program in SKB (AKA generic) mode"},

	{{"native-mode", no_argument, NULL, 'N'},
	 "Install XDP program in native mode"},

	{{"auto-mode", no_argument, NULL, 'A'},
	 "Auto-detect SKB or native mode"},

	{{"force", no_argument, NULL, 'F'},
	 "Force install, replacing existing program on interface"},

	{{"unload", no_argument, NULL, 'U'},
	 "Unload XDP program instead of loading"},

	{{0, 0, NULL, 0}, NULL, false}};

struct bpf_program * load_bpf_object_file__simple(const char *filename, struct bpf_object **o_obj)
{
	struct bpf_object *obj;
	struct bpf_program *prog;

	/* Use libbpf for extracting BPF byte-code from BPF-ELF object, and
	 * loading this into the kernel via bpf-syscall
	 */
	obj = bpf_object__open_file(filename, NULL);

	if (libbpf_get_error(obj)) {
		fprintf(stderr, "ERROR: opening BPF object file failed\n");
		return 0;
	}

	prog = bpf_object__find_program_by_name(obj, "xdp_patch_ports_func");
	if (!prog) {
		printf("finding a prog in obj file failed\n");
		return 0;
	}
	bpf_program__set_type(prog, BPF_PROG_TYPE_XDP);

	if (bpf_object__load(obj)) {
		fprintf(stderr, "ERROR: loading BPF object file failed\n");
		return 0;
	}

	/* Simply return the first program file descriptor.
	 * (Hint: This will get more advanced later)
	 */
	*o_obj = obj;
	return prog;
}


int main(int argc, char **argv)
{
	struct bpf_prog_info info = {};
	char filename[256] = "lpm_test.o";
	struct bpf_program* prog;

	struct config cfg = {
		.xdp_flags = XDP_FLAGS_UPDATE_IF_NOEXIST | XDP_FLAGS_DRV_MODE,
		.ifindex = -1,
		.do_unload = false,
	};

	parse_cmdline_args(argc, argv, long_options, &cfg, __doc__);
	/* Required option */
	if (cfg.ifindex == -1)
	{
		fprintf(stderr, "ERR: required option --dev missing\n");
		usage(argv[0], __doc__, long_options, (argc == 1));
		return EXIT_FAIL_OPTION;
	}

	struct bpf_object *obj;

	/* Load the BPF-ELF object file and get back first BPF_prog FD */
	prog = load_bpf_object_file__simple(filename, &obj);
	if (!prog || !obj) {
		printf("finding a prog in obj file failed\n");
		return 0;
	}

	struct bpf_map *dmap = NULL;
	if (!(dmap = bpf_object__find_map_by_name(obj, "main_map")))
	{
		fprintf(stderr, "ERR: loading map: %s\n", "main_map");
		return EXIT_FAIL_BPF;
	}
	int dmap_fd = bpf_map__fd(dmap);

	FILE* fp;
	char fname[256] = "../hclist.t";

	fp = fopen(fname, "r");

	int ttl = 0;

	char buf[PREF_MAXLEN] = {0};
	__u32 len;

	__u8 mval = 1;
	while (fgets(buf, PREF_MAXLEN, fp) != NULL)
	{
		int inner_map_fd = bpf_map_create(
			BPF_MAP_TYPE_HASH, "inner_map",
			sizeof(__u8), sizeof(__u8), 8, 0);
		if (inner_map_fd < 0)
			return -1;
		len = strlen(buf);
		buf[len] = '\0'; /*去掉换行符*/
		for (int i = len - 1; i >= 0; --i)
		{
			if (buf[i] == ' ')
			{
				ttl = atoi(buf + i + 1);
				buf[i] = '\0';
				bpf_map_update_elem(inner_map_fd, &ttl, &mval, BPF_NOEXIST);
			}
		}
		__u32 dst;
		inet_pton(AF_INET, buf, &dst);
		dst = htonl(dst);
		bpf_map_update_elem(dmap_fd, &dst, &inner_map_fd, BPF_ANY);
		close(inner_map_fd);
		memset(buf, 0, PREF_MAXLEN);
	}

	/* At this point: BPF-prog is (only) loaded by the kernel, and prog_fd
	 * is our file-descriptor handle. Next step is attaching this FD to a
	 * kernel hook point, in this case XDP net_device link-level hook.
	 * Fortunately libbpf have a helper for this:
	 */
	struct bpf_link *link = NULL;
	link = bpf_program__attach_xdp(prog, cfg.ifindex);
	if (libbpf_get_error(link)) {
		fprintf(stderr, "ERROR: bpf_program__attach failed\n");
		return 0;
	}

	printf("prog type: %d\n", bpf_program__type(prog));
	printf("attach type: %d\n", bpf_program__expected_attach_type(prog));


	printf("Success: Loading "
		   "XDP prog name:%s(id:%d) on device:%s(ifindex:%d)\n",
		   info.name, info.id, cfg.ifname, cfg.ifindex);
	return EXIT_OK;
}
