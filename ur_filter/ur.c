/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"

struct {
        __uint(type, BPF_MAP_TYPE_HASH);
        __type(key, __u32);
        __type(value, __u32);
        __uint(max_entries, 65535);
} main_map SEC(".maps");

struct {
	__uint(type, BPF_MAP_TYPE_ARRAY);
	__type(key, __u32);
	__type(value, __u64);
	__uint(max_entries, 2);
} stats_map SEC(".maps");

SEC("xdp")
int xdp_patch_ports_func(struct xdp_md *ctx)
{
	int action = XDP_PASS;
	int eth_type;
	__u32 saddrv4;
	struct ethhdr *eth;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct hdr_cursor nh = { .pos = data };

	eth_type = parse_ethhdr(&nh, data_end, &eth);
	if (eth_type < 0) {
		action = XDP_ABORTED;
		goto out;
	}

	if (eth_type == bpf_htons(ETH_P_IP)) {
		struct iphdr *iph = nh.pos;
		int hdrsize;

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
		if(iph->protocol != 17)
			return XDP_PASS;
		saddrv4 = iph->saddr;

        	__u32* res = NULL;
		__u32 stk = 0;
		__u64* stptr = NULL;	
		res = bpf_map_lookup_elem(&main_map, &saddrv4);
		bpf_printk("sipaddr %x\n", saddrv4);
		if(res){bpf_printk("val %d\n", *res);}

		if(res && (*res == 1)){
			stptr = bpf_map_lookup_elem(&stats_map, &stk);
			if(stptr) {
				*stptr = *stptr + 1;
				bpf_map_update_elem(&stats_map, &stk, stptr, BPF_ANY);
			}
			return XDP_PASS;
		}
		stk = 1;
		stptr = bpf_map_lookup_elem(&stats_map, &stk);
		if(stptr) {
			*stptr = *stptr + 1;
			bpf_map_update_elem(&stats_map, &stk, stptr, BPF_ANY);
		}
		action = XDP_DROP;
	} else {
		goto out;
	}

out:
	return action;
}

char _license[] SEC("license") = "GPL";
