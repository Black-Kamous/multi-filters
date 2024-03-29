#include <bpf/libbpf.h>
#include <xdp/libxdp.h>

#define DM_MAXLEN 64
#define SUF_MAXLEN 64
#define PREF_MAXLEN 32

#define __pr(fmt, ...)                             \
	do {                                              \
		printf(fmt, ##__VA_ARGS__); \
	} while (0)

#define pr_warn(fmt, ...) __pr(fmt, ##__VA_ARGS__)
#define pr_info(fmt, ...) __pr(fmt, ##__VA_ARGS__)
#define pr_debug(fmt, ...) __pr(fmt, ##__VA_ARGS__)

#define ERROR_THEME(c) "\033[1;31m"c"\033[0m"

#define min(x, y) ((x) < (y) ? x : y)
#define max(x, y) ((x) > (y) ? x : y)

struct ipv4_lpm_key {
        __u32 prefixlen;
        __u32 data;
};

struct qname_lpm_key {
	__u32 prefixlen;
	char rev_suf[SUF_MAXLEN];
};

enum filter_type {
    FILTER_QN = 0,
    FILTER_UR,
    FILTER_HC
};

#define FILTER_MAX FILTER_HC

struct filter__program_with_map
{
    enum filter_type type;
    struct xdp_program* program;
    int map_fd;
    enum bpf_map_type map_type;
};

struct filter__program_with_map* filter__open_program_with_map(const char* filename, enum filter_type type, const char* prog_name);

int filter__set_map(struct filter__program_with_map* f, const char* map_filename);