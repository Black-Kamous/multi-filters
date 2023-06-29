; ModuleID = 'raw_hc.c'
source_filename = "raw_hc.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.1 = type { [13 x i32]*, i32*, [65535 x i32]*, [0 x %struct.inner_map*] }
%struct.inner_map = type { [1 x i32]*, [8 x i32]*, i32*, i32* }
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
@stats_map = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !27
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !21
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.1* @main_map to i8*), i8* bitcast (%struct.anon.2* @stats_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !95 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !107, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 2, metadata !108, metadata !DIExpression()), !dbg !171
  %5 = bitcast i32* %2 to i8*, !dbg !172
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #5, !dbg !172
  %6 = bitcast i32* %3 to i8*, !dbg !173
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #5, !dbg !173
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !171
  store i32 0, i32* %3, align 4, !dbg !174, !tbaa !175
  call void @llvm.dbg.value(metadata i64* null, metadata !126, metadata !DIExpression()), !dbg !171
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !179
  %8 = load i32, i32* %7, align 4, !dbg !179, !tbaa !180
  %9 = zext i32 %8 to i64, !dbg !182
  %10 = inttoptr i64 %9 to i8*, !dbg !183
  call void @llvm.dbg.value(metadata i8* %10, metadata !127, metadata !DIExpression()), !dbg !171
  %11 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !184
  %12 = load i32, i32* %11, align 4, !dbg !184, !tbaa !185
  %13 = zext i32 %12 to i64, !dbg !186
  %14 = inttoptr i64 %13 to i8*, !dbg !187
  call void @llvm.dbg.value(metadata i8* %14, metadata !128, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i8* %14, metadata !129, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !111, metadata !DIExpression(DW_OP_deref)), !dbg !171
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !188, metadata !DIExpression()) #5, !dbg !197
  call void @llvm.dbg.value(metadata i8* %10, metadata !195, metadata !DIExpression()) #5, !dbg !197
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !196, metadata !DIExpression()) #5, !dbg !197
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !199, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i8* %10, metadata !209, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !210, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !211, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i8* %14, metadata !212, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i32 14, metadata !213, metadata !DIExpression()) #5, !dbg !222
  %15 = getelementptr i8, i8* %14, i64 14, !dbg !224
  %16 = icmp ugt i8* %15, %10, !dbg !226
  br i1 %16, label %95, label %17, !dbg !227

17:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %14, metadata !212, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i8* %15, metadata !129, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i8* %15, metadata !214, metadata !DIExpression()) #5, !dbg !222
  %18 = getelementptr inbounds i8, i8* %14, i64 12, !dbg !228
  %19 = bitcast i8* %18 to i16*, !dbg !228
  call void @llvm.dbg.value(metadata i16 undef, metadata !220, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i32 0, metadata !221, metadata !DIExpression()) #5, !dbg !222
  %20 = load i16, i16* %19, align 1, !dbg !222, !tbaa !229
  call void @llvm.dbg.value(metadata i16 %20, metadata !220, metadata !DIExpression()) #5, !dbg !222
  %21 = inttoptr i64 %9 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %20, metadata !231, metadata !DIExpression()) #5, !dbg !236
  %22 = icmp eq i16 %20, 129, !dbg !242
  %23 = icmp eq i16 %20, -22392, !dbg !243
  %24 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %22) #5
  %25 = or i1 %23, %24, !dbg !243
  %26 = xor i1 %25, true, !dbg !244
  %27 = getelementptr i8, i8* %14, i64 18
  %28 = bitcast i8* %27 to %struct.vlan_hdr*
  %29 = icmp ugt %struct.vlan_hdr* %28, %21
  %30 = select i1 %26, i1 true, i1 %29, !dbg !245
  br i1 %30, label %48, label %31, !dbg !245

31:                                               ; preds = %17
  call void @llvm.dbg.value(metadata i16 undef, metadata !220, metadata !DIExpression()) #5, !dbg !222
  %32 = getelementptr i8, i8* %14, i64 16, !dbg !246
  %33 = bitcast i8* %32 to i16*, !dbg !246
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %28, metadata !214, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i32 1, metadata !221, metadata !DIExpression()) #5, !dbg !222
  %34 = load i16, i16* %33, align 1, !dbg !222, !tbaa !229
  call void @llvm.dbg.value(metadata i16 %34, metadata !220, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i16 %34, metadata !231, metadata !DIExpression()) #5, !dbg !236
  %35 = icmp eq i16 %34, 129, !dbg !242
  %36 = icmp eq i16 %34, -22392, !dbg !243
  %37 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %35) #5
  %38 = or i1 %36, %37, !dbg !243
  %39 = xor i1 %38, true, !dbg !244
  %40 = getelementptr i8, i8* %14, i64 22
  %41 = bitcast i8* %40 to %struct.vlan_hdr*
  %42 = icmp ugt %struct.vlan_hdr* %41, %21
  %43 = select i1 %39, i1 true, i1 %42, !dbg !245
  br i1 %43, label %48, label %44, !dbg !245

44:                                               ; preds = %31
  call void @llvm.dbg.value(metadata i16 undef, metadata !220, metadata !DIExpression()) #5, !dbg !222
  %45 = getelementptr i8, i8* %14, i64 20, !dbg !246
  %46 = bitcast i8* %45 to i16*, !dbg !246
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %41, metadata !214, metadata !DIExpression()) #5, !dbg !222
  call void @llvm.dbg.value(metadata i32 2, metadata !221, metadata !DIExpression()) #5, !dbg !222
  %47 = load i16, i16* %46, align 1, !dbg !222, !tbaa !229
  call void @llvm.dbg.value(metadata i16 %47, metadata !220, metadata !DIExpression()) #5, !dbg !222
  br label %48

48:                                               ; preds = %17, %31, %44
  %49 = phi i8* [ %15, %17 ], [ %27, %31 ], [ %40, %44 ], !dbg !222
  %50 = phi i16 [ %20, %17 ], [ %34, %31 ], [ %47, %44 ], !dbg !222
  call void @llvm.dbg.value(metadata i8* %49, metadata !129, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i16 %50, metadata !109, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !171
  %51 = icmp eq i16 %50, 8, !dbg !247
  br i1 %51, label %52, label %86, !dbg !248

52:                                               ; preds = %48
  call void @llvm.dbg.value(metadata i8* %49, metadata !134, metadata !DIExpression()), !dbg !249
  %53 = bitcast i32* %4 to i8*, !dbg !250
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %53) #5, !dbg !250
  call void @llvm.dbg.value(metadata i32 255, metadata !167, metadata !DIExpression()), !dbg !249
  %54 = getelementptr inbounds i8, i8* %49, i64 20, !dbg !251
  %55 = bitcast i8* %54 to %struct.iphdr*, !dbg !251
  %56 = inttoptr i64 %9 to %struct.iphdr*, !dbg !253
  %57 = icmp ugt %struct.iphdr* %55, %56, !dbg !254
  br i1 %57, label %83, label %58, !dbg !255

58:                                               ; preds = %52
  %59 = load i8, i8* %49, align 4, !dbg !256
  %60 = shl i8 %59, 2, !dbg !257
  %61 = and i8 %60, 60, !dbg !257
  call void @llvm.dbg.value(metadata i8 %61, metadata !166, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !249
  %62 = icmp ult i8 %61, 20, !dbg !258
  br i1 %62, label %83, label %63, !dbg !260

63:                                               ; preds = %58
  %64 = zext i8 %61 to i64
  call void @llvm.dbg.value(metadata i64 %64, metadata !166, metadata !DIExpression()), !dbg !249
  %65 = getelementptr i8, i8* %49, i64 %64, !dbg !261
  %66 = icmp ugt i8* %65, %10, !dbg !263
  br i1 %66, label %83, label %67, !dbg !264

67:                                               ; preds = %63
  call void @llvm.dbg.value(metadata i8* %65, metadata !129, metadata !DIExpression()), !dbg !171
  %68 = getelementptr inbounds i8, i8* %49, i64 8, !dbg !265
  %69 = load i8, i8* %68, align 4, !dbg !265, !tbaa !266
  %70 = zext i8 %69 to i32, !dbg !268
  call void @llvm.dbg.value(metadata i32 %70, metadata !167, metadata !DIExpression()), !dbg !249
  store i32 %70, i32* %4, align 4, !dbg !269, !tbaa !175
  %71 = getelementptr inbounds i8, i8* %49, i64 12, !dbg !270
  %72 = bitcast i8* %71 to i32*, !dbg !270
  %73 = load i32, i32* %72, align 4, !dbg !270, !tbaa !271
  call void @llvm.dbg.value(metadata i32 %73, metadata !110, metadata !DIExpression()), !dbg !171
  store i32 %73, i32* %2, align 4, !dbg !272, !tbaa !175
  call void @llvm.dbg.value(metadata %struct.inner_map* null, metadata !168, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i32* %2, metadata !110, metadata !DIExpression(DW_OP_deref)), !dbg !171
  %74 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.1* @main_map to i8*), i8* noundef nonnull %5) #5, !dbg !273
  call void @llvm.dbg.value(metadata i8* %74, metadata !168, metadata !DIExpression()), !dbg !249
  %75 = icmp eq i8* %74, null, !dbg !274
  br i1 %75, label %84, label %76, !dbg !276

76:                                               ; preds = %67
  call void @llvm.dbg.value(metadata i32* %4, metadata !167, metadata !DIExpression(DW_OP_deref)), !dbg !249
  %77 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef nonnull %74, i8* noundef nonnull %53) #5, !dbg !277
  call void @llvm.dbg.value(metadata i8* %77, metadata !169, metadata !DIExpression()), !dbg !249
  %78 = icmp eq i8* %77, null, !dbg !279
  br i1 %78, label %85, label %79, !dbg !281

79:                                               ; preds = %76
  %80 = bitcast i8* %77 to i32*, !dbg !277
  call void @llvm.dbg.value(metadata i32* %80, metadata !169, metadata !DIExpression()), !dbg !249
  %81 = load i32, i32* %80, align 4, !dbg !282, !tbaa !175
  %82 = icmp eq i32 %81, 1, !dbg !283
  br i1 %82, label %84, label %85, !dbg !284

83:                                               ; preds = %52, %58, %63
  call void @llvm.dbg.value(metadata i32 1, metadata !108, metadata !DIExpression()), !dbg !171
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %53) #5, !dbg !285
  br label %95

84:                                               ; preds = %79, %67
  call void @llvm.dbg.value(metadata i32 1, metadata !108, metadata !DIExpression()), !dbg !171
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %53) #5, !dbg !285
  call void @llvm.dbg.label(metadata !170), !dbg !286
  br label %86, !dbg !287

85:                                               ; preds = %79, %76
  call void @llvm.dbg.value(metadata i32 1, metadata !108, metadata !DIExpression()), !dbg !171
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %53) #5, !dbg !285
  call void @llvm.dbg.label(metadata !170), !dbg !286
  call void @llvm.dbg.value(metadata i32 1, metadata !125, metadata !DIExpression()), !dbg !171
  store i32 1, i32* %3, align 4, !dbg !288, !tbaa !175
  br label %86, !dbg !290

86:                                               ; preds = %48, %84, %85
  %87 = phi i32 [ 1, %85 ], [ 2, %84 ], [ 2, %48 ]
  call void @llvm.dbg.value(metadata i32* %3, metadata !125, metadata !DIExpression(DW_OP_deref)), !dbg !171
  %88 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %6) #5, !dbg !291
  %89 = bitcast i8* %88 to i64*, !dbg !291
  call void @llvm.dbg.value(metadata i64* %89, metadata !126, metadata !DIExpression()), !dbg !171
  %90 = icmp eq i8* %88, null, !dbg !292
  br i1 %90, label %95, label %91, !dbg !294

91:                                               ; preds = %86
  %92 = load i64, i64* %89, align 8, !dbg !295, !tbaa !297
  %93 = add i64 %92, 1, !dbg !299
  store i64 %93, i64* %89, align 8, !dbg !300, !tbaa !297
  call void @llvm.dbg.value(metadata i32* %3, metadata !125, metadata !DIExpression(DW_OP_deref)), !dbg !171
  %94 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %6, i8* noundef nonnull %88, i64 noundef 0) #5, !dbg !301
  br label %95, !dbg !302

95:                                               ; preds = %1, %83, %86, %91
  %96 = phi i32 [ %87, %91 ], [ %87, %86 ], [ 0, %83 ], [ 0, %1 ], !dbg !171
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #5, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #5, !dbg !303
  ret i32 %96, !dbg !303
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!90, !91, !92, !93}
!llvm.ident = !{!94}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "main_map", scope: !2, file: !3, line: 28, type: !58, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "raw_hc.c", directory: "/root/anti-ddos-firewall/hc_filter", checksumkind: CSK_MD5, checksum: "4b427fa4222dd6bd7b640bfac749a8c8")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/anti-ddos-firewall/hc_filter", checksumkind: CSK_MD5, checksum: "db1ce4e5e29770657167bc8f57af9388")
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
!20 = !{!21, !0, !27, !45, !53}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 120, type: !23, isLocal: false, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 32, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 4)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "stats_map", scope: !2, file: !3, line: 35, type: !29, isLocal: false, isDefinition: true)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 30, size: 256, elements: !30)
!30 = !{!31, !37, !40, !44}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !29, file: !3, line: 31, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 64, elements: !35)
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !{!36}
!36 = !DISubrange(count: 2)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !29, file: !3, line: 32, baseType: !38, size: 64, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !29, file: !3, line: 33, baseType: !41, size: 64, offset: 128)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !18, line: 31, baseType: !43)
!43 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !29, file: !3, line: 34, baseType: !32, size: 64, offset: 192)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !47, line: 55, type: !48, isLocal: true, isDefinition: true)
!47 = !DIFile(filename: "../../multi-filters/lib/libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/anti-ddos-firewall/hc_filter", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DISubroutineType(types: !50)
!50 = !{!15, !15, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !47, line: 77, type: !55, isLocal: true, isDefinition: true)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DISubroutineType(types: !57)
!57 = !{!16, !15, !51, !51, !42}
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 22, size: 192, elements: !59)
!59 = !{!60, !65, !66, !71}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !58, file: !3, line: 23, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 416, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 13)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !58, file: !3, line: 24, baseType: !38, size: 64, offset: 64)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !58, file: !3, line: 26, baseType: !67, size: 64, offset: 128)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 2097120, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 65535)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !58, file: !3, line: 27, baseType: !72, offset: 192)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !73, elements: !88)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "inner_map", file: !3, line: 15, size: 256, elements: !75)
!75 = !{!76, !81, !86, !87}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !74, file: !3, line: 16, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 32, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 1)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !74, file: !3, line: 17, baseType: !82, size: 64, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 256, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 8)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !74, file: !3, line: 18, baseType: !38, size: 64, offset: 128)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !74, file: !3, line: 19, baseType: !38, size: 64, offset: 192)
!88 = !{!89}
!89 = !DISubrange(count: -1)
!90 = !{i32 7, !"Dwarf Version", i32 5}
!91 = !{i32 2, !"Debug Info Version", i32 3}
!92 = !{i32 1, !"wchar_size", i32 4}
!93 = !{i32 7, !"frame-pointer", i32 2}
!94 = !{!"Ubuntu clang version 14.0.6"}
!95 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 49, type: !96, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !106)
!96 = !DISubroutineType(types: !97)
!97 = !{!34, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !100)
!100 = !{!101, !102, !103, !104, !105}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !99, file: !6, line: 2857, baseType: !39, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !99, file: !6, line: 2858, baseType: !39, size: 32, offset: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !99, file: !6, line: 2859, baseType: !39, size: 32, offset: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !99, file: !6, line: 2861, baseType: !39, size: 32, offset: 96)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !99, file: !6, line: 2862, baseType: !39, size: 32, offset: 128)
!106 = !{!107, !108, !109, !110, !111, !125, !126, !127, !128, !129, !134, !166, !167, !168, !169, !170}
!107 = !DILocalVariable(name: "ctx", arg: 1, scope: !95, file: !3, line: 49, type: !98)
!108 = !DILocalVariable(name: "action", scope: !95, file: !3, line: 51, type: !34)
!109 = !DILocalVariable(name: "eth_type", scope: !95, file: !3, line: 52, type: !34)
!110 = !DILocalVariable(name: "saddrv4", scope: !95, file: !3, line: 53, type: !39)
!111 = !DILocalVariable(name: "eth", scope: !95, file: !3, line: 54, type: !112)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !114, line: 168, size: 112, elements: !115)
!114 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!115 = !{!116, !121, !122}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !113, file: !114, line: 169, baseType: !117, size: 48)
!117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !118, size: 48, elements: !119)
!118 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!119 = !{!120}
!120 = !DISubrange(count: 6)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !113, file: !114, line: 170, baseType: !117, size: 48, offset: 48)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !113, file: !114, line: 171, baseType: !123, size: 16, offset: 96)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !124, line: 25, baseType: !17)
!124 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!125 = !DILocalVariable(name: "stk", scope: !95, file: !3, line: 55, type: !39)
!126 = !DILocalVariable(name: "stptr", scope: !95, file: !3, line: 56, type: !41)
!127 = !DILocalVariable(name: "data_end", scope: !95, file: !3, line: 57, type: !15)
!128 = !DILocalVariable(name: "data", scope: !95, file: !3, line: 58, type: !15)
!129 = !DILocalVariable(name: "nh", scope: !95, file: !3, line: 59, type: !130)
!130 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !131, line: 33, size: 64, elements: !132)
!131 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/anti-ddos-firewall/hc_filter", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!132 = !{!133}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !130, file: !131, line: 34, baseType: !15, size: 64)
!134 = !DILocalVariable(name: "iph", scope: !135, file: !3, line: 67, type: !137)
!135 = distinct !DILexicalBlock(scope: !136, file: !3, line: 66, column: 39)
!136 = distinct !DILexicalBlock(scope: !95, file: !3, line: 66, column: 6)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !139, line: 87, size: 160, elements: !140)
!139 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!140 = !{!141, !143, !144, !145, !146, !147, !148, !149, !150, !152}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !138, file: !139, line: 89, baseType: !142, size: 4, flags: DIFlagBitField, extraData: i64 0)
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !118)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !138, file: !139, line: 90, baseType: !142, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !138, file: !139, line: 97, baseType: !142, size: 8, offset: 8)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !138, file: !139, line: 98, baseType: !123, size: 16, offset: 16)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !138, file: !139, line: 99, baseType: !123, size: 16, offset: 32)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !138, file: !139, line: 100, baseType: !123, size: 16, offset: 48)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !138, file: !139, line: 101, baseType: !142, size: 8, offset: 64)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !138, file: !139, line: 102, baseType: !142, size: 8, offset: 72)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !138, file: !139, line: 103, baseType: !151, size: 16, offset: 80)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !124, line: 31, baseType: !17)
!152 = !DIDerivedType(tag: DW_TAG_member, scope: !138, file: !139, line: 104, baseType: !153, size: 64, offset: 96)
!153 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !138, file: !139, line: 104, size: 64, elements: !154)
!154 = !{!155, !161}
!155 = !DIDerivedType(tag: DW_TAG_member, scope: !153, file: !139, line: 104, baseType: !156, size: 64)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !153, file: !139, line: 104, size: 64, elements: !157)
!157 = !{!158, !160}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !156, file: !139, line: 104, baseType: !159, size: 32)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !124, line: 27, baseType: !39)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !156, file: !139, line: 104, baseType: !159, size: 32, offset: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !153, file: !139, line: 104, baseType: !162, size: 64)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !153, file: !139, line: 104, size: 64, elements: !163)
!163 = !{!164, !165}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !162, file: !139, line: 104, baseType: !159, size: 32)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !162, file: !139, line: 104, baseType: !159, size: 32, offset: 32)
!166 = !DILocalVariable(name: "hdrsize", scope: !135, file: !3, line: 68, type: !34)
!167 = !DILocalVariable(name: "ttl", scope: !135, file: !3, line: 69, type: !39)
!168 = !DILocalVariable(name: "res", scope: !135, file: !3, line: 87, type: !73)
!169 = !DILocalVariable(name: "ttlp", scope: !135, file: !3, line: 90, type: !38)
!170 = !DILabel(scope: !95, name: "out", file: !3, line: 108)
!171 = !DILocation(line: 0, scope: !95)
!172 = !DILocation(line: 53, column: 2, scope: !95)
!173 = !DILocation(line: 55, column: 2, scope: !95)
!174 = !DILocation(line: 55, column: 8, scope: !95)
!175 = !{!176, !176, i64 0}
!176 = !{!"int", !177, i64 0}
!177 = !{!"omnipotent char", !178, i64 0}
!178 = !{!"Simple C/C++ TBAA"}
!179 = !DILocation(line: 57, column: 38, scope: !95)
!180 = !{!181, !176, i64 4}
!181 = !{!"xdp_md", !176, i64 0, !176, i64 4, !176, i64 8, !176, i64 12, !176, i64 16}
!182 = !DILocation(line: 57, column: 27, scope: !95)
!183 = !DILocation(line: 57, column: 19, scope: !95)
!184 = !DILocation(line: 58, column: 34, scope: !95)
!185 = !{!181, !176, i64 0}
!186 = !DILocation(line: 58, column: 23, scope: !95)
!187 = !DILocation(line: 58, column: 15, scope: !95)
!188 = !DILocalVariable(name: "nh", arg: 1, scope: !189, file: !131, line: 124, type: !192)
!189 = distinct !DISubprogram(name: "parse_ethhdr", scope: !131, file: !131, line: 124, type: !190, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !194)
!190 = !DISubroutineType(types: !191)
!191 = !{!34, !192, !15, !193}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!194 = !{!188, !195, !196}
!195 = !DILocalVariable(name: "data_end", arg: 2, scope: !189, file: !131, line: 125, type: !15)
!196 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !189, file: !131, line: 126, type: !193)
!197 = !DILocation(line: 0, scope: !189, inlinedAt: !198)
!198 = distinct !DILocation(line: 61, column: 13, scope: !95)
!199 = !DILocalVariable(name: "nh", arg: 1, scope: !200, file: !131, line: 79, type: !192)
!200 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !131, file: !131, line: 79, type: !201, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !208)
!201 = !DISubroutineType(types: !202)
!202 = !{!34, !192, !15, !193, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !131, line: 64, size: 32, elements: !205)
!205 = !{!206}
!206 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !204, file: !131, line: 65, baseType: !207, size: 32)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !35)
!208 = !{!199, !209, !210, !211, !212, !213, !214, !220, !221}
!209 = !DILocalVariable(name: "data_end", arg: 2, scope: !200, file: !131, line: 80, type: !15)
!210 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !200, file: !131, line: 81, type: !193)
!211 = !DILocalVariable(name: "vlans", arg: 4, scope: !200, file: !131, line: 82, type: !203)
!212 = !DILocalVariable(name: "eth", scope: !200, file: !131, line: 84, type: !112)
!213 = !DILocalVariable(name: "hdrsize", scope: !200, file: !131, line: 85, type: !34)
!214 = !DILocalVariable(name: "vlh", scope: !200, file: !131, line: 86, type: !215)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !131, line: 42, size: 32, elements: !217)
!217 = !{!218, !219}
!218 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !216, file: !131, line: 43, baseType: !123, size: 16)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !216, file: !131, line: 44, baseType: !123, size: 16, offset: 16)
!220 = !DILocalVariable(name: "h_proto", scope: !200, file: !131, line: 87, type: !17)
!221 = !DILocalVariable(name: "i", scope: !200, file: !131, line: 88, type: !34)
!222 = !DILocation(line: 0, scope: !200, inlinedAt: !223)
!223 = distinct !DILocation(line: 129, column: 9, scope: !189, inlinedAt: !198)
!224 = !DILocation(line: 93, column: 14, scope: !225, inlinedAt: !223)
!225 = distinct !DILexicalBlock(scope: !200, file: !131, line: 93, column: 6)
!226 = !DILocation(line: 93, column: 24, scope: !225, inlinedAt: !223)
!227 = !DILocation(line: 93, column: 6, scope: !200, inlinedAt: !223)
!228 = !DILocation(line: 99, column: 17, scope: !200, inlinedAt: !223)
!229 = !{!230, !230, i64 0}
!230 = !{!"short", !177, i64 0}
!231 = !DILocalVariable(name: "h_proto", arg: 1, scope: !232, file: !131, line: 68, type: !17)
!232 = distinct !DISubprogram(name: "proto_is_vlan", scope: !131, file: !131, line: 68, type: !233, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !235)
!233 = !DISubroutineType(types: !234)
!234 = !{!34, !17}
!235 = !{!231}
!236 = !DILocation(line: 0, scope: !232, inlinedAt: !237)
!237 = distinct !DILocation(line: 106, column: 8, scope: !238, inlinedAt: !223)
!238 = distinct !DILexicalBlock(scope: !239, file: !131, line: 106, column: 7)
!239 = distinct !DILexicalBlock(scope: !240, file: !131, line: 105, column: 39)
!240 = distinct !DILexicalBlock(scope: !241, file: !131, line: 105, column: 2)
!241 = distinct !DILexicalBlock(scope: !200, file: !131, line: 105, column: 2)
!242 = !DILocation(line: 70, column: 20, scope: !232, inlinedAt: !237)
!243 = !DILocation(line: 70, column: 46, scope: !232, inlinedAt: !237)
!244 = !DILocation(line: 106, column: 8, scope: !238, inlinedAt: !223)
!245 = !DILocation(line: 106, column: 7, scope: !239, inlinedAt: !223)
!246 = !DILocation(line: 112, column: 18, scope: !239, inlinedAt: !223)
!247 = !DILocation(line: 66, column: 15, scope: !136)
!248 = !DILocation(line: 66, column: 6, scope: !95)
!249 = !DILocation(line: 0, scope: !135)
!250 = !DILocation(line: 69, column: 3, scope: !135)
!251 = !DILocation(line: 71, column: 11, scope: !252)
!252 = distinct !DILexicalBlock(scope: !135, file: !3, line: 71, column: 7)
!253 = !DILocation(line: 71, column: 17, scope: !252)
!254 = !DILocation(line: 71, column: 15, scope: !252)
!255 = !DILocation(line: 71, column: 7, scope: !135)
!256 = !DILocation(line: 74, column: 18, scope: !135)
!257 = !DILocation(line: 74, column: 22, scope: !135)
!258 = !DILocation(line: 76, column: 14, scope: !259)
!259 = distinct !DILexicalBlock(scope: !135, file: !3, line: 76, column: 6)
!260 = !DILocation(line: 76, column: 6, scope: !135)
!261 = !DILocation(line: 80, column: 14, scope: !262)
!262 = distinct !DILexicalBlock(scope: !135, file: !3, line: 80, column: 7)
!263 = !DILocation(line: 80, column: 24, scope: !262)
!264 = !DILocation(line: 80, column: 7, scope: !135)
!265 = !DILocation(line: 84, column: 14, scope: !135)
!266 = !{!267, !177, i64 8}
!267 = !{!"iphdr", !177, i64 0, !177, i64 0, !177, i64 1, !230, i64 2, !230, i64 4, !230, i64 6, !177, i64 8, !177, i64 9, !230, i64 10, !177, i64 12}
!268 = !DILocation(line: 84, column: 9, scope: !135)
!269 = !DILocation(line: 84, column: 7, scope: !135)
!270 = !DILocation(line: 85, column: 18, scope: !135)
!271 = !{!177, !177, i64 0}
!272 = !DILocation(line: 85, column: 11, scope: !135)
!273 = !DILocation(line: 88, column: 15, scope: !135)
!274 = !DILocation(line: 91, column: 12, scope: !275)
!275 = distinct !DILexicalBlock(scope: !135, file: !3, line: 91, column: 12)
!276 = !DILocation(line: 91, column: 12, scope: !135)
!277 = !DILocation(line: 92, column: 11, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !3, line: 91, column: 16)
!279 = !DILocation(line: 94, column: 7, scope: !280)
!280 = distinct !DILexicalBlock(scope: !278, file: !3, line: 94, column: 7)
!281 = !DILocation(line: 94, column: 12, scope: !280)
!282 = !DILocation(line: 94, column: 16, scope: !280)
!283 = !DILocation(line: 94, column: 23, scope: !280)
!284 = !DILocation(line: 94, column: 7, scope: !278)
!285 = !DILocation(line: 103, column: 2, scope: !136)
!286 = !DILocation(line: 108, column: 1, scope: !95)
!287 = !DILocation(line: 110, column: 5, scope: !95)
!288 = !DILocation(line: 111, column: 7, scope: !289)
!289 = distinct !DILexicalBlock(scope: !95, file: !3, line: 110, column: 5)
!290 = !DILocation(line: 111, column: 3, scope: !289)
!291 = !DILocation(line: 112, column: 10, scope: !95)
!292 = !DILocation(line: 113, column: 5, scope: !293)
!293 = distinct !DILexicalBlock(scope: !95, file: !3, line: 113, column: 5)
!294 = !DILocation(line: 113, column: 5, scope: !95)
!295 = !DILocation(line: 114, column: 12, scope: !296)
!296 = distinct !DILexicalBlock(scope: !293, file: !3, line: 113, column: 12)
!297 = !{!298, !298, i64 0}
!298 = !{!"long long", !177, i64 0}
!299 = !DILocation(line: 114, column: 19, scope: !296)
!300 = !DILocation(line: 114, column: 10, scope: !296)
!301 = !DILocation(line: 115, column: 3, scope: !296)
!302 = !DILocation(line: 116, column: 2, scope: !296)
!303 = !DILocation(line: 118, column: 1, scope: !95)
