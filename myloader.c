#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdbool.h>
#include <unistd.h>
#include <getopt.h>
#include <fcntl.h>
#include <arpa/inet.h>
#include <linux/if.h>
#include <net/if.h>

#include <bpf/libbpf.h>
#include <xdp/libxdp.h>
#include <linux/err.h>
#include <sys/resource.h>

#include "myloader.h"

static int strrev(char *src, int len)
{
    char *tmp = malloc(len);
    strncpy(tmp, src, len);
    for (int i = 0; i < len; ++i)
    {
        src[i] = tmp[len - 1 - i];
    }
    return 0;
}

static int set_rlimit(unsigned int min_limit)
{
	struct rlimit limit;
	int err = 0;

	err = getrlimit(RLIMIT_MEMLOCK, &limit);
	if (err) {
		err = -errno;
		pr_warn("Couldn't get current rlimit\n");
		return err;
	}

	if (limit.rlim_cur == RLIM_INFINITY || limit.rlim_cur == 0) {
		pr_debug("Current rlimit is infinity or 0. Not raising\n");
		return -ENOMEM;
	}

	if (min_limit) {
		if (limit.rlim_cur >= min_limit) {
			pr_debug("Current rlimit %ju already >= minimum %u\n",
				 (uintmax_t)limit.rlim_cur, min_limit);
			return 0;
		}
		pr_debug("Setting rlimit to minimum %u\n", min_limit);
		limit.rlim_cur = min_limit;
	} else {
		pr_debug("Doubling current rlimit of %ju\n", (uintmax_t)limit.rlim_cur);
		limit.rlim_cur <<= 1;
	}
	limit.rlim_max = max(limit.rlim_cur, limit.rlim_max);

	err = setrlimit(RLIMIT_MEMLOCK, &limit);
	if (err) {
		err = -errno;
		pr_warn("Couldn't raise rlimit: %s\n", strerror(-err));
		return err;
	}

	return 0;
}

static int double_rlimit(void)
{
	pr_debug("Permission denied when loading eBPF object; "
		 "raising rlimit and retrying\n");

	return set_rlimit(0);
}

struct filter__program_with_map *filter__open_program_with_map(const char *filename, enum filter_type type, const char *prog_name)
{
    struct bpf_object *obj = NULL;
    struct xdp_program *p;
    int map_fd = -1;
    enum bpf_map_type map_type = -1;
    struct filter__program_with_map *pwm = malloc(sizeof(struct filter__program_with_map));

    DECLARE_LIBXDP_OPTS(xdp_program_opts, xopts, .prog_name = prog_name);

    obj = bpf_object__open(filename);
    if (IS_ERR(obj))
        return (void*)obj;
    xopts.obj = obj;

    p = xdp_program__create(&xopts);
    printf("xdp create:%lx\n", (unsigned long)p);
    if (!p)
        return (void*)p;
    
    pwm->type = type;
    pwm->program = p;
    pwm->map_fd = map_fd;
    pwm->map_type = map_type;
    return pwm;
}

int filter__set_map(struct filter__program_with_map *f, const char *map_filename)
{
    if (!f)
        return -1;

    FILE *fp = 0;
    if ((fp = fopen(map_filename, "r")) == 0)
    {
        perror("fail to read");
        exit(1);
    }

    char buf[SUF_MAXLEN] = {0};
    __u32 len;
    int cnt = 0;
    switch (f->type)
    {
    case FILTER_QN:
        if (f->map_type != BPF_MAP_TYPE_LPM_TRIE)
            return -1;
        
        struct qname_lpm_key qlk;
        while (fgets(buf, SUF_MAXLEN, fp) != NULL)
        {
            len = strlen(buf);
            buf[len] = '\0'; /*去掉换行符*/
            printf("qname %s\n", buf);
            strrev(buf, len);
            printf("rev qname %s\n", buf);
            memset(qlk.rev_suf, 0, SUF_MAXLEN);
            qlk.prefixlen = len - 1;
            strncpy(qlk.rev_suf, buf, len);
            bpf_map_update_elem(f->map_fd, &qlk, &cnt, BPF_ANY);
            memset(buf, 0, SUF_MAXLEN);
            cnt++;
        }
        break;

    case FILTER_UR:
        if (f->map_type != BPF_MAP_TYPE_LPM_TRIE)
            return -1;
        struct ipv4_lpm_key ilk;
        while (fgets(buf, PREF_MAXLEN, fp) != NULL)
        {
            len = strlen(buf);
            buf[len - 1] = '\0'; /*去掉换行符*/

            __u32 preflen = 32;
            for (int i = len - 2; i >= 0; --i)
            {
                if (buf[i] == '/')
                {
                    preflen = atoi(buf+i+1);
                    buf[i] = '\0';
                    break;
                }
            }
            __u32 dst;
            inet_pton(AF_INET, buf, &dst);
            ilk.prefixlen = preflen;
            ilk.data = htonl(dst);
            bpf_map_update_elem(f->map_fd, &ilk, &cnt, BPF_ANY);
            memset(buf, 0, PREF_MAXLEN);
            cnt++;
        }
        break;

    case FILTER_HC:
        if(f->map_type != BPF_MAP_TYPE_HASH_OF_MAPS)
            return -1;
        int ttl = 0;

        __u8 mval = 1;
        printf("1\n");
        while (fgets(buf, PREF_MAXLEN+30, fp) != NULL)
        {
            int inner_map_fd = bpf_map_create(
                BPF_MAP_TYPE_HASH, "inner_map",
                sizeof(__u32), sizeof(__u32), 8, NULL
            );

            if(inner_map_fd < 0)
                return -1;
            len = strlen(buf);
            buf[len] = '\0'; /*去掉换行符*/
            printf("orgin %s\n", buf);
            for (int i = len - 2; i >= 0; --i)
            {
                if (buf[i] == ' ')
                {
                    printf("bindex %d\n", i);
                    ttl = atoi(buf+i+1);
                    printf("ttl val %d\n", (int)ttl);
                    buf[i] = '\0';
                    bpf_map_update_elem(inner_map_fd, &ttl, &mval, BPF_NOEXIST);
                }
            }
            __u32 dst;
            inet_pton(AF_INET, buf, &dst);
            dst = htonl(dst);
            bpf_map_update_elem(f->map_fd, &dst, &inner_map_fd, BPF_ANY);
            close(inner_map_fd);
            memset(buf, 0, PREF_MAXLEN);
            cnt++;
        }
        break;
    }
    return 0;
}

static struct option long_options[] = {
    {"qn",      optional_argument,  NULL, 'q'},
    {"qfile",   required_argument,  NULL, 'Q'},
    {"ur",      optional_argument,  NULL, 'u'},
    {"ufile",   required_argument,  NULL, 'U'},
    {"hc",      optional_argument,  NULL, 'h'},
    {"hfile",   required_argument,  NULL, 'H'},
    {"mode",    required_argument,  NULL, 'm'},
    {"iface",   required_argument,  NULL, 'i'},
    {"help",    no_argument,        NULL, 'p'},
    {NULL,      0,                  NULL, 0}
};

unsigned int filters_prio[3] = {100, 50, 150};
int filters_set[3] = {0};
#define SET_QN() filters_set[0] = 1
#define SET_UR() filters_set[1] = 1
#define SET_HC() filters_set[2] = 1
#define UNSET_QN() filters_set[0] = 0
#define UNSET_UR() filters_set[1] = 0
#define UNSET_HC() filters_set[2] = 0
#define ISSET_QN() (filters_set[0] == 1)
#define ISSET_UR() (filters_set[1] == 1)
#define ISSET_HC() (filters_set[2] == 1)

char filters_progfiles[3][256] = {
    "qn_filter.o",
    "ur_filter.o",
    "hc_filter.o"
};

#define SET_QN_FILE(fn) strncpy(filters_progfiles[0],fn,256)
#define SET_UR_FILE(fn) strncpy(filters_progfiles[1],fn,256)
#define SET_HC_FILE(fn) strncpy(filters_progfiles[2],fn,256)
#define GET_QN_FILE(fn) (filters_progfiles[0])
#define GET_UR_FILE(fn) (filters_progfiles[1])
#define GET_HC_FILE(fn) (filters_progfiles[2])

char filters_mapfiles[3][256] = {
    {0},
    {0},
    {0}
};

#define SET_QN_MAPFILE(fn) strncpy(filters_mapfiles[0],fn,256)
#define SET_UR_MAPFILE(fn) strncpy(filters_mapfiles[1],fn,256)
#define SET_HC_MAPFILE(fn) strncpy(filters_mapfiles[2],fn,256)
#define GET_QN_MAPFILE(fn) (filters_mapfiles[0])
#define GET_UR_MAPFILE(fn) (filters_mapfiles[1])
#define GET_HC_MAPFILE(fn) (filters_mapfiles[2])

void print_help()
{
    printf("- multiple filter loader -\n");
    printf("this program loads xdp filter(s) that user\n"
            "chooses into kernel\n\n");
    printf("three filters are to be chosen\n");
    printf("* qname filter:         --qn --qfile\n");
    printf("* source IP filter:     --ur --ufile\n");
    printf("* hop count filter:     --hc --hfile\n");
    printf("if the former option above is set,\n"
            "then the according filter is activated\n");
    printf("note that this options should be\n"
            "followed with a path to a xdp kernel\n"
            "program file\n\n");
    printf("the latter option sets the map data file\n"
            "that the according filter needs\n\n");
    printf("--iface set the iface user trys to load on\n");
    printf("--mode sets the mode of xdp attach, e.g.\n"
            "n for native mode, s for skb mode(default)\n");
    printf("e.g.\n");
    printf("./myloader --iface=eth0 --mode=n --qn=myfilter.o --qfile=myqlist.txt\n");
}

int main(int argc, char** argv)
{
    int opt, option_index=0;
    enum xdp_attach_mode mode = XDP_MODE_SKB;
    int ifindex = -1;
    if(argc < 2)
    {
        print_help();
        return 0;
    }

    int filternum = 0;

    while((opt = getopt_long(argc, argv, ":", long_options, &option_index)) != -1)
    {
        printf("%c : %s\n\n", opt, optarg);
        switch(opt)
        {
            case 'q':
            SET_QN();
            if(optarg)
                SET_QN_FILE(optarg);
            filternum++;
            break;

            case 'Q':
            if(!ISSET_QN())
            {
                printf("%s", "bad map file:qn\n");
                return -1;
            }
            SET_QN_MAPFILE(optarg);
            break;

            case 'u':
            SET_UR();
            if(optarg)
                SET_UR_FILE(optarg);
            filternum++;
            break;

            case 'U':
            if(!ISSET_UR())
            {
                printf("%s", "bad map file:ur\n");
                return -1;
            }
            SET_UR_MAPFILE(optarg);
            break;

            case 'h':
            SET_HC();
            if(optarg)
                SET_HC_FILE(optarg);
            filternum++;
            break;

            case 'H':
            if(!ISSET_HC())
            {
                printf("%s", "bad map file:hc\n");
                return -1;
            }
            SET_HC_MAPFILE(optarg);
            break;

            case 'm':
            if(!optarg)
                break;
            if(optarg[0] == 'n')
                mode = XDP_MODE_NATIVE;
            else if(optarg[0] == 's')
                mode = XDP_MODE_SKB;
            else{
                printf("attach mode not supported\n");
                return -1;
            }
            break;

            case 'i':
            ifindex = if_nametoindex(optarg);
            if(!ifindex){
                printf("cannot find iface named %s\n", optarg);
                return -1;
            }
            break;

            case 'p':
            print_help();
            return 0;

            case ':':
            printf(ERROR_THEME("missing argument\n"));
            print_help();
            return 0;
        }
    }

    if(filternum == 0)
    {
        printf("no filter set\n");
        print_help();
        return 0;
    }

retry:
    printf("-- loading xdp\n\n");
    int err;
    char errmsg[1024];
    int i = FILTER_QN;
    struct xdp_program* progs[3] = {0,0,0};
    struct filter__program_with_map* pwms[3] = {0,0,0};
    int cnt = 0;
    struct filter__program_with_map* pwm;
    for(;i<=FILTER_MAX; ++i)
    {
        if(filters_set[i] == 1)
        {
            pwm = filter__open_program_with_map(filters_progfiles[i], (enum filter_type)i, "xdp_patch_ports_func");
            
            if(progs[cnt])
                xdp_program__close(progs[cnt]);
            progs[cnt] = pwm->program;
            xdp_program__set_run_prio(progs[cnt], filters_prio[i]);
            cnt++;
            pwms[i] = pwm;
        }
    }

    printf("-- prepare to attach\n\n");
    err = xdp_program__attach_multi(progs, cnt, ifindex, mode, 0);
    if (err) {
		if (err == -EPERM && !double_rlimit())
			goto retry;

		if (err == -EOPNOTSUPP &&
		    (mode == XDP_MODE_NATIVE || mode == XDP_MODE_HW)) {
			printf("Attaching XDP program in %s mode not supported - try %s mode.\n",
				mode == XDP_MODE_NATIVE ? "native" : "HW",
				mode == XDP_MODE_NATIVE ? "SKB" : "native or SKB");
		} else {
			libbpf_strerror(err, errmsg, sizeof(errmsg));
			printf("Couldn't attach XDP program on iface %s(%d)\n",
				errmsg, err);
		}
		goto out;
	}


    struct bpf_map *map;
    struct bpf_object *tmpobj = NULL;
    int map_fd = -1;
    enum bpf_map_type map_type = -1;
    char *map_name = "main_map";
    cnt = 0;
    for(i=FILTER_QN;i<=FILTER_MAX;++i)
    {
        if(pwms[i]){
            tmpobj = xdp_program__bpf_obj(progs[cnt]);
            map = bpf_object__find_map_by_name(tmpobj, map_name);
            map_fd = bpf_map__fd(map);
            map_type = bpf_map__type(map);

            printf("map name:%s, map ptr:%lx, map fd:%d\n", map_name, (unsigned long)map, map_fd);
            if (map_fd == -1)
            {
                printf("map %s not found in filter %d\n", map_name, i);
                print_help();
                return -1;
            }

            pwms[i]->map_fd = map_fd;
            pwms[i]->map_type = map_type;
            filter__set_map(pwms[i], filters_mapfiles[i]);
            cnt++;
        }
    }

    return 0;
out:
	for (i = 0; i < cnt; i++)
		if (progs[i])
			xdp_program__close(progs[i]);
	return err;
}