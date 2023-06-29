/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"
#define bpf_printk(fmt, ...)				\
({                                                      \
        char ____fmt[] = fmt;                           \
        bpf_trace_printk(____fmt, sizeof(____fmt),      \
                         ##__VA_ARGS__);                \
})

#define DM_MAXLEN 64
#define SUF_MAXLEN 64

struct qname_lpm_key {
	__u32 prefixlen;
	char rev_suf[SUF_MAXLEN];
};

struct {
        __uint(type, BPF_MAP_TYPE_LPM_TRIE);
        __type(key, struct qname_lpm_key);
        __type(value, __u32);
        __uint(map_flags, BPF_F_NO_PREALLOC);
        __uint(max_entries, 255);
} dns_block_suffixes SEC(".maps");

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
			bpf_printk("dm len:%d\n", tmp);
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

	bpf_printk("rev suffix:%s\n", qlk.rev_suf);
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
	struct iphdr *iphdr;
	struct ipv6hdr *ipv6hdr;
	struct udphdr *udphdr;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct hdr_cursor nh = { .pos = data };

	eth_type = parse_ethhdr(&nh, data_end, &eth);
	if (eth_type < 0) {
		action = XDP_ABORTED;
		goto out;
	}

	if (eth_type == bpf_htons(ETH_P_IP)) {
		ip_type = parse_iphdr(&nh, data_end, &iphdr);
	} else if (eth_type == bpf_htons(ETH_P_IPV6)) {
		ip_type = parse_ip6hdr(&nh, data_end, &ipv6hdr);
	} else {
		goto out;
	}

	if (ip_type == IPPROTO_UDP) {
		__u32 udppld = parse_udphdr(&nh, data_end, &udphdr);
		if (udppld < 0) {
			action = XDP_ABORTED;
			goto out;
		}
		if((__u8*)(nh.pos) + 12 > data_end){
			action = XDP_PASS;
			goto out;
		}
		__u16 qrn = *(((__u16*)(nh.pos))+2);
		if(qrn > 0){
			struct qname_lpm_key qlk = get_qname_lpm_key((char*)nh.pos+12, data_end);
			if(qlk.prefixlen == 0){
				action = XDP_ABORTED;
				goto out;
			}
			__u32* tval = NULL;
			if(!(tval = bpf_map_lookup_elem(&dns_block_suffixes, &qlk))){
				action = XDP_PASS;
				goto out;
			}else{
				bpf_printk("blocked prefix: %d", *tval);
				action = XDP_DROP;
				goto out;
			}
		}
	} else {
		goto out;
	}

out:
	return action;
}

char _license[] SEC("license") = "GPL";
