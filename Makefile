all: myloader unload

myloader: myloader.c myloader.h
	gcc -Wall -O2 -g -I../lib/libbpf/src/root/usr/include -DHAVE_ZLIB -DHAVE_ELF -std=gnu11 -Wextra -Werror \
	-DBPF_DIR_MNT=\"/sys/fs/bpf\" -DBPF_OBJECT_PATH=\"/usr/local/lib/bpf\" -DMAX_DISPATCHER_ACTIONS=10 -DTOOLS_VERSION=\""1.3.0"\" \
	-DLIBBPF_VERSION=\"1.0.0\" -DRUNDIR=\"/run\" -DHAVE_LIBBPF_PERF_BUFFER__CONSUME -DHAVE_LIBBPF_BTF__LOAD_FROM_KERNEL_BY_ID \
	-DHAVE_LIBBPF_BTF__TYPE_CNT -DHAVE_LIBBPF_BPF_OBJECT__NEXT_MAP -DHAVE_LIBBPF_BPF_OBJECT__NEXT_PROGRAM -DHAVE_LIBBPF_BPF_PROGRAM__INSN_CNT \
	-DHAVE_LIBBPF_BPF_MAP_CREATE -DHAVE_LIBBPF_PERF_BUFFER__NEW_RAW -DHAVE_LIBBPF_BPF_XDP_ATTACH -DHAVE_LIBBPF_BPF_MAP__SET_AUTOCREATE \
	-DHAVE_LIBBPF_BPF_PROG_TEST_RUN_OPTS -DHAVE_SECURE_GETENV -DDEBUG -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
	-I./lib/../headers -I./lib/libbpf/src  -L./lib/libbpf/src -L./lib/libxdp \
	-o myloader myloader.c  -l:libxdp.a  -lm -l:libbpf.a -L/lib -lz -lelf

unload: 
	./myloader --iface=eth0 --unload-all

show: 
	ip link show dev eth0