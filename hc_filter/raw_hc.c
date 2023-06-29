/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"
#define MAX_SUFFIX_LENGTH 50
#define MAX_SUFFIX_NUM 100

struct inner_map{
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 8);
	__type(key, __u32);
	__type(value, __u32);
};

struct {
        __uint(type, BPF_MAP_TYPE_HASH_OF_MAPS);
        __type(key, __u32);
        //__type(value, __u32);
        __uint(max_entries, 65535);
		__array(values, struct inner_map);
} main_map SEC(".maps");

struct {
	__uint(type, BPF_MAP_TYPE_ARRAY);
	__type(key, __u32);
	__type(value, __u64);
	__uint(max_entries, 2);
} stats_map SEC(".maps");

// struct bpf_map_def SEC("maps") main_map = {
// 	.type = BPF_MAP_TYPE_HASH_OF_MAPS,
// 	.key_size = sizeof(__u32),
// 	.value_size = sizeof(__u32),
// 	.max_entries = 255
// };


/*
 * Solution to the assignment 1 in lesson packet02
 */
SEC("xdp")
int xdp_patch_ports_func(struct xdp_md *ctx)
{
	int action = XDP_PASS;
	int eth_type;
	__u32 saddrv4;
	struct ethhdr *eth;
	__u32 stk = 0;
	__u64* stptr = NULL;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct hdr_cursor nh = { .pos = data };

	eth_type = parse_ethhdr(&nh, data_end, &eth);
	if (eth_type < 0) {
		return XDP_ABORTED;
	}

	if (eth_type == bpf_htons(ETH_P_IP)) {
		struct iphdr *iph = nh.pos;
		int hdrsize;
		__u32 ttl = 255;

		if (iph + 1 > data_end)
			return XDP_ABORTED;

		hdrsize = iph->ihl * 4;
		/* Sanity check packet field is valid */
		if(hdrsize < sizeof(*iph))
			return XDP_ABORTED;

		/* Variable-length IPv4 header, need to use byte-based arithmetic */
		if (nh.pos + hdrsize > data_end)
			return XDP_ABORTED;

		nh.pos += hdrsize;
		ttl = iph->ttl;
		saddrv4 = iph->saddr;

        struct inner_map* res = NULL; 
        res = bpf_map_lookup_elem(&main_map, &saddrv4);

		__u32 *ttlp;
        if(res){
			ttlp = bpf_map_lookup_elem(res, &ttl);
			
			if(ttlp && (*ttlp) == 1){
				action = XDP_PASS;
				goto out;
			}else{
				action = XDP_DROP;
				goto out;
			}
        }
		action = XDP_PASS;
	} else {
		goto out;
	}


out:

	if(action == XDP_DROP)
		stk = 1;
	stptr = bpf_map_lookup_elem(&stats_map, &stk);
	if(stptr) {
		*stptr = *stptr + 1;
		bpf_map_update_elem(&stats_map, &stk, stptr, BPF_ANY);
	}
	return action;
}

char _license[] SEC("license") = "GPL";
