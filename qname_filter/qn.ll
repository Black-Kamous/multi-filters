; ModuleID = 'qn.c'
source_filename = "qn.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.1 = type { [11 x i32]*, %struct.qname_lpm_key*, %struct.qname_lpm_key*, [1 x i32]*, [1023 x i32]* }
%struct.qname_lpm_key = type { i32, [64 x i8] }
%struct.anon.2 = type { [2 x i32]*, i32*, i64*, [2 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.udphdr = type { i16, i16, i16, i16 }

@xdp_patch_ports_func.____fmt = internal constant [8 x i8] c"rev %s\0A\00", align 1, !dbg !0
@main_map = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !94
@xdp_patch_ports_func.____fmt.1 = internal constant [12 x i8] c"k index %d\0A\00", align 1, !dbg !78
@xdp_patch_ports_func.____fmt.2 = internal constant [16 x i8] c"matched len %d\0A\00", align 1, !dbg !84
@stats_map = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !123
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !89
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.1* @main_map to i8*), i8* bitcast (%struct.anon.2* @stats_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_patch_ports" !dbg !2 {
  %2 = alloca [64 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca %struct.qname_lpm_key, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !159, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata i32 2, metadata !160, metadata !DIExpression()), !dbg !244
  %5 = bitcast i32* %3 to i8*, !dbg !245
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #7, !dbg !245
  call void @llvm.dbg.value(metadata i32 0, metadata !176, metadata !DIExpression()), !dbg !244
  store i32 0, i32* %3, align 4, !dbg !246, !tbaa !247
  call void @llvm.dbg.value(metadata i64* null, metadata !177, metadata !DIExpression()), !dbg !244
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !251
  %7 = load i32, i32* %6, align 4, !dbg !251, !tbaa !252
  %8 = zext i32 %7 to i64, !dbg !254
  %9 = inttoptr i64 %8 to i8*, !dbg !255
  call void @llvm.dbg.value(metadata i8* %9, metadata !178, metadata !DIExpression()), !dbg !244
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !256
  %11 = load i32, i32* %10, align 4, !dbg !256, !tbaa !257
  %12 = zext i32 %11 to i64, !dbg !258
  %13 = inttoptr i64 %12 to i8*, !dbg !259
  call void @llvm.dbg.value(metadata i8* %13, metadata !179, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata i8* %13, metadata !180, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !163, metadata !DIExpression(DW_OP_deref)), !dbg !244
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !260, metadata !DIExpression()) #7, !dbg !269
  call void @llvm.dbg.value(metadata i8* %9, metadata !267, metadata !DIExpression()) #7, !dbg !269
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !268, metadata !DIExpression()) #7, !dbg !269
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !271, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i8* %9, metadata !281, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !282, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !283, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i8* %13, metadata !284, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i32 14, metadata !285, metadata !DIExpression()) #7, !dbg !294
  %14 = getelementptr i8, i8* %13, i64 14, !dbg !296
  %15 = icmp ugt i8* %14, %9, !dbg !298
  br i1 %15, label %170, label %16, !dbg !299

16:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %13, metadata !284, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i8* %14, metadata !180, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata i8* %14, metadata !286, metadata !DIExpression()) #7, !dbg !294
  %17 = getelementptr inbounds i8, i8* %13, i64 12, !dbg !300
  %18 = bitcast i8* %17 to i16*, !dbg !300
  call void @llvm.dbg.value(metadata i16 undef, metadata !292, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i32 0, metadata !293, metadata !DIExpression()) #7, !dbg !294
  %19 = load i16, i16* %18, align 1, !dbg !294, !tbaa !301
  call void @llvm.dbg.value(metadata i16 %19, metadata !292, metadata !DIExpression()) #7, !dbg !294
  %20 = inttoptr i64 %8 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %19, metadata !303, metadata !DIExpression()) #7, !dbg !308
  %21 = icmp eq i16 %19, 129, !dbg !314
  %22 = icmp eq i16 %19, -22392, !dbg !315
  %23 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %21) #7
  %24 = or i1 %22, %23, !dbg !315
  %25 = xor i1 %24, true, !dbg !316
  %26 = getelementptr i8, i8* %13, i64 18
  %27 = bitcast i8* %26 to %struct.vlan_hdr*
  %28 = icmp ugt %struct.vlan_hdr* %27, %20
  %29 = select i1 %25, i1 true, i1 %28, !dbg !317
  br i1 %29, label %47, label %30, !dbg !317

30:                                               ; preds = %16
  call void @llvm.dbg.value(metadata i16 undef, metadata !292, metadata !DIExpression()) #7, !dbg !294
  %31 = getelementptr i8, i8* %13, i64 16, !dbg !318
  %32 = bitcast i8* %31 to i16*, !dbg !318
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !286, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i32 1, metadata !293, metadata !DIExpression()) #7, !dbg !294
  %33 = load i16, i16* %32, align 1, !dbg !294, !tbaa !301
  call void @llvm.dbg.value(metadata i16 %33, metadata !292, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i16 %33, metadata !303, metadata !DIExpression()) #7, !dbg !308
  %34 = icmp eq i16 %33, 129, !dbg !314
  %35 = icmp eq i16 %33, -22392, !dbg !315
  %36 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %34) #7
  %37 = or i1 %35, %36, !dbg !315
  %38 = xor i1 %37, true, !dbg !316
  %39 = getelementptr i8, i8* %13, i64 22
  %40 = bitcast i8* %39 to %struct.vlan_hdr*
  %41 = icmp ugt %struct.vlan_hdr* %40, %20
  %42 = select i1 %38, i1 true, i1 %41, !dbg !317
  br i1 %42, label %47, label %43, !dbg !317

43:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i16 undef, metadata !292, metadata !DIExpression()) #7, !dbg !294
  %44 = getelementptr i8, i8* %13, i64 20, !dbg !318
  %45 = bitcast i8* %44 to i16*, !dbg !318
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %40, metadata !286, metadata !DIExpression()) #7, !dbg !294
  call void @llvm.dbg.value(metadata i32 2, metadata !293, metadata !DIExpression()) #7, !dbg !294
  %46 = load i16, i16* %45, align 1, !dbg !294, !tbaa !301
  call void @llvm.dbg.value(metadata i16 %46, metadata !292, metadata !DIExpression()) #7, !dbg !294
  br label %47

47:                                               ; preds = %16, %30, %43
  %48 = phi i8* [ %14, %16 ], [ %26, %30 ], [ %39, %43 ], !dbg !294
  %49 = phi i16 [ %19, %16 ], [ %33, %30 ], [ %46, %43 ], !dbg !294
  call void @llvm.dbg.value(metadata i8* %48, metadata !180, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata i16 %49, metadata !161, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !244
  %50 = icmp eq i16 %49, 8, !dbg !319
  br i1 %50, label %51, label %161, !dbg !320

51:                                               ; preds = %47
  call void @llvm.dbg.value(metadata i8* %48, metadata !185, metadata !DIExpression()), !dbg !321
  %52 = getelementptr inbounds i8, i8* %48, i64 20, !dbg !322
  %53 = bitcast i8* %52 to %struct.iphdr*, !dbg !322
  %54 = inttoptr i64 %8 to %struct.iphdr*, !dbg !324
  %55 = icmp ugt %struct.iphdr* %53, %54, !dbg !325
  br i1 %55, label %170, label %56, !dbg !326

56:                                               ; preds = %51
  %57 = load i8, i8* %48, align 4, !dbg !327
  %58 = shl i8 %57, 2, !dbg !328
  %59 = and i8 %58, 60, !dbg !328
  call void @llvm.dbg.value(metadata i8 %59, metadata !216, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !321
  %60 = icmp ult i8 %59, 20, !dbg !329
  br i1 %60, label %170, label %61, !dbg !331

61:                                               ; preds = %56
  %62 = zext i8 %59 to i64
  call void @llvm.dbg.value(metadata i64 %62, metadata !216, metadata !DIExpression()), !dbg !321
  %63 = getelementptr i8, i8* %48, i64 %62, !dbg !332
  %64 = icmp ugt i8* %63, %9, !dbg !334
  br i1 %64, label %170, label %65, !dbg !335

65:                                               ; preds = %61
  call void @llvm.dbg.value(metadata i8* %63, metadata !180, metadata !DIExpression()), !dbg !244
  %66 = getelementptr inbounds i8, i8* %48, i64 9, !dbg !336
  %67 = load i8, i8* %66, align 1, !dbg !336, !tbaa !337
  call void @llvm.dbg.value(metadata i8 %67, metadata !162, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !244
  %68 = icmp eq i8 %67, 17, !dbg !339
  br i1 %68, label %69, label %161, !dbg !340

69:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i32 -1, metadata !217, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.value(metadata i8* %63, metadata !220, metadata !DIExpression()), !dbg !341
  %70 = getelementptr inbounds i8, i8* %63, i64 8, !dbg !342
  %71 = bitcast i8* %70 to %struct.udphdr*, !dbg !342
  %72 = inttoptr i64 %8 to %struct.udphdr*, !dbg !344
  %73 = icmp ugt %struct.udphdr* %71, %72, !dbg !345
  br i1 %73, label %170, label %74, !dbg !346

74:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8* %70, metadata !180, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata i32 undef, metadata !217, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !341
  %75 = getelementptr inbounds i8, i8* %70, i64 12, !dbg !347
  %76 = icmp ugt i8* %75, %9, !dbg !349
  br i1 %76, label %161, label %77, !dbg !350

77:                                               ; preds = %74
  %78 = getelementptr inbounds i8, i8* %70, i64 4, !dbg !351
  %79 = bitcast i8* %78 to i16*, !dbg !351
  %80 = load i16, i16* %79, align 2, !dbg !352, !tbaa !301
  call void @llvm.dbg.value(metadata i16 %80, metadata !229, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.value(metadata i32 0, metadata !230, metadata !DIExpression()), !dbg !341
  %81 = icmp eq i16 %80, 0, !dbg !353
  br i1 %81, label %161, label %82, !dbg !354

82:                                               ; preds = %77
  %83 = bitcast %struct.qname_lpm_key* %4 to i8*, !dbg !355
  call void @llvm.lifetime.start.p0i8(i64 68, i8* nonnull %83) #7, !dbg !355
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %4, metadata !231, metadata !DIExpression()), !dbg !356
  tail call void @llvm.experimental.noalias.scope.decl(metadata !357), !dbg !360
  call void @llvm.dbg.value(metadata i8* %75, metadata !361, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.value(metadata i8* %9, metadata !366, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %4, metadata !367, metadata !DIExpression()) #7, !dbg !378
  %84 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 0, !dbg !378
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(68) %84, i8 0, i64 64, i1 false) #7, !dbg !378, !alias.scope !357
  call void @llvm.dbg.value(metadata i64 0, metadata !368, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.value(metadata i8 0, metadata !369, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.value(metadata i8 0, metadata !370, metadata !DIExpression()) #7, !dbg !376
  %85 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !379
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %85) #7, !dbg !379, !noalias !357
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !371, metadata !DIExpression()) #7, !dbg !380
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(64) %85, i8 0, i64 64, i1 false) #7, !dbg !380, !noalias !357
  br label %86, !dbg !381

86:                                               ; preds = %106, %82
  %87 = phi i64 [ 0, %82 ], [ %108, %106 ]
  %88 = phi i8 [ 0, %82 ], [ %107, %106 ]
  call void @llvm.dbg.value(metadata i64 %87, metadata !368, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.value(metadata i8 %88, metadata !369, metadata !DIExpression()) #7, !dbg !376
  %89 = getelementptr i8, i8* %75, i64 %87, !dbg !382
  %90 = getelementptr i8, i8* %89, i64 1, !dbg !385
  %91 = icmp ugt i8* %90, %9, !dbg !386
  br i1 %91, label %127, label %92, !dbg !387

92:                                               ; preds = %86
  %93 = sext i8 %88 to i64, !dbg !388
  %94 = icmp eq i64 %87, %93, !dbg !390
  %95 = load i8, i8* %89, align 1, !dbg !391, !tbaa !392, !noalias !357
  br i1 %94, label %96, label %104, !dbg !393

96:                                               ; preds = %92
  call void @llvm.dbg.value(metadata i8 %88, metadata !370, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.value(metadata i8 %95, metadata !369, metadata !DIExpression()) #7, !dbg !376
  %97 = icmp eq i8 %95, 0, !dbg !394
  br i1 %97, label %110, label %98, !dbg !397

98:                                               ; preds = %96
  %99 = icmp sgt i8 %95, 63, !dbg !398
  br i1 %99, label %127, label %100, !dbg !400

100:                                              ; preds = %98
  %101 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %87, !dbg !401
  store i8 46, i8* %101, align 1, !dbg !402, !tbaa !392, !noalias !357
  %102 = add i8 %88, 1, !dbg !403
  %103 = add i8 %102, %95, !dbg !404
  call void @llvm.dbg.value(metadata i8 %103, metadata !369, metadata !DIExpression()) #7, !dbg !376
  br label %106, !dbg !405

104:                                              ; preds = %92
  %105 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %87, !dbg !406
  store i8 %95, i8* %105, align 1, !dbg !408, !tbaa !392, !noalias !357
  br label %106

106:                                              ; preds = %104, %100
  %107 = phi i8 [ %103, %100 ], [ %88, %104 ], !dbg !376
  call void @llvm.dbg.value(metadata i8 %107, metadata !369, metadata !DIExpression()) #7, !dbg !376
  %108 = add nuw nsw i64 %87, 1, !dbg !409
  call void @llvm.dbg.value(metadata i64 %108, metadata !368, metadata !DIExpression()) #7, !dbg !376
  %109 = icmp eq i64 %108, 64, !dbg !410
  br i1 %109, label %127, label %86, !dbg !381, !llvm.loop !411

110:                                              ; preds = %96
  %111 = add nsw i64 %87, -1, !dbg !414
  call void @llvm.dbg.value(metadata i64 %111, metadata !372, metadata !DIExpression()) #7, !dbg !376
  call void @llvm.dbg.value(metadata i64 %111, metadata !368, metadata !DIExpression()) #7, !dbg !376
  %112 = icmp eq i64 %111, 0, !dbg !415
  br i1 %112, label %125, label %113, !dbg !416

113:                                              ; preds = %110, %119
  %114 = phi i64 [ %123, %119 ], [ %111, %110 ]
  call void @llvm.dbg.value(metadata i64 %114, metadata !368, metadata !DIExpression()) #7, !dbg !376
  %115 = sub nuw nsw i64 %111, %114, !dbg !417
  call void @llvm.dbg.value(metadata i64 %115, metadata !373, metadata !DIExpression()) #7, !dbg !418
  %116 = icmp ugt i64 %115, 63, !dbg !419
  br i1 %116, label %125, label %117, !dbg !421

117:                                              ; preds = %113
  %118 = icmp ugt i64 %114, 63
  br i1 %118, label %127, label %119, !dbg !422

119:                                              ; preds = %117
  %120 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %114, !dbg !424
  %121 = load i8, i8* %120, align 1, !dbg !424, !tbaa !392, !noalias !357
  %122 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 %115, !dbg !425
  store i8 %121, i8* %122, align 1, !dbg !426, !tbaa !392, !alias.scope !357
  %123 = add nsw i64 %114, -1, !dbg !427
  call void @llvm.dbg.value(metadata i64 %123, metadata !368, metadata !DIExpression()) #7, !dbg !376
  %124 = icmp eq i64 %123, 0, !dbg !415
  br i1 %124, label %125, label %113, !dbg !416

125:                                              ; preds = %119, %113, %110
  %126 = trunc i64 %111 to i32, !dbg !428
  br label %127, !dbg !429

127:                                              ; preds = %86, %98, %106, %117, %125
  %128 = phi i32 [ %126, %125 ], [ 0, %117 ], [ 0, %106 ], [ 0, %98 ], [ 0, %86 ], !dbg !376
  %129 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 0, !dbg !378
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %85) #7, !dbg !430, !noalias !357
  call void @llvm.dbg.value(metadata i32 %128, metadata !230, metadata !DIExpression()), !dbg !341
  store i32 64, i32* %129, align 4, !dbg !431, !tbaa !432
  %130 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @xdp_patch_ports_func.____fmt, i64 0, i64 0), i32 noundef 8, i8* noundef nonnull %84) #7, !dbg !434
  call void @llvm.dbg.value(metadata %struct.qname_lpm_key* null, metadata !234, metadata !DIExpression()), !dbg !436
  %131 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.1* @main_map to i8*), i8* noundef nonnull %83) #7, !dbg !437
  call void @llvm.dbg.value(metadata i8* %131, metadata !234, metadata !DIExpression()), !dbg !436
  %132 = icmp eq i8* %131, null, !dbg !439
  br i1 %132, label %159, label %133, !dbg !440

133:                                              ; preds = %127
  %134 = bitcast i8* %131 to i32*, !dbg !441
  %135 = load i32, i32* %134, align 4, !dbg !441, !tbaa !432
  %136 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @xdp_patch_ports_func.____fmt.1, i64 0, i64 0), i32 noundef 12, i32 noundef %135) #7, !dbg !441
  call void @llvm.dbg.value(metadata i32 %128, metadata !230, metadata !DIExpression()), !dbg !341
  %137 = icmp eq i32 %128, 0, !dbg !444
  br i1 %137, label %160, label %138, !dbg !445

138:                                              ; preds = %133
  %139 = getelementptr inbounds i8, i8* %131, i64 4
  %140 = zext i32 %128 to i64, !dbg !445
  br label %141, !dbg !445

141:                                              ; preds = %138, %155
  %142 = phi i64 [ %140, %138 ], [ %156, %155 ]
  call void @llvm.dbg.value(metadata i64 %142, metadata !230, metadata !DIExpression()), !dbg !341
  %143 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 %142, !dbg !446
  %144 = load i8, i8* %143, align 1, !dbg !446, !tbaa !392
  %145 = icmp eq i8 %144, 0, !dbg !449
  br i1 %145, label %155, label %146, !dbg !450

146:                                              ; preds = %141
  %147 = getelementptr inbounds i8, i8* %139, i64 %142, !dbg !451
  %148 = load i8, i8* %147, align 1, !dbg !451, !tbaa !392
  %149 = icmp eq i8 %148, 0, !dbg !452
  %150 = icmp eq i8 %144, %148
  %151 = select i1 %149, i1 true, i1 %150, !dbg !453
  br i1 %151, label %155, label %152, !dbg !453

152:                                              ; preds = %146
  %153 = trunc i64 %142 to i32, !dbg !454
  %154 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @xdp_patch_ports_func.____fmt.2, i64 0, i64 0), i32 noundef 16, i32 noundef %153) #7, !dbg !454
  call void @llvm.dbg.value(metadata i32 2, metadata !160, metadata !DIExpression()), !dbg !244
  br label %159, !dbg !459

155:                                              ; preds = %146, %141
  %156 = add nsw i64 %142, -1, !dbg !460
  %157 = trunc i64 %156 to i32, !dbg !460
  call void @llvm.dbg.value(metadata i32 %157, metadata !230, metadata !DIExpression()), !dbg !341
  %158 = icmp eq i32 %157, 0, !dbg !444
  br i1 %158, label %160, label %141, !dbg !445, !llvm.loop !461

159:                                              ; preds = %152, %127
  call void @llvm.dbg.value(metadata i32 1, metadata !160, metadata !DIExpression()), !dbg !244
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %83) #7, !dbg !463
  call void @llvm.dbg.label(metadata !235), !dbg !464
  br label %161, !dbg !465

160:                                              ; preds = %155, %133
  call void @llvm.dbg.value(metadata i32 1, metadata !160, metadata !DIExpression()), !dbg !244
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %83) #7, !dbg !463
  call void @llvm.dbg.label(metadata !235), !dbg !464
  call void @llvm.dbg.value(metadata i32 1, metadata !176, metadata !DIExpression()), !dbg !244
  store i32 1, i32* %3, align 4, !dbg !466, !tbaa !247
  br label %161, !dbg !468

161:                                              ; preds = %74, %77, %47, %65, %159, %160
  %162 = phi i32 [ 1, %160 ], [ 2, %159 ], [ 2, %65 ], [ 2, %47 ], [ 2, %77 ], [ 2, %74 ]
  call void @llvm.dbg.value(metadata i32* %3, metadata !176, metadata !DIExpression(DW_OP_deref)), !dbg !244
  %163 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %5) #7, !dbg !469
  %164 = bitcast i8* %163 to i64*, !dbg !469
  call void @llvm.dbg.value(metadata i64* %164, metadata !177, metadata !DIExpression()), !dbg !244
  %165 = icmp eq i8* %163, null, !dbg !470
  br i1 %165, label %170, label %166, !dbg !472

166:                                              ; preds = %161
  %167 = load i64, i64* %164, align 8, !dbg !473, !tbaa !475
  %168 = add i64 %167, 1, !dbg !477
  store i64 %168, i64* %164, align 8, !dbg !478, !tbaa !475
  call void @llvm.dbg.value(metadata i32* %3, metadata !176, metadata !DIExpression(DW_OP_deref)), !dbg !244
  %169 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %5, i8* noundef nonnull %163, i64 noundef 0) #7, !dbg !479
  br label %170, !dbg !480

170:                                              ; preds = %61, %56, %51, %1, %69, %161, %166
  %171 = phi i32 [ %162, %166 ], [ %162, %161 ], [ 0, %69 ], [ 0, %1 ], [ 0, %51 ], [ 0, %56 ], [ 0, %61 ], !dbg !244
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #7, !dbg !481
  ret i32 %171, !dbg !481
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #6

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }
attributes #6 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!239, !240, !241, !242}
!llvm.ident = !{!243}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 150, type: !236, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 83, type: !4, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !158)
!3 = !DIFile(filename: "qn.c", directory: "/root/multi-filters/qname_filter", checksumkind: CSK_MD5, checksum: "8b180f3173b36b1937b3f8c2b6f9b132")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 5944, size: 192, elements: !10)
!9 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/multi-filters/qname_filter", checksumkind: CSK_MD5, checksum: "19e7a278dd5e69adb087c419977e86e0")
!10 = !{!11, !15, !16, !17, !18, !19}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 5945, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 5946, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 5947, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 5949, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 5950, baseType: !12, size: 32, offset: 128)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !8, file: !9, line: 5952, baseType: !12, size: 32, offset: 160)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !66, globals: !77, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !29, !60}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 5933, baseType: !14, size: 32, elements: !23)
!23 = !{!24, !25, !26, !27, !28}
!24 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!25 = !DIEnumerator(name: "XDP_DROP", value: 1)
!26 = !DIEnumerator(name: "XDP_PASS", value: 2)
!27 = !DIEnumerator(name: "XDP_TX", value: 3)
!28 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!29 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !30, line: 28, baseType: !14, size: 32, elements: !31)
!30 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "9a7f04155c254fef1b7ada5eb82c984c")
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59}
!32 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!33 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!34 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!35 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!36 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!37 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!38 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!39 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!40 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!41 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!42 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!43 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!44 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!45 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!46 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!47 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!48 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!49 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!50 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!51 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!52 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!53 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!54 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!55 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!56 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!57 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!58 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!59 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !9, line: 1185, baseType: !14, size: 32, elements: !61)
!61 = !{!62, !63, !64, !65}
!62 = !DIEnumerator(name: "BPF_ANY", value: 0)
!63 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!64 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!65 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!66 = !{!67, !68, !69, !71, !74, !75}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!68 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !70)
!70 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !73)
!73 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !{!0, !78, !84, !89, !94, !123, !139, !146, !153}
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 156, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 96, elements: !82)
!81 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !76)
!82 = !{!83}
!83 = !DISubrange(count: 12)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 160, type: !86, isLocal: true, isDefinition: true)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 128, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 16)
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "_license", scope: !20, file: !3, line: 186, type: !91, isLocal: false, isDefinition: true)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 32, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 4)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(name: "main_map", scope: !20, file: !3, line: 28, type: !96, isLocal: false, isDefinition: true)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 22, size: 320, elements: !97)
!97 = !{!98, !103, !112, !113, !118}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !96, file: !3, line: 23, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 11)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !96, file: !3, line: 24, baseType: !104, size: 64, offset: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "qname_lpm_key", file: !3, line: 17, size: 544, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !105, file: !3, line: 18, baseType: !12, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "rev_suf", scope: !105, file: !3, line: 19, baseType: !109, size: 512, offset: 32)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 512, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 64)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !96, file: !3, line: 25, baseType: !104, size: 64, offset: 128)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !96, file: !3, line: 26, baseType: !114, size: 64, offset: 192)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 1)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !96, file: !3, line: 27, baseType: !119, size: 64, offset: 256)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32736, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 1023)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(name: "stats_map", scope: !20, file: !3, line: 35, type: !125, isLocal: false, isDefinition: true)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 30, size: 256, elements: !126)
!126 = !{!127, !132, !134, !138}
!127 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !125, file: !3, line: 31, baseType: !128, size: 64)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 64, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 2)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !125, file: !3, line: 32, baseType: !133, size: 64, offset: 64)
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !125, file: !3, line: 33, baseType: !135, size: 64, offset: 128)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !137)
!137 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !125, file: !3, line: 34, baseType: !128, size: 64, offset: 192)
!139 = !DIGlobalVariableExpression(var: !140, expr: !DIExpression())
!140 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !141, line: 176, type: !142, isLocal: true, isDefinition: true)
!141 = !DIFile(filename: "../lib/libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/multi-filters/qname_filter", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DISubroutineType(types: !144)
!144 = !{!68, !145, !12, null}
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !141, line: 55, type: !148, isLocal: true, isDefinition: true)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!149 = !DISubroutineType(types: !150)
!150 = !{!67, !67, !151}
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!153 = !DIGlobalVariableExpression(var: !154, expr: !DIExpression())
!154 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !20, file: !141, line: 77, type: !155, isLocal: true, isDefinition: true)
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !156, size: 64)
!156 = !DISubroutineType(types: !157)
!157 = !{!68, !67, !151, !151, !136}
!158 = !{!159, !160, !161, !162, !163, !176, !177, !178, !179, !180, !185, !216, !217, !220, !229, !230, !231, !234, !235}
!159 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 83, type: !7)
!160 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 85, type: !6)
!161 = !DILocalVariable(name: "eth_type", scope: !2, file: !3, line: 86, type: !6)
!162 = !DILocalVariable(name: "ip_type", scope: !2, file: !3, line: 86, type: !6)
!163 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 87, type: !164)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !166, line: 168, size: 112, elements: !167)
!166 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!167 = !{!168, !172, !173}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !165, file: !166, line: 169, baseType: !169, size: 48)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !73, size: 48, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 6)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !165, file: !166, line: 170, baseType: !169, size: 48, offset: 48)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !165, file: !166, line: 171, baseType: !174, size: 16, offset: 96)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !175, line: 25, baseType: !69)
!175 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!176 = !DILocalVariable(name: "stk", scope: !2, file: !3, line: 88, type: !12)
!177 = !DILocalVariable(name: "stptr", scope: !2, file: !3, line: 89, type: !135)
!178 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 90, type: !67)
!179 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 91, type: !67)
!180 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 92, type: !181)
!181 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !182, line: 33, size: 64, elements: !183)
!182 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/multi-filters/qname_filter", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!183 = !{!184}
!184 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !181, file: !182, line: 34, baseType: !67, size: 64)
!185 = !DILocalVariable(name: "iph", scope: !186, file: !3, line: 100, type: !188)
!186 = distinct !DILexicalBlock(scope: !187, file: !3, line: 99, column: 39)
!187 = distinct !DILexicalBlock(scope: !2, file: !3, line: 99, column: 6)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !190, line: 87, size: 160, elements: !191)
!190 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!191 = !{!192, !193, !194, !195, !196, !197, !198, !199, !200, !202}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !189, file: !190, line: 89, baseType: !72, size: 4, flags: DIFlagBitField, extraData: i64 0)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !189, file: !190, line: 90, baseType: !72, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !189, file: !190, line: 97, baseType: !72, size: 8, offset: 8)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !189, file: !190, line: 98, baseType: !174, size: 16, offset: 16)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !189, file: !190, line: 99, baseType: !174, size: 16, offset: 32)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !189, file: !190, line: 100, baseType: !174, size: 16, offset: 48)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !189, file: !190, line: 101, baseType: !72, size: 8, offset: 64)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !189, file: !190, line: 102, baseType: !72, size: 8, offset: 72)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !189, file: !190, line: 103, baseType: !201, size: 16, offset: 80)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !175, line: 31, baseType: !69)
!202 = !DIDerivedType(tag: DW_TAG_member, scope: !189, file: !190, line: 104, baseType: !203, size: 64, offset: 96)
!203 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !189, file: !190, line: 104, size: 64, elements: !204)
!204 = !{!205, !211}
!205 = !DIDerivedType(tag: DW_TAG_member, scope: !203, file: !190, line: 104, baseType: !206, size: 64)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !203, file: !190, line: 104, size: 64, elements: !207)
!207 = !{!208, !210}
!208 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !206, file: !190, line: 104, baseType: !209, size: 32)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !175, line: 27, baseType: !12)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !206, file: !190, line: 104, baseType: !209, size: 32, offset: 32)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !203, file: !190, line: 104, baseType: !212, size: 64)
!212 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !203, file: !190, line: 104, size: 64, elements: !213)
!213 = !{!214, !215}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !212, file: !190, line: 104, baseType: !209, size: 32)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !212, file: !190, line: 104, baseType: !209, size: 32, offset: 32)
!216 = !DILocalVariable(name: "hdrsize", scope: !186, file: !3, line: 101, type: !6)
!217 = !DILocalVariable(name: "udppld", scope: !218, file: !3, line: 125, type: !12)
!218 = distinct !DILexicalBlock(scope: !219, file: !3, line: 124, column: 30)
!219 = distinct !DILexicalBlock(scope: !2, file: !3, line: 124, column: 6)
!220 = !DILocalVariable(name: "h", scope: !218, file: !3, line: 126, type: !221)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !223, line: 23, size: 64, elements: !224)
!223 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!224 = !{!225, !226, !227, !228}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !222, file: !223, line: 24, baseType: !174, size: 16)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !222, file: !223, line: 25, baseType: !174, size: 16, offset: 16)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !222, file: !223, line: 26, baseType: !174, size: 16, offset: 32)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !222, file: !223, line: 27, baseType: !201, size: 16, offset: 48)
!229 = !DILocalVariable(name: "qrn", scope: !218, file: !3, line: 141, type: !69)
!230 = !DILocalVariable(name: "qlen", scope: !218, file: !3, line: 142, type: !12)
!231 = !DILocalVariable(name: "qlk", scope: !232, file: !3, line: 144, type: !105)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 143, column: 14)
!233 = distinct !DILexicalBlock(scope: !218, file: !3, line: 143, column: 6)
!234 = !DILocalVariable(name: "tval", scope: !232, file: !3, line: 151, type: !104)
!235 = !DILabel(scope: !2, name: "out", file: !3, line: 175)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 64, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 8)
!239 = !{i32 7, !"Dwarf Version", i32 5}
!240 = !{i32 2, !"Debug Info Version", i32 3}
!241 = !{i32 1, !"wchar_size", i32 4}
!242 = !{i32 7, !"frame-pointer", i32 2}
!243 = !{!"Ubuntu clang version 14.0.6"}
!244 = !DILocation(line: 0, scope: !2)
!245 = !DILocation(line: 88, column: 2, scope: !2)
!246 = !DILocation(line: 88, column: 8, scope: !2)
!247 = !{!248, !248, i64 0}
!248 = !{!"int", !249, i64 0}
!249 = !{!"omnipotent char", !250, i64 0}
!250 = !{!"Simple C/C++ TBAA"}
!251 = !DILocation(line: 90, column: 38, scope: !2)
!252 = !{!253, !248, i64 4}
!253 = !{!"xdp_md", !248, i64 0, !248, i64 4, !248, i64 8, !248, i64 12, !248, i64 16, !248, i64 20}
!254 = !DILocation(line: 90, column: 27, scope: !2)
!255 = !DILocation(line: 90, column: 19, scope: !2)
!256 = !DILocation(line: 91, column: 34, scope: !2)
!257 = !{!253, !248, i64 0}
!258 = !DILocation(line: 91, column: 23, scope: !2)
!259 = !DILocation(line: 91, column: 15, scope: !2)
!260 = !DILocalVariable(name: "nh", arg: 1, scope: !261, file: !182, line: 124, type: !264)
!261 = distinct !DISubprogram(name: "parse_ethhdr", scope: !182, file: !182, line: 124, type: !262, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !266)
!262 = !DISubroutineType(types: !263)
!263 = !{!6, !264, !67, !265}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!266 = !{!260, !267, !268}
!267 = !DILocalVariable(name: "data_end", arg: 2, scope: !261, file: !182, line: 125, type: !67)
!268 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !261, file: !182, line: 126, type: !265)
!269 = !DILocation(line: 0, scope: !261, inlinedAt: !270)
!270 = distinct !DILocation(line: 94, column: 13, scope: !2)
!271 = !DILocalVariable(name: "nh", arg: 1, scope: !272, file: !182, line: 79, type: !264)
!272 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !182, file: !182, line: 79, type: !273, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !280)
!273 = !DISubroutineType(types: !274)
!274 = !{!6, !264, !67, !265, !275}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!276 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !182, line: 64, size: 32, elements: !277)
!277 = !{!278}
!278 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !276, file: !182, line: 65, baseType: !279, size: 32)
!279 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 32, elements: !130)
!280 = !{!271, !281, !282, !283, !284, !285, !286, !292, !293}
!281 = !DILocalVariable(name: "data_end", arg: 2, scope: !272, file: !182, line: 80, type: !67)
!282 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !272, file: !182, line: 81, type: !265)
!283 = !DILocalVariable(name: "vlans", arg: 4, scope: !272, file: !182, line: 82, type: !275)
!284 = !DILocalVariable(name: "eth", scope: !272, file: !182, line: 84, type: !164)
!285 = !DILocalVariable(name: "hdrsize", scope: !272, file: !182, line: 85, type: !6)
!286 = !DILocalVariable(name: "vlh", scope: !272, file: !182, line: 86, type: !287)
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!288 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !182, line: 42, size: 32, elements: !289)
!289 = !{!290, !291}
!290 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !288, file: !182, line: 43, baseType: !174, size: 16)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !288, file: !182, line: 44, baseType: !174, size: 16, offset: 16)
!292 = !DILocalVariable(name: "h_proto", scope: !272, file: !182, line: 87, type: !69)
!293 = !DILocalVariable(name: "i", scope: !272, file: !182, line: 88, type: !6)
!294 = !DILocation(line: 0, scope: !272, inlinedAt: !295)
!295 = distinct !DILocation(line: 129, column: 9, scope: !261, inlinedAt: !270)
!296 = !DILocation(line: 93, column: 14, scope: !297, inlinedAt: !295)
!297 = distinct !DILexicalBlock(scope: !272, file: !182, line: 93, column: 6)
!298 = !DILocation(line: 93, column: 24, scope: !297, inlinedAt: !295)
!299 = !DILocation(line: 93, column: 6, scope: !272, inlinedAt: !295)
!300 = !DILocation(line: 99, column: 17, scope: !272, inlinedAt: !295)
!301 = !{!302, !302, i64 0}
!302 = !{!"short", !249, i64 0}
!303 = !DILocalVariable(name: "h_proto", arg: 1, scope: !304, file: !182, line: 68, type: !69)
!304 = distinct !DISubprogram(name: "proto_is_vlan", scope: !182, file: !182, line: 68, type: !305, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !307)
!305 = !DISubroutineType(types: !306)
!306 = !{!6, !69}
!307 = !{!303}
!308 = !DILocation(line: 0, scope: !304, inlinedAt: !309)
!309 = distinct !DILocation(line: 106, column: 8, scope: !310, inlinedAt: !295)
!310 = distinct !DILexicalBlock(scope: !311, file: !182, line: 106, column: 7)
!311 = distinct !DILexicalBlock(scope: !312, file: !182, line: 105, column: 39)
!312 = distinct !DILexicalBlock(scope: !313, file: !182, line: 105, column: 2)
!313 = distinct !DILexicalBlock(scope: !272, file: !182, line: 105, column: 2)
!314 = !DILocation(line: 70, column: 20, scope: !304, inlinedAt: !309)
!315 = !DILocation(line: 70, column: 46, scope: !304, inlinedAt: !309)
!316 = !DILocation(line: 106, column: 8, scope: !310, inlinedAt: !295)
!317 = !DILocation(line: 106, column: 7, scope: !311, inlinedAt: !295)
!318 = !DILocation(line: 112, column: 18, scope: !311, inlinedAt: !295)
!319 = !DILocation(line: 99, column: 15, scope: !187)
!320 = !DILocation(line: 99, column: 6, scope: !2)
!321 = !DILocation(line: 0, scope: !186)
!322 = !DILocation(line: 103, column: 11, scope: !323)
!323 = distinct !DILexicalBlock(scope: !186, file: !3, line: 103, column: 7)
!324 = !DILocation(line: 103, column: 17, scope: !323)
!325 = !DILocation(line: 103, column: 15, scope: !323)
!326 = !DILocation(line: 103, column: 7, scope: !186)
!327 = !DILocation(line: 106, column: 18, scope: !186)
!328 = !DILocation(line: 106, column: 22, scope: !186)
!329 = !DILocation(line: 108, column: 14, scope: !330)
!330 = distinct !DILexicalBlock(scope: !186, file: !3, line: 108, column: 6)
!331 = !DILocation(line: 108, column: 6, scope: !186)
!332 = !DILocation(line: 112, column: 14, scope: !333)
!333 = distinct !DILexicalBlock(scope: !186, file: !3, line: 112, column: 7)
!334 = !DILocation(line: 112, column: 24, scope: !333)
!335 = !DILocation(line: 112, column: 7, scope: !186)
!336 = !DILocation(line: 116, column: 19, scope: !186)
!337 = !{!338, !249, i64 9}
!338 = !{!"iphdr", !249, i64 0, !249, i64 0, !249, i64 1, !302, i64 2, !302, i64 4, !302, i64 6, !249, i64 8, !249, i64 9, !302, i64 10, !249, i64 12}
!339 = !DILocation(line: 124, column: 14, scope: !219)
!340 = !DILocation(line: 124, column: 6, scope: !2)
!341 = !DILocation(line: 0, scope: !218)
!342 = !DILocation(line: 128, column: 9, scope: !343)
!343 = distinct !DILexicalBlock(scope: !218, file: !3, line: 128, column: 7)
!344 = !DILocation(line: 128, column: 15, scope: !343)
!345 = !DILocation(line: 128, column: 13, scope: !343)
!346 = !DILocation(line: 128, column: 7, scope: !218)
!347 = !DILocation(line: 137, column: 22, scope: !348)
!348 = distinct !DILexicalBlock(scope: !218, file: !3, line: 137, column: 6)
!349 = !DILocation(line: 137, column: 27, scope: !348)
!350 = !DILocation(line: 137, column: 6, scope: !218)
!351 = !DILocation(line: 141, column: 35, scope: !218)
!352 = !DILocation(line: 141, column: 15, scope: !218)
!353 = !DILocation(line: 143, column: 10, scope: !233)
!354 = !DILocation(line: 143, column: 6, scope: !218)
!355 = !DILocation(line: 144, column: 4, scope: !232)
!356 = !DILocation(line: 144, column: 25, scope: !232)
!357 = !{!358}
!358 = distinct !{!358, !359, !"get_qname_lpm_key: argument 0"}
!359 = distinct !{!359, !"get_qname_lpm_key"}
!360 = !DILocation(line: 144, column: 31, scope: !232)
!361 = !DILocalVariable(name: "base", arg: 1, scope: !362, file: !3, line: 37, type: !145)
!362 = distinct !DISubprogram(name: "get_qname_lpm_key", scope: !3, file: !3, line: 37, type: !363, scopeLine: 37, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !365)
!363 = !DISubroutineType(types: !364)
!364 = !{!105, !145, !67}
!365 = !{!361, !366, !367, !368, !369, !370, !371, !372, !373, !375}
!366 = !DILocalVariable(name: "data_end", arg: 2, scope: !362, file: !3, line: 37, type: !67)
!367 = !DILocalVariable(name: "qlk", scope: !362, file: !3, line: 38, type: !105)
!368 = !DILocalVariable(name: "qend", scope: !362, file: !3, line: 42, type: !136)
!369 = !DILocalVariable(name: "tmp", scope: !362, file: !3, line: 43, type: !76)
!370 = !DILocalVariable(name: "sv", scope: !362, file: !3, line: 43, type: !76)
!371 = !DILocalVariable(name: "qnbuf", scope: !362, file: !3, line: 44, type: !109)
!372 = !DILocalVariable(name: "qlen", scope: !362, file: !3, line: 62, type: !136)
!373 = !DILocalVariable(name: "i", scope: !374, file: !3, line: 65, type: !136)
!374 = distinct !DILexicalBlock(scope: !362, file: !3, line: 64, column: 17)
!375 = !DILabel(scope: !362, name: "fail", file: !3, line: 74)
!376 = !DILocation(line: 0, scope: !362, inlinedAt: !377)
!377 = distinct !DILocation(line: 144, column: 31, scope: !232)
!378 = !DILocation(line: 38, column: 23, scope: !362, inlinedAt: !377)
!379 = !DILocation(line: 44, column: 2, scope: !362, inlinedAt: !377)
!380 = !DILocation(line: 44, column: 7, scope: !362, inlinedAt: !377)
!381 = !DILocation(line: 46, column: 2, scope: !362, inlinedAt: !377)
!382 = !DILocation(line: 47, column: 17, scope: !383, inlinedAt: !377)
!383 = distinct !DILexicalBlock(scope: !384, file: !3, line: 47, column: 6)
!384 = distinct !DILexicalBlock(scope: !362, file: !3, line: 46, column: 23)
!385 = !DILocation(line: 47, column: 22, scope: !383, inlinedAt: !377)
!386 = !DILocation(line: 47, column: 25, scope: !383, inlinedAt: !377)
!387 = !DILocation(line: 47, column: 6, scope: !384, inlinedAt: !377)
!388 = !DILocation(line: 48, column: 14, scope: !389, inlinedAt: !377)
!389 = distinct !DILexicalBlock(scope: !384, file: !3, line: 48, column: 6)
!390 = !DILocation(line: 48, column: 11, scope: !389, inlinedAt: !377)
!391 = !DILocation(line: 0, scope: !389, inlinedAt: !377)
!392 = !{!249, !249, i64 0}
!393 = !DILocation(line: 48, column: 6, scope: !384, inlinedAt: !377)
!394 = !DILocation(line: 51, column: 11, scope: !395, inlinedAt: !377)
!395 = distinct !DILexicalBlock(scope: !396, file: !3, line: 51, column: 7)
!396 = distinct !DILexicalBlock(scope: !389, file: !3, line: 48, column: 18)
!397 = !DILocation(line: 51, column: 7, scope: !396, inlinedAt: !377)
!398 = !DILocation(line: 52, column: 11, scope: !399, inlinedAt: !377)
!399 = distinct !DILexicalBlock(scope: !396, file: !3, line: 52, column: 7)
!400 = !DILocation(line: 52, column: 7, scope: !396, inlinedAt: !377)
!401 = !DILocation(line: 53, column: 4, scope: !396, inlinedAt: !377)
!402 = !DILocation(line: 53, column: 16, scope: !396, inlinedAt: !377)
!403 = !DILocation(line: 54, column: 12, scope: !396, inlinedAt: !377)
!404 = !DILocation(line: 54, column: 16, scope: !396, inlinedAt: !377)
!405 = !DILocation(line: 55, column: 3, scope: !396, inlinedAt: !377)
!406 = !DILocation(line: 56, column: 4, scope: !407, inlinedAt: !377)
!407 = distinct !DILexicalBlock(scope: !389, file: !3, line: 55, column: 8)
!408 = !DILocation(line: 56, column: 16, scope: !407, inlinedAt: !377)
!409 = !DILocation(line: 58, column: 7, scope: !384, inlinedAt: !377)
!410 = !DILocation(line: 46, column: 12, scope: !362, inlinedAt: !377)
!411 = distinct !{!411, !381, !412, !413}
!412 = !DILocation(line: 59, column: 2, scope: !362, inlinedAt: !377)
!413 = !{!"llvm.loop.mustprogress"}
!414 = !DILocation(line: 62, column: 19, scope: !362, inlinedAt: !377)
!415 = !DILocation(line: 64, column: 13, scope: !362, inlinedAt: !377)
!416 = !DILocation(line: 64, column: 2, scope: !362, inlinedAt: !377)
!417 = !DILocation(line: 65, column: 17, scope: !374, inlinedAt: !377)
!418 = !DILocation(line: 0, scope: !374, inlinedAt: !377)
!419 = !DILocation(line: 66, column: 7, scope: !420, inlinedAt: !377)
!420 = distinct !DILexicalBlock(scope: !374, file: !3, line: 66, column: 6)
!421 = !DILocation(line: 66, column: 6, scope: !374, inlinedAt: !377)
!422 = !DILocation(line: 67, column: 13, scope: !423, inlinedAt: !377)
!423 = distinct !DILexicalBlock(scope: !374, file: !3, line: 67, column: 6)
!424 = !DILocation(line: 68, column: 20, scope: !374, inlinedAt: !377)
!425 = !DILocation(line: 68, column: 3, scope: !374, inlinedAt: !377)
!426 = !DILocation(line: 68, column: 18, scope: !374, inlinedAt: !377)
!427 = !DILocation(line: 69, column: 7, scope: !374, inlinedAt: !377)
!428 = !DILocation(line: 71, column: 18, scope: !362, inlinedAt: !377)
!429 = !DILocation(line: 72, column: 2, scope: !362, inlinedAt: !377)
!430 = !DILocation(line: 77, column: 1, scope: !362, inlinedAt: !377)
!431 = !DILocation(line: 146, column: 18, scope: !232)
!432 = !{!433, !248, i64 0}
!433 = !{!"qname_lpm_key", !248, i64 0, !249, i64 4}
!434 = !DILocation(line: 150, column: 4, scope: !435)
!435 = distinct !DILexicalBlock(scope: !232, file: !3, line: 150, column: 4)
!436 = !DILocation(line: 0, scope: !232)
!437 = !DILocation(line: 152, column: 16, scope: !438)
!438 = distinct !DILexicalBlock(scope: !232, file: !3, line: 152, column: 7)
!439 = !DILocation(line: 152, column: 14, scope: !438)
!440 = !DILocation(line: 152, column: 7, scope: !232)
!441 = !DILocation(line: 156, column: 5, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !3, line: 156, column: 5)
!443 = distinct !DILexicalBlock(scope: !438, file: !3, line: 155, column: 9)
!444 = !DILocation(line: 157, column: 16, scope: !443)
!445 = !DILocation(line: 157, column: 5, scope: !443)
!446 = !DILocation(line: 158, column: 9, scope: !447)
!447 = distinct !DILexicalBlock(scope: !448, file: !3, line: 158, column: 9)
!448 = distinct !DILexicalBlock(scope: !443, file: !3, line: 157, column: 20)
!449 = !DILocation(line: 158, column: 27, scope: !447)
!450 = !DILocation(line: 158, column: 35, scope: !447)
!451 = !DILocation(line: 158, column: 38, scope: !447)
!452 = !DILocation(line: 158, column: 58, scope: !447)
!453 = !DILocation(line: 158, column: 9, scope: !448)
!454 = !DILocation(line: 160, column: 8, scope: !455)
!455 = distinct !DILexicalBlock(scope: !456, file: !3, line: 160, column: 8)
!456 = distinct !DILexicalBlock(scope: !457, file: !3, line: 159, column: 51)
!457 = distinct !DILexicalBlock(scope: !458, file: !3, line: 159, column: 10)
!458 = distinct !DILexicalBlock(scope: !447, file: !3, line: 158, column: 66)
!459 = !DILocation(line: 162, column: 8, scope: !456)
!460 = !DILocation(line: 165, column: 10, scope: !448)
!461 = distinct !{!461, !445, !462, !413}
!462 = !DILocation(line: 166, column: 5, scope: !443)
!463 = !DILocation(line: 170, column: 3, scope: !233)
!464 = !DILocation(line: 175, column: 1, scope: !2)
!465 = !DILocation(line: 176, column: 5, scope: !2)
!466 = !DILocation(line: 177, column: 7, scope: !467)
!467 = distinct !DILexicalBlock(scope: !2, file: !3, line: 176, column: 5)
!468 = !DILocation(line: 177, column: 3, scope: !467)
!469 = !DILocation(line: 178, column: 10, scope: !2)
!470 = !DILocation(line: 179, column: 5, scope: !471)
!471 = distinct !DILexicalBlock(scope: !2, file: !3, line: 179, column: 5)
!472 = !DILocation(line: 179, column: 5, scope: !2)
!473 = !DILocation(line: 180, column: 12, scope: !474)
!474 = distinct !DILexicalBlock(scope: !471, file: !3, line: 179, column: 12)
!475 = !{!476, !476, i64 0}
!476 = !{!"long long", !249, i64 0}
!477 = !DILocation(line: 180, column: 19, scope: !474)
!478 = !DILocation(line: 180, column: 10, scope: !474)
!479 = !DILocation(line: 181, column: 3, scope: !474)
!480 = !DILocation(line: 182, column: 2, scope: !474)
!481 = !DILocation(line: 184, column: 1, scope: !2)
