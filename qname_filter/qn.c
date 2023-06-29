/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"


#define DM_MAXLEN 64
#define SUF_MAXLEN 64

struct qname_lpm_key {
	__u32 prefixlen;
	char rev_suf[SUF_MAXLEN];
};

struct {
        __uint(type, BPF_MAP_TYPE_LPM_TRIE);
        __type(key, struct qname_lpm_key);
        __type(value, struct qname_lpm_key);
        __uint(map_flags, BPF_F_NO_PREALLOC);
        __uint(max_entries, 1023);
} main_map SEC(".maps");

struct {
	__uint(type, BPF_MAP_TYPE_ARRAY);
	__type(key, __u32);
	__type(value, __u64);
	__uint(max_entries, 2);
} stats_map SEC(".maps");

static __always_inline struct qname_lpm_key get_qname_lpm_key(const char* base, void* data_end){
	struct qname_lpm_key qlk = {
		.prefixlen = SUF_MAXLEN,
		.rev_suf = {0}
	};
	__u64 qend = 0;
	char tmp = 0, sv = 0;
	char qnbuf[DM_MAXLEN] = {0};

	while(qend<DM_MAXLEN){
		if((void*)base+qend+1 > data_end) goto fail;
		if(qend == tmp){
			sv = tmp;
			tmp = base[qend];
			if(tmp == 0x00) break;
			if(tmp > 63) goto fail;
			qnbuf[qend] = '.';
			tmp = sv+tmp+1;
		}else{
			qnbuf[qend] = base[qend];
		}
		qend++;
	}
	if(qend >= DM_MAXLEN) goto fail;

	__u64 qlen = qend-1;
	qend--;
	while(qend > 0){
		__u64 i = qlen-qend;
		if(i>=SUF_MAXLEN) break;
		if(qend<0 || qend>DM_MAXLEN-1) goto fail;
		qlk.rev_suf[i] = qnbuf[qend];
		qend--;
	}
	qlk.prefixlen = qlen;
	return qlk;

fail:
	qlk.prefixlen = 0;
	return qlk;
}

/*
 * Solution to the assignment 1 in lesson packet02
 */
SEC("xdp_patch_ports")
int xdp_patch_ports_func(struct xdp_md *ctx)
{
	int action = XDP_PASS;
	int eth_type, ip_type;
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
		ip_type =  iph->protocol;
	// } else if (eth_type == bpf_htons(ETH_P_IPV6)) {
	//		ip_type = parse_ip6hdr(&nh, data_end, &ipv6hdr);
	// } else 
	}else {
		goto out;
	}

	if (ip_type == IPPROTO_UDP) {
		__u32 udppld = -1;
		struct udphdr *h = nh.pos;

		if (h + 1 > data_end)
			return XDP_ABORTED;

		nh.pos  = h + 1;

		udppld = bpf_ntohs(h->len) - sizeof(struct udphdr);
		if (udppld < 0) {
			return XDP_ABORTED;
		}
		if((__u8*)(nh.pos) + 12 > data_end){
			action = XDP_PASS;
			goto out;
		}
		__u16 qrn = *(((__u16*)(nh.pos))+2);
		__u32 qlen = 0;
		if(qrn > 0){
			struct qname_lpm_key qlk = get_qname_lpm_key((char*)nh.pos+12, data_end);
			qlen = qlk.prefixlen;
			qlk.prefixlen = SUF_MAXLEN;
			if(qlk.prefixlen == 0){
				return XDP_ABORTED;
			}
			bpf_printk("rev %s\n", qlk.rev_suf);
			struct qname_lpm_key* tval = NULL;
			if(!(tval = bpf_map_lookup_elem(&main_map, &qlk))){
				action = XDP_PASS;
				goto out;
			}else{
				bpf_printk("k index %d\n", tval->prefixlen);
				while(qlen > 0){
					if(qlk.rev_suf[qlen] != '\0' && tval->rev_suf[qlen] != '\0'){
						if(qlk.rev_suf[qlen] != tval->rev_suf[qlen]){
							bpf_printk("matched len %d\n", qlen);
							action = XDP_PASS;
							goto out;
						}
					}
					qlen--;
				}
				action = XDP_DROP;
				goto out;
			}
		}
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
