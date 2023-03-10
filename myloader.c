#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdbool.h>
#include <unistd.h>
#include <getopt.h>
#include <fcntl.h>
#include <arpa/inet.h>

#include <bpf/libbpf.h>
#include <xdp/libxdp.h>
#include <linux/err.h>

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

struct filter__program_with_map *filter__open_program_with_map(const char *filename, enum filter_type type, const char *prog_name, const char *map_name)
{
    struct bpf_object *obj = NULL;
    struct xdp_program *p;
    int map_fd;
    enum bpf_map_type map_type;
    struct filter__program_with_map *pwm = malloc(sizeof(struct filter__program_with_map));

    DECLARE_LIBXDP_OPTS(xdp_program_opts, xopts, .prog_name = prog_name);

    obj = bpf_object__open(filename);
    if (IS_ERR(obj))
        return libxdp_err_ptr(PTR_ERR(obj), true);
    xopts.obj = obj;

    p = xdp_program__create(&xopts);
    if (!p)
        return p;
    struct bpf_map *map;
    map = bpf_object__find_map_by_name(obj, map_name);
    map_fd = bpf_map__fd(map);
    map_type = bpf_map__type(map);

    if (map_fd == -1)
        return NULL;

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
                    preflen = atoi(buf[i + 1]);
                    buf[i] = '\0';
                    break;
                }
            }
            __u32 dst;
            inet_pton(AF_INET, buf, &dst);
            ilk.prefixlen = preflen;
            ilk.data = htonl(dst);
            bpf_map_update_elem(f->map_fd, &ilk, cnt, BPF_ANY);
            memset(buf, 0, PREF_MAXLEN);
            cnt++;
        }
        break;

    case FILTER_HC:
        if(f->map_type != BPF_MAP_TYPE_HASH_OF_MAPS)
            return -1;
        int ttl = 0;

        int inner_map_fd = bpf_map_create(
            BPF_MAP_TYPE_ARRAY, "inner_map",
            sizeof(__u32), sizeof(__u32), 8, NULL
        );

        if(inner_map_fd < 0)
            return -1;

        int map_cnt = 0;
        while (fgets(buf, PREF_MAXLEN, fp) != NULL)
        {
            len = strlen(buf);
            buf[len - 1] = '\0'; /*去掉换行符*/
            for (int i = len - 2; i >= 0; --i)
            {
                if (buf[i] == ' ')
                {
                    ttl = atoi(buf[i + 1]);
                    buf[i] = '\0';
                    bpf_map_update_elem(inner_map_fd, &map_cnt, &ttl, BPF_NOEXIST);
                    map_cnt++;
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
    {"qn",      optional_argument,      NULL, 'q'},
    {"qfile",   required_argument,      NULL, 'Q'},
    {"ur",      optional_argument,      NULL, 'u'},
    {"ufile",   required_argument,      NULL, 'U'},
    {"hc",      optional_argument,      NULL, 'h'},
    {"hfile",   required_argument,      NULL, 'H'},
    {NULL,      0,                      NULL, 0}
};

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
    NULL,
    NULL,
    NULL
};

#define SET_QN_MAPFILE(fn) strncpy(filters_mapfiles[0],fn,256)
#define SET_UR_MAPFILE(fn) strncpy(filters_mapfiles[1],fn,256)
#define SET_HC_MAPFILE(fn) strncpy(filters_mapfiles[2],fn,256)
#define GET_QN_MAPFILE(fn) (filters_mapfiles[0])
#define GET_UR_MAPFILE(fn) (filters_mapfiles[1])
#define GET_HC_MAPFILE(fn) (filters_mapfiles[2])

int main(int argc, char** argv)
{
    int opt, option_index=0;
    
    while((opt = getopt_long(argc, argv, NULL, long_options, &option_index)) != -1)
    {
        switch(opt)
        {
            case 'q':
            SET_QN();
            if(!optarg)
                SET_QN_FILE(optarg);
            break;

            case 'Q':
            if(!ISSET_QN())
            {
                printf("%s", "bad map file:qn\n");
                return -1;
            }
            SET_QN_FILE(optarg);
            break;

            case 'u':
            SET_UR();
            if(!optarg)
                SET_UR_FILE(optarg);
            break;

            case 'U':
            if(!ISSET_UR())
            {
                printf("%s", "bad map file:ur\n");
                return -1;
            }
            SET_UR_FILE(optarg);
            break;

            case 'h':
            SET_HC();
            if(!optarg)
                SET_HC_FILE(optarg);
            break;

            case 'H':
            if(!ISSET_HC())
            {
                printf("%s", "bad map file:hc\n");
                return -1;
            }
            SET_HC_FILE(optarg);
            break;
        }
    }


}