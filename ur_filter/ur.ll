; ModuleID = 'ur.c'
source_filename = "ur.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.1 = type { [1 x i32]*, i32*, i32*, [65535 x i32]* }
%struct.anon.2 = type { [2 x i32]*, i32*, i64*, [2 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }

@main_map = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !0
@xdp_patch_ports_func.____fmt = internal constant [12 x i8] c"sipaddr %x\0A\00", align 1, !dbg !21
@xdp_patch_ports_func.____fmt.1 = internal constant [8 x i8] c"val %d\0A\00", align 1, !dbg !108
@stats_map = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !118
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !113
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.1* @main_map to i8*), i8* bitcast (%struct.anon.2* @stats_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !23 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !37, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i32 2, metadata !38, metadata !DIExpression()), !dbg !168
  %4 = bitcast i32* %2 to i8*, !dbg !169
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4, !dbg !169
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !170
  %6 = load i32, i32* %5, align 4, !dbg !170, !tbaa !171
  %7 = zext i32 %6 to i64, !dbg !176
  %8 = inttoptr i64 %7 to i8*, !dbg !177
  call void @llvm.dbg.value(metadata i8* %8, metadata !55, metadata !DIExpression()), !dbg !168
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !178
  %10 = load i32, i32* %9, align 4, !dbg !178, !tbaa !179
  %11 = zext i32 %10 to i64, !dbg !180
  %12 = inttoptr i64 %11 to i8*, !dbg !181
  call void @llvm.dbg.value(metadata i8* %12, metadata !56, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i8* %12, metadata !57, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !41, metadata !DIExpression(DW_OP_deref)), !dbg !168
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !182, metadata !DIExpression()) #4, !dbg !191
  call void @llvm.dbg.value(metadata i8* %8, metadata !189, metadata !DIExpression()) #4, !dbg !191
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !190, metadata !DIExpression()) #4, !dbg !191
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !193, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i8* %8, metadata !203, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !204, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !205, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i8* %12, metadata !206, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i32 14, metadata !207, metadata !DIExpression()) #4, !dbg !216
  %13 = getelementptr i8, i8* %12, i64 14, !dbg !218
  %14 = icmp ugt i8* %13, %8, !dbg !220
  br i1 %14, label %101, label %15, !dbg !221

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %12, metadata !206, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i8* %13, metadata !57, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i8* %13, metadata !208, metadata !DIExpression()) #4, !dbg !216
  %16 = getelementptr inbounds i8, i8* %12, i64 12, !dbg !222
  %17 = bitcast i8* %16 to i16*, !dbg !222
  call void @llvm.dbg.value(metadata i16 undef, metadata !214, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()) #4, !dbg !216
  %18 = load i16, i16* %17, align 1, !dbg !216, !tbaa !223
  call void @llvm.dbg.value(metadata i16 %18, metadata !214, metadata !DIExpression()) #4, !dbg !216
  %19 = inttoptr i64 %7 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %18, metadata !225, metadata !DIExpression()) #4, !dbg !230
  %20 = icmp eq i16 %18, 129, !dbg !236
  %21 = icmp eq i16 %18, -22392, !dbg !237
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %20) #4
  %23 = or i1 %21, %22, !dbg !237
  %24 = xor i1 %23, true, !dbg !238
  %25 = getelementptr i8, i8* %12, i64 18
  %26 = bitcast i8* %25 to %struct.vlan_hdr*
  %27 = icmp ugt %struct.vlan_hdr* %26, %19
  %28 = select i1 %24, i1 true, i1 %27, !dbg !239
  br i1 %28, label %46, label %29, !dbg !239

29:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i16 undef, metadata !214, metadata !DIExpression()) #4, !dbg !216
  %30 = getelementptr i8, i8* %12, i64 16, !dbg !240
  %31 = bitcast i8* %30 to i16*, !dbg !240
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %26, metadata !208, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i32 1, metadata !215, metadata !DIExpression()) #4, !dbg !216
  %32 = load i16, i16* %31, align 1, !dbg !216, !tbaa !223
  call void @llvm.dbg.value(metadata i16 %32, metadata !214, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i16 %32, metadata !225, metadata !DIExpression()) #4, !dbg !230
  %33 = icmp eq i16 %32, 129, !dbg !236
  %34 = icmp eq i16 %32, -22392, !dbg !237
  %35 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %33) #4
  %36 = or i1 %34, %35, !dbg !237
  %37 = xor i1 %36, true, !dbg !238
  %38 = getelementptr i8, i8* %12, i64 22
  %39 = bitcast i8* %38 to %struct.vlan_hdr*
  %40 = icmp ugt %struct.vlan_hdr* %39, %19
  %41 = select i1 %37, i1 true, i1 %40, !dbg !239
  br i1 %41, label %46, label %42, !dbg !239

42:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i16 undef, metadata !214, metadata !DIExpression()) #4, !dbg !216
  %43 = getelementptr i8, i8* %12, i64 20, !dbg !240
  %44 = bitcast i8* %43 to i16*, !dbg !240
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %39, metadata !208, metadata !DIExpression()) #4, !dbg !216
  call void @llvm.dbg.value(metadata i32 2, metadata !215, metadata !DIExpression()) #4, !dbg !216
  %45 = load i16, i16* %44, align 1, !dbg !216, !tbaa !223
  call void @llvm.dbg.value(metadata i16 %45, metadata !214, metadata !DIExpression()) #4, !dbg !216
  br label %46

46:                                               ; preds = %15, %29, %42
  %47 = phi i8* [ %13, %15 ], [ %25, %29 ], [ %38, %42 ], !dbg !216
  %48 = phi i16 [ %18, %15 ], [ %32, %29 ], [ %45, %42 ], !dbg !216
  call void @llvm.dbg.value(metadata i8* %47, metadata !57, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i16 %48, metadata !39, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !168
  %49 = icmp eq i16 %48, 8, !dbg !241
  br i1 %49, label %50, label %101, !dbg !242

50:                                               ; preds = %46
  call void @llvm.dbg.value(metadata i8* %47, metadata !62, metadata !DIExpression()), !dbg !243
  %51 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !244
  %52 = bitcast i8* %51 to %struct.iphdr*, !dbg !244
  %53 = inttoptr i64 %7 to %struct.iphdr*, !dbg !246
  %54 = icmp ugt %struct.iphdr* %52, %53, !dbg !247
  br i1 %54, label %101, label %55, !dbg !248

55:                                               ; preds = %50
  %56 = load i8, i8* %47, align 4, !dbg !249
  %57 = shl i8 %56, 2, !dbg !250
  %58 = and i8 %57, 60, !dbg !250
  call void @llvm.dbg.value(metadata i8 %58, metadata !94, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !243
  %59 = icmp ult i8 %58, 20, !dbg !251
  br i1 %59, label %101, label %60, !dbg !253

60:                                               ; preds = %55
  %61 = zext i8 %58 to i64
  call void @llvm.dbg.value(metadata i64 %61, metadata !94, metadata !DIExpression()), !dbg !243
  %62 = getelementptr i8, i8* %47, i64 %61, !dbg !254
  %63 = icmp ugt i8* %62, %8, !dbg !256
  br i1 %63, label %101, label %64, !dbg !257

64:                                               ; preds = %60
  call void @llvm.dbg.value(metadata i8* %62, metadata !57, metadata !DIExpression()), !dbg !168
  %65 = getelementptr inbounds i8, i8* %47, i64 9, !dbg !258
  %66 = load i8, i8* %65, align 1, !dbg !258, !tbaa !260
  %67 = icmp eq i8 %66, 17, !dbg !262
  br i1 %67, label %68, label %101, !dbg !263

68:                                               ; preds = %64
  %69 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !264
  %70 = bitcast i8* %69 to i32*, !dbg !264
  %71 = load i32, i32* %70, align 4, !dbg !264, !tbaa !265
  call void @llvm.dbg.value(metadata i32 %71, metadata !40, metadata !DIExpression()), !dbg !168
  store i32 %71, i32* %2, align 4, !dbg !266, !tbaa !267
  call void @llvm.dbg.value(metadata i32* null, metadata !95, metadata !DIExpression()), !dbg !243
  %72 = bitcast i32* %3 to i8*, !dbg !268
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %72) #4, !dbg !268
  call void @llvm.dbg.value(metadata i32 0, metadata !97, metadata !DIExpression()), !dbg !243
  store i32 0, i32* %3, align 4, !dbg !269, !tbaa !267
  call void @llvm.dbg.value(metadata i64* null, metadata !98, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i32* %2, metadata !40, metadata !DIExpression(DW_OP_deref)), !dbg !168
  %73 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.1* @main_map to i8*), i8* noundef nonnull %4) #4, !dbg !270
  %74 = bitcast i8* %73 to i32*, !dbg !270
  call void @llvm.dbg.value(metadata i32* %74, metadata !95, metadata !DIExpression()), !dbg !243
  %75 = load i32, i32* %2, align 4, !dbg !271, !tbaa !267
  call void @llvm.dbg.value(metadata i32 %75, metadata !40, metadata !DIExpression()), !dbg !168
  %76 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @xdp_patch_ports_func.____fmt, i64 0, i64 0), i32 noundef 12, i32 noundef %75) #4, !dbg !271
  %77 = icmp eq i8* %73, null, !dbg !273
  br i1 %77, label %91, label %78, !dbg !275

78:                                               ; preds = %68
  %79 = load i32, i32* %74, align 4, !dbg !276, !tbaa !267
  %80 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @xdp_patch_ports_func.____fmt.1, i64 0, i64 0), i32 noundef 8, i32 noundef %79) #4, !dbg !276
  %81 = load i32, i32* %74, align 4, !dbg !279, !tbaa !267
  %82 = icmp eq i32 %81, 1, !dbg !281
  br i1 %82, label %83, label %91, !dbg !282

83:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i32* %3, metadata !97, metadata !DIExpression(DW_OP_deref)), !dbg !243
  %84 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %72) #4, !dbg !283
  %85 = bitcast i8* %84 to i64*, !dbg !283
  call void @llvm.dbg.value(metadata i64* %85, metadata !98, metadata !DIExpression()), !dbg !243
  %86 = icmp eq i8* %84, null, !dbg !285
  br i1 %86, label %100, label %87, !dbg !287

87:                                               ; preds = %83
  %88 = load i64, i64* %85, align 8, !dbg !288, !tbaa !290
  %89 = add i64 %88, 1, !dbg !292
  store i64 %89, i64* %85, align 8, !dbg !293, !tbaa !290
  call void @llvm.dbg.value(metadata i32* %3, metadata !97, metadata !DIExpression(DW_OP_deref)), !dbg !243
  %90 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %72, i8* noundef nonnull %84, i64 noundef 0) #4, !dbg !294
  br label %100, !dbg !295

91:                                               ; preds = %68, %78
  call void @llvm.dbg.value(metadata i32 1, metadata !97, metadata !DIExpression()), !dbg !243
  store i32 1, i32* %3, align 4, !dbg !296, !tbaa !267
  call void @llvm.dbg.value(metadata i32* %3, metadata !97, metadata !DIExpression(DW_OP_deref)), !dbg !243
  %92 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %72) #4, !dbg !297
  %93 = bitcast i8* %92 to i64*, !dbg !297
  call void @llvm.dbg.value(metadata i64* %93, metadata !98, metadata !DIExpression()), !dbg !243
  %94 = icmp eq i8* %92, null, !dbg !298
  br i1 %94, label %99, label %95, !dbg !300

95:                                               ; preds = %91
  %96 = load i64, i64* %93, align 8, !dbg !301, !tbaa !290
  %97 = add i64 %96, 1, !dbg !303
  store i64 %97, i64* %93, align 8, !dbg !304, !tbaa !290
  call void @llvm.dbg.value(metadata i32* %3, metadata !97, metadata !DIExpression(DW_OP_deref)), !dbg !243
  %98 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %72, i8* noundef nonnull %92, i64 noundef 0) #4, !dbg !305
  br label %99, !dbg !306

99:                                               ; preds = %95, %91
  call void @llvm.dbg.value(metadata i32 2, metadata !38, metadata !DIExpression()), !dbg !168
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %72) #4, !dbg !307
  br label %101

100:                                              ; preds = %87, %83
  call void @llvm.dbg.value(metadata i32 2, metadata !38, metadata !DIExpression()), !dbg !168
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %72) #4, !dbg !307
  br label %101

101:                                              ; preds = %64, %60, %55, %50, %1, %46, %99, %100
  %102 = phi i32 [ 2, %100 ], [ 2, %46 ], [ 1, %99 ], [ 0, %1 ], [ 2, %64 ], [ 0, %60 ], [ 0, %55 ], [ 0, %50 ], !dbg !168
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4, !dbg !308
  ret i32 %102, !dbg !308
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #3

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!163, !164, !165, !166}
!llvm.ident = !{!167}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "main_map", scope: !2, file: !3, line: 18, type: !149, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "ur.c", directory: "/root/anti-ddos-firewall/ur_filter", checksumkind: CSK_MD5, checksum: "ff43417aee0d3a9acd36615350265e91")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/anti-ddos-firewall/ur_filter", checksumkind: CSK_MD5, checksum: "db1ce4e5e29770657167bc8f57af9388")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !16, !17}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !{!21, !108, !113, !0, !118, !130, !138, !144}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "____fmt", scope: !23, file: !3, line: 69, type: !103, isLocal: true, isDefinition: true)
!23 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 28, type: !24, scopeLine: 29, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !36)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !27}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !29)
!29 = !{!30, !32, !33, !34, !35}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !28, file: !6, line: 2857, baseType: !31, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !28, file: !6, line: 2858, baseType: !31, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !28, file: !6, line: 2859, baseType: !31, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !28, file: !6, line: 2861, baseType: !31, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !28, file: !6, line: 2862, baseType: !31, size: 32, offset: 128)
!36 = !{!37, !38, !39, !40, !41, !55, !56, !57, !62, !94, !95, !97, !98, !102}
!37 = !DILocalVariable(name: "ctx", arg: 1, scope: !23, file: !3, line: 28, type: !27)
!38 = !DILocalVariable(name: "action", scope: !23, file: !3, line: 30, type: !26)
!39 = !DILocalVariable(name: "eth_type", scope: !23, file: !3, line: 31, type: !26)
!40 = !DILocalVariable(name: "saddrv4", scope: !23, file: !3, line: 32, type: !31)
!41 = !DILocalVariable(name: "eth", scope: !23, file: !3, line: 33, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !44, line: 168, size: 112, elements: !45)
!44 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!45 = !{!46, !51, !52}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !43, file: !44, line: 169, baseType: !47, size: 48)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 48, elements: !49)
!48 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!49 = !{!50}
!50 = !DISubrange(count: 6)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !43, file: !44, line: 170, baseType: !47, size: 48, offset: 48)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !43, file: !44, line: 171, baseType: !53, size: 16, offset: 96)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !54, line: 25, baseType: !17)
!54 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!55 = !DILocalVariable(name: "data_end", scope: !23, file: !3, line: 34, type: !15)
!56 = !DILocalVariable(name: "data", scope: !23, file: !3, line: 35, type: !15)
!57 = !DILocalVariable(name: "nh", scope: !23, file: !3, line: 36, type: !58)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !59, line: 33, size: 64, elements: !60)
!59 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/anti-ddos-firewall/ur_filter", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!60 = !{!61}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !58, file: !59, line: 34, baseType: !15, size: 64)
!62 = !DILocalVariable(name: "iph", scope: !63, file: !3, line: 45, type: !65)
!63 = distinct !DILexicalBlock(scope: !64, file: !3, line: 44, column: 39)
!64 = distinct !DILexicalBlock(scope: !23, file: !3, line: 44, column: 6)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !67, line: 87, size: 160, elements: !68)
!67 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!68 = !{!69, !71, !72, !73, !74, !75, !76, !77, !78, !80}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !66, file: !67, line: 89, baseType: !70, size: 4, flags: DIFlagBitField, extraData: i64 0)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !48)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !66, file: !67, line: 90, baseType: !70, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !66, file: !67, line: 97, baseType: !70, size: 8, offset: 8)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !66, file: !67, line: 98, baseType: !53, size: 16, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !66, file: !67, line: 99, baseType: !53, size: 16, offset: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !66, file: !67, line: 100, baseType: !53, size: 16, offset: 48)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !66, file: !67, line: 101, baseType: !70, size: 8, offset: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !66, file: !67, line: 102, baseType: !70, size: 8, offset: 72)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !66, file: !67, line: 103, baseType: !79, size: 16, offset: 80)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !54, line: 31, baseType: !17)
!80 = !DIDerivedType(tag: DW_TAG_member, scope: !66, file: !67, line: 104, baseType: !81, size: 64, offset: 96)
!81 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !66, file: !67, line: 104, size: 64, elements: !82)
!82 = !{!83, !89}
!83 = !DIDerivedType(tag: DW_TAG_member, scope: !81, file: !67, line: 104, baseType: !84, size: 64)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !81, file: !67, line: 104, size: 64, elements: !85)
!85 = !{!86, !88}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !84, file: !67, line: 104, baseType: !87, size: 32)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !54, line: 27, baseType: !31)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !84, file: !67, line: 104, baseType: !87, size: 32, offset: 32)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !81, file: !67, line: 104, baseType: !90, size: 64)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !81, file: !67, line: 104, size: 64, elements: !91)
!91 = !{!92, !93}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !90, file: !67, line: 104, baseType: !87, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !90, file: !67, line: 104, baseType: !87, size: 32, offset: 32)
!94 = !DILocalVariable(name: "hdrsize", scope: !63, file: !3, line: 46, type: !26)
!95 = !DILocalVariable(name: "res", scope: !63, file: !3, line: 65, type: !96)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!97 = !DILocalVariable(name: "stk", scope: !63, file: !3, line: 66, type: !31)
!98 = !DILocalVariable(name: "stptr", scope: !63, file: !3, line: 67, type: !99)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !18, line: 31, baseType: !101)
!101 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!102 = !DILabel(scope: !23, name: "out", file: !3, line: 91)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 96, elements: !106)
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !105)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !{!107}
!107 = !DISubrange(count: 12)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "____fmt", scope: !23, file: !3, line: 70, type: !110, isLocal: true, isDefinition: true)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 64, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 8)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 95, type: !115, isLocal: false, isDefinition: true)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 32, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 4)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(name: "stats_map", scope: !2, file: !3, line: 25, type: !120, isLocal: false, isDefinition: true)
!120 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 20, size: 256, elements: !121)
!121 = !{!122, !127, !128, !129}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !120, file: !3, line: 21, baseType: !123, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 64, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 2)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !120, file: !3, line: 22, baseType: !96, size: 64, offset: 64)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !120, file: !3, line: 23, baseType: !99, size: 64, offset: 128)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !120, file: !3, line: 24, baseType: !123, size: 64, offset: 192)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !132, line: 55, type: !133, isLocal: true, isDefinition: true)
!132 = !DIFile(filename: "../../multi-filters/lib/libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/anti-ddos-firewall/ur_filter", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!134 = !DISubroutineType(types: !135)
!135 = !{!15, !15, !136}
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !132, line: 176, type: !140, isLocal: true, isDefinition: true)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DISubroutineType(types: !142)
!142 = !{!16, !143, !31, null}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !132, line: 77, type: !146, isLocal: true, isDefinition: true)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DISubroutineType(types: !148)
!148 = !{!16, !15, !136, !136, !100}
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 13, size: 256, elements: !150)
!150 = !{!151, !156, !157, !158}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !149, file: !3, line: 14, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 32, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 1)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !149, file: !3, line: 15, baseType: !96, size: 64, offset: 64)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !149, file: !3, line: 16, baseType: !96, size: 64, offset: 128)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !149, file: !3, line: 17, baseType: !159, size: 64, offset: 192)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 2097120, elements: !161)
!161 = !{!162}
!162 = !DISubrange(count: 65535)
!163 = !{i32 7, !"Dwarf Version", i32 5}
!164 = !{i32 2, !"Debug Info Version", i32 3}
!165 = !{i32 1, !"wchar_size", i32 4}
!166 = !{i32 7, !"frame-pointer", i32 2}
!167 = !{!"Ubuntu clang version 14.0.6"}
!168 = !DILocation(line: 0, scope: !23)
!169 = !DILocation(line: 32, column: 2, scope: !23)
!170 = !DILocation(line: 34, column: 38, scope: !23)
!171 = !{!172, !173, i64 4}
!172 = !{!"xdp_md", !173, i64 0, !173, i64 4, !173, i64 8, !173, i64 12, !173, i64 16}
!173 = !{!"int", !174, i64 0}
!174 = !{!"omnipotent char", !175, i64 0}
!175 = !{!"Simple C/C++ TBAA"}
!176 = !DILocation(line: 34, column: 27, scope: !23)
!177 = !DILocation(line: 34, column: 19, scope: !23)
!178 = !DILocation(line: 35, column: 34, scope: !23)
!179 = !{!172, !173, i64 0}
!180 = !DILocation(line: 35, column: 23, scope: !23)
!181 = !DILocation(line: 35, column: 15, scope: !23)
!182 = !DILocalVariable(name: "nh", arg: 1, scope: !183, file: !59, line: 124, type: !186)
!183 = distinct !DISubprogram(name: "parse_ethhdr", scope: !59, file: !59, line: 124, type: !184, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !188)
!184 = !DISubroutineType(types: !185)
!185 = !{!26, !186, !15, !187}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!188 = !{!182, !189, !190}
!189 = !DILocalVariable(name: "data_end", arg: 2, scope: !183, file: !59, line: 125, type: !15)
!190 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !183, file: !59, line: 126, type: !187)
!191 = !DILocation(line: 0, scope: !183, inlinedAt: !192)
!192 = distinct !DILocation(line: 38, column: 13, scope: !23)
!193 = !DILocalVariable(name: "nh", arg: 1, scope: !194, file: !59, line: 79, type: !186)
!194 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !59, file: !59, line: 79, type: !195, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !202)
!195 = !DISubroutineType(types: !196)
!196 = !{!26, !186, !15, !187, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !59, line: 64, size: 32, elements: !199)
!199 = !{!200}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !198, file: !59, line: 65, baseType: !201, size: 32)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !125)
!202 = !{!193, !203, !204, !205, !206, !207, !208, !214, !215}
!203 = !DILocalVariable(name: "data_end", arg: 2, scope: !194, file: !59, line: 80, type: !15)
!204 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !194, file: !59, line: 81, type: !187)
!205 = !DILocalVariable(name: "vlans", arg: 4, scope: !194, file: !59, line: 82, type: !197)
!206 = !DILocalVariable(name: "eth", scope: !194, file: !59, line: 84, type: !42)
!207 = !DILocalVariable(name: "hdrsize", scope: !194, file: !59, line: 85, type: !26)
!208 = !DILocalVariable(name: "vlh", scope: !194, file: !59, line: 86, type: !209)
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!210 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !59, line: 42, size: 32, elements: !211)
!211 = !{!212, !213}
!212 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !210, file: !59, line: 43, baseType: !53, size: 16)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !210, file: !59, line: 44, baseType: !53, size: 16, offset: 16)
!214 = !DILocalVariable(name: "h_proto", scope: !194, file: !59, line: 87, type: !17)
!215 = !DILocalVariable(name: "i", scope: !194, file: !59, line: 88, type: !26)
!216 = !DILocation(line: 0, scope: !194, inlinedAt: !217)
!217 = distinct !DILocation(line: 129, column: 9, scope: !183, inlinedAt: !192)
!218 = !DILocation(line: 93, column: 14, scope: !219, inlinedAt: !217)
!219 = distinct !DILexicalBlock(scope: !194, file: !59, line: 93, column: 6)
!220 = !DILocation(line: 93, column: 24, scope: !219, inlinedAt: !217)
!221 = !DILocation(line: 93, column: 6, scope: !194, inlinedAt: !217)
!222 = !DILocation(line: 99, column: 17, scope: !194, inlinedAt: !217)
!223 = !{!224, !224, i64 0}
!224 = !{!"short", !174, i64 0}
!225 = !DILocalVariable(name: "h_proto", arg: 1, scope: !226, file: !59, line: 68, type: !17)
!226 = distinct !DISubprogram(name: "proto_is_vlan", scope: !59, file: !59, line: 68, type: !227, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !229)
!227 = !DISubroutineType(types: !228)
!228 = !{!26, !17}
!229 = !{!225}
!230 = !DILocation(line: 0, scope: !226, inlinedAt: !231)
!231 = distinct !DILocation(line: 106, column: 8, scope: !232, inlinedAt: !217)
!232 = distinct !DILexicalBlock(scope: !233, file: !59, line: 106, column: 7)
!233 = distinct !DILexicalBlock(scope: !234, file: !59, line: 105, column: 39)
!234 = distinct !DILexicalBlock(scope: !235, file: !59, line: 105, column: 2)
!235 = distinct !DILexicalBlock(scope: !194, file: !59, line: 105, column: 2)
!236 = !DILocation(line: 70, column: 20, scope: !226, inlinedAt: !231)
!237 = !DILocation(line: 70, column: 46, scope: !226, inlinedAt: !231)
!238 = !DILocation(line: 106, column: 8, scope: !232, inlinedAt: !217)
!239 = !DILocation(line: 106, column: 7, scope: !233, inlinedAt: !217)
!240 = !DILocation(line: 112, column: 18, scope: !233, inlinedAt: !217)
!241 = !DILocation(line: 44, column: 15, scope: !64)
!242 = !DILocation(line: 44, column: 6, scope: !23)
!243 = !DILocation(line: 0, scope: !63)
!244 = !DILocation(line: 48, column: 11, scope: !245)
!245 = distinct !DILexicalBlock(scope: !63, file: !3, line: 48, column: 7)
!246 = !DILocation(line: 48, column: 17, scope: !245)
!247 = !DILocation(line: 48, column: 15, scope: !245)
!248 = !DILocation(line: 48, column: 7, scope: !63)
!249 = !DILocation(line: 51, column: 18, scope: !63)
!250 = !DILocation(line: 51, column: 22, scope: !63)
!251 = !DILocation(line: 53, column: 14, scope: !252)
!252 = distinct !DILexicalBlock(scope: !63, file: !3, line: 53, column: 6)
!253 = !DILocation(line: 53, column: 6, scope: !63)
!254 = !DILocation(line: 57, column: 14, scope: !255)
!255 = distinct !DILexicalBlock(scope: !63, file: !3, line: 57, column: 7)
!256 = !DILocation(line: 57, column: 24, scope: !255)
!257 = !DILocation(line: 57, column: 7, scope: !63)
!258 = !DILocation(line: 61, column: 11, scope: !259)
!259 = distinct !DILexicalBlock(scope: !63, file: !3, line: 61, column: 6)
!260 = !{!261, !174, i64 9}
!261 = !{!"iphdr", !174, i64 0, !174, i64 0, !174, i64 1, !224, i64 2, !224, i64 4, !224, i64 6, !174, i64 8, !174, i64 9, !224, i64 10, !174, i64 12}
!262 = !DILocation(line: 61, column: 20, scope: !259)
!263 = !DILocation(line: 61, column: 6, scope: !63)
!264 = !DILocation(line: 63, column: 18, scope: !63)
!265 = !{!174, !174, i64 0}
!266 = !DILocation(line: 63, column: 11, scope: !63)
!267 = !{!173, !173, i64 0}
!268 = !DILocation(line: 66, column: 3, scope: !63)
!269 = !DILocation(line: 66, column: 9, scope: !63)
!270 = !DILocation(line: 68, column: 9, scope: !63)
!271 = !DILocation(line: 69, column: 3, scope: !272)
!272 = distinct !DILexicalBlock(scope: !63, file: !3, line: 69, column: 3)
!273 = !DILocation(line: 70, column: 6, scope: !274)
!274 = distinct !DILexicalBlock(scope: !63, file: !3, line: 70, column: 6)
!275 = !DILocation(line: 70, column: 6, scope: !63)
!276 = !DILocation(line: 70, column: 11, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !3, line: 70, column: 11)
!278 = distinct !DILexicalBlock(scope: !274, file: !3, line: 70, column: 10)
!279 = !DILocation(line: 72, column: 14, scope: !280)
!280 = distinct !DILexicalBlock(scope: !63, file: !3, line: 72, column: 6)
!281 = !DILocation(line: 72, column: 19, scope: !280)
!282 = !DILocation(line: 72, column: 6, scope: !63)
!283 = !DILocation(line: 73, column: 12, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !3, line: 72, column: 25)
!285 = !DILocation(line: 74, column: 7, scope: !286)
!286 = distinct !DILexicalBlock(scope: !284, file: !3, line: 74, column: 7)
!287 = !DILocation(line: 74, column: 7, scope: !284)
!288 = !DILocation(line: 75, column: 14, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !3, line: 74, column: 14)
!290 = !{!291, !291, i64 0}
!291 = !{!"long long", !174, i64 0}
!292 = !DILocation(line: 75, column: 21, scope: !289)
!293 = !DILocation(line: 75, column: 12, scope: !289)
!294 = !DILocation(line: 76, column: 5, scope: !289)
!295 = !DILocation(line: 77, column: 4, scope: !289)
!296 = !DILocation(line: 80, column: 7, scope: !63)
!297 = !DILocation(line: 81, column: 11, scope: !63)
!298 = !DILocation(line: 82, column: 6, scope: !299)
!299 = distinct !DILexicalBlock(scope: !63, file: !3, line: 82, column: 6)
!300 = !DILocation(line: 82, column: 6, scope: !63)
!301 = !DILocation(line: 83, column: 13, scope: !302)
!302 = distinct !DILexicalBlock(scope: !299, file: !3, line: 82, column: 13)
!303 = !DILocation(line: 83, column: 20, scope: !302)
!304 = !DILocation(line: 83, column: 11, scope: !302)
!305 = !DILocation(line: 84, column: 4, scope: !302)
!306 = !DILocation(line: 85, column: 3, scope: !302)
!307 = !DILocation(line: 87, column: 2, scope: !64)
!308 = !DILocation(line: 93, column: 1, scope: !23)
