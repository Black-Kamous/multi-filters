# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

XDP_TARGETS := raw_hc
USER_TARGETS := user_test

LLC ?= llc-14
CLANG ?= clang-14
CC := gcc

LIBBPF_DIR = ../lib/libbpf/src/
COMMON_DIR = ../common/

USER_LIBS += -lz

include $(COMMON_DIR)/common.mk
COMMON_OBJS := $(COMMON_DIR)/common_params.o


unload: 
	ip link set dev eth0 xdpgeneric off

show: 
	ip link show dev eth0