	.text
	.hsa_code_object_version 2,1
	.hsa_code_object_isa 8,0,3,"AMD","AMDGPU"
	.globl	microbench              ; -- Begin function microbench
	.p2align	8
	.type	microbench,@function
	.amdgpu_hsa_kernel microbench
microbench:                             ; @microbench
	.amd_kernel_code_t
		amd_code_version_major = 1
		amd_code_version_minor = 1
		amd_machine_kind = 1
		amd_machine_version_major = 8
		amd_machine_version_minor = 0
		amd_machine_version_stepping = 3
		kernel_code_entry_byte_offset = 256
		kernel_code_prefetch_byte_size = 0
		max_scratch_backing_memory_byte_size = 0
		granulated_workitem_vgpr_count = 3
		granulated_wavefront_sgpr_count = 1
		priority = 0
		float_mode = 192
		priv = 0
		enable_dx10_clamp = 1
		debug_mode = 0
		enable_ieee_mode = 1
		enable_sgpr_private_segment_wave_byte_offset = 0
		user_sgpr_count = 8
		enable_trap_handler = 1
		enable_sgpr_workgroup_id_x = 1
		enable_sgpr_workgroup_id_y = 0
		enable_sgpr_workgroup_id_z = 0
		enable_sgpr_workgroup_info = 0
		enable_vgpr_workitem_id = 1
		enable_exception_msb = 0
		granulated_lds_size = 0
		enable_exception = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 1
		enable_sgpr_queue_ptr = 0
		enable_sgpr_kernarg_segment_ptr = 1
		enable_sgpr_dispatch_id = 0
		enable_sgpr_flat_scratch_init = 0
		enable_sgpr_private_segment_size = 0
		enable_sgpr_grid_workgroup_count_x = 0
		enable_sgpr_grid_workgroup_count_y = 0
		enable_sgpr_grid_workgroup_count_z = 0
		enable_ordered_append_gds = 0
		private_element_size = 1
		is_ptr64 = 1
		is_dynamic_callstack = 0
		is_debug_enabled = 0
		is_xnack_enabled = 0
		workitem_private_segment_byte_size = 0
		workgroup_group_segment_byte_size = 24576
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 56
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 12
		workitem_vgpr_count = 14
		reserved_vgpr_first = 0
		reserved_vgpr_count = 0
		reserved_sgpr_first = 0
		reserved_sgpr_count = 0
		debug_wavefront_private_segment_offset_sgpr = 0
		debug_private_segment_buffer_sgpr = 0
		kernarg_segment_alignment = 4
		group_segment_alignment = 4
		private_segment_alignment = 4
		wavefront_size = 6
		call_convention = -1
		runtime_loader_kernel_symbol = 0
	.end_amd_kernel_code_t
; BB#0:
	s_load_dword s9, s[4:5], 0x4
	s_load_dword s4, s[4:5], 0xc
	s_load_dwordx2 s[0:1], s[6:7], 0x8
	v_add_u32_e64 v2, s[2:3], 0, 0
	s_mov_b32 m0, -1
	s_waitcnt lgkmcnt(0)
	s_and_b32 s5, s9, 0xffff
	s_mul_i32 s8, s8, s5
	s_sub_i32 s4, s4, s8
	s_min_u32 s4, s4, s5
	v_mad_u32_u24 v2, s4, v1, v0
	v_mov_b32_e32 v0, 0x80
	v_mov_b32_e32 v1, 0x100
	v_addc_u32_e64 v0, vcc, v2, v0, s[2:3]
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_lshlrev_b32_e32 v0, 2, v0
	v_lshlrev_b32_e32 v1, 2, v1
	v_mov_b32_e32 v6, 0x280
	v_mov_b32_e32 v7, 0x300
	v_mov_b32_e32 v8, 0x380
	ds_read_b32 v4, v1
	ds_read_b32 v5, v0
	v_mov_b32_e32 v0, 0x180
	v_mov_b32_e32 v1, 0x200
	v_addc_u32_e64 v0, vcc, v2, v0, s[2:3]
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_addc_u32_e64 v6, vcc, v2, v6, s[2:3]
	v_addc_u32_e64 v7, vcc, v2, v7, s[2:3]
	v_addc_u32_e64 v8, vcc, v2, v8, s[2:3]
	v_lshlrev_b32_e32 v3, 2, v2
	v_lshlrev_b32_e32 v0, 2, v0
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v6, 2, v6
	v_lshlrev_b32_e32 v7, 2, v7
	v_lshlrev_b32_e32 v8, 2, v8
	ds_read_b32 v8, v8
	ds_read_b32 v7, v7
	ds_read_b32 v6, v6
	ds_read_b32 v9, v1
	ds_read_b32 v10, v0
	ds_read2st64_b32 v[0:1], v3 offset1:16
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, 0, v0
	v_add_f32_e32 v0, v0, v5
	v_add_f32_e32 v0, v0, v4
	v_add_f32_e32 v0, v0, v10
	v_add_f32_e32 v0, v0, v9
	v_add_f32_e32 v0, v0, v6
	v_add_f32_e32 v0, v0, v7
	v_add_f32_e32 v0, v0, v8
	v_mov_b32_e32 v4, 0x500
	v_mov_b32_e32 v5, 0x580
	v_mov_b32_e32 v6, 0x600
	v_mov_b32_e32 v7, 0x680
	v_add_f32_e32 v0, v0, v1
	v_mov_b32_e32 v1, 0x480
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_addc_u32_e64 v4, vcc, v2, v4, s[2:3]
	v_addc_u32_e64 v5, vcc, v2, v5, s[2:3]
	v_addc_u32_e64 v6, vcc, v2, v6, s[2:3]
	v_addc_u32_e64 v7, vcc, v2, v7, s[2:3]
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v4, 2, v4
	v_lshlrev_b32_e32 v5, 2, v5
	v_lshlrev_b32_e32 v6, 2, v6
	v_lshlrev_b32_e32 v7, 2, v7
	ds_read_b32 v7, v7
	ds_read_b32 v6, v6
	ds_read_b32 v5, v5
	ds_read_b32 v4, v4
	ds_read_b32 v1, v1
	v_mov_b32_e32 v8, 0xb00
	v_mov_b32_e32 v9, 0xb80
	v_mov_b32_e32 v10, 0xc80
	v_addc_u32_e64 v8, vcc, v2, v8, s[2:3]
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, v0, v1
	v_add_f32_e32 v0, v0, v4
	v_add_f32_e32 v0, v0, v5
	v_add_f32_e32 v0, v0, v6
	v_mov_b32_e32 v1, 0x700
	v_mov_b32_e32 v4, 0x780
	v_mov_b32_e32 v5, 0x880
	v_mov_b32_e32 v6, 0x900
	v_add_f32_e32 v0, v0, v7
	v_mov_b32_e32 v7, 0x980
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_addc_u32_e64 v4, vcc, v2, v4, s[2:3]
	v_addc_u32_e64 v5, vcc, v2, v5, s[2:3]
	v_addc_u32_e64 v6, vcc, v2, v6, s[2:3]
	v_addc_u32_e64 v7, vcc, v2, v7, s[2:3]
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v4, 2, v4
	v_lshlrev_b32_e32 v5, 2, v5
	v_lshlrev_b32_e32 v6, 2, v6
	v_lshlrev_b32_e32 v7, 2, v7
	ds_read_b32 v7, v7
	ds_read_b32 v6, v6
	ds_read_b32 v5, v5
	ds_read_b32 v4, v4
	ds_read_b32 v1, v1
	v_addc_u32_e64 v9, vcc, v2, v9, s[2:3]
	v_addc_u32_e64 v10, vcc, v2, v10, s[2:3]
	v_lshlrev_b32_e32 v8, 2, v8
	v_lshlrev_b32_e32 v9, 2, v9
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, v0, v1
	v_mov_b32_e32 v1, 0xa80
	v_add_f32_e32 v4, v0, v4
	v_mov_b32_e32 v0, 0xa00
	v_addc_u32_e64 v0, vcc, v2, v0, s[2:3]
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_lshlrev_b32_e32 v10, 2, v10
	v_lshlrev_b32_e32 v0, 2, v0
	v_lshlrev_b32_e32 v1, 2, v1
	ds_read_b32 v10, v10
	ds_read_b32 v9, v9
	ds_read_b32 v8, v8
	ds_read_b32 v11, v1
	ds_read_b32 v12, v0
	ds_read2st64_b32 v[0:1], v3 offset0:32 offset1:48
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, v4, v0
	v_add_f32_e32 v0, v0, v5
	v_add_f32_e32 v0, v0, v6
	v_add_f32_e32 v0, v0, v7
	v_add_f32_e32 v0, v0, v12
	v_add_f32_e32 v0, v0, v11
	v_add_f32_e32 v0, v0, v8
	v_add_f32_e32 v0, v0, v9
	v_add_f32_e32 v0, v0, v1
	v_mov_b32_e32 v1, 0xd00
	v_mov_b32_e32 v4, 0xd80
	v_mov_b32_e32 v5, 0xe00
	v_mov_b32_e32 v6, 0xe80
	v_mov_b32_e32 v7, 0xf00
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_addc_u32_e64 v4, vcc, v2, v4, s[2:3]
	v_addc_u32_e64 v5, vcc, v2, v5, s[2:3]
	v_addc_u32_e64 v6, vcc, v2, v6, s[2:3]
	v_addc_u32_e64 v7, vcc, v2, v7, s[2:3]
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v4, 2, v4
	v_lshlrev_b32_e32 v5, 2, v5
	v_lshlrev_b32_e32 v6, 2, v6
	v_lshlrev_b32_e32 v7, 2, v7
	ds_read_b32 v7, v7
	ds_read_b32 v6, v6
	ds_read_b32 v5, v5
	ds_read_b32 v4, v4
	ds_read_b32 v1, v1
	v_add_f32_e32 v0, v0, v10
	v_mov_b32_e32 v9, 0x1380
	v_mov_b32_e32 v10, 0x1480
	v_mov_b32_e32 v11, 0x1500
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, v0, v1
	v_add_f32_e32 v0, v0, v4
	v_add_f32_e32 v0, v0, v5
	v_add_f32_e32 v0, v0, v6
	v_mov_b32_e32 v1, 0xf80
	v_mov_b32_e32 v4, 0x1080
	v_mov_b32_e32 v5, 0x1100
	v_mov_b32_e32 v6, 0x1180
	v_add_f32_e32 v0, v0, v7
	v_mov_b32_e32 v7, 0x1200
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_addc_u32_e64 v4, vcc, v2, v4, s[2:3]
	v_addc_u32_e64 v5, vcc, v2, v5, s[2:3]
	v_addc_u32_e64 v6, vcc, v2, v6, s[2:3]
	v_addc_u32_e64 v7, vcc, v2, v7, s[2:3]
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v4, 2, v4
	v_lshlrev_b32_e32 v5, 2, v5
	v_lshlrev_b32_e32 v6, 2, v6
	v_lshlrev_b32_e32 v7, 2, v7
	ds_read_b32 v7, v7
	ds_read_b32 v6, v6
	ds_read_b32 v5, v5
	ds_read_b32 v4, v4
	ds_read_b32 v1, v1
	v_addc_u32_e64 v9, vcc, v2, v9, s[2:3]
	v_addc_u32_e64 v10, vcc, v2, v10, s[2:3]
	v_addc_u32_e64 v11, vcc, v2, v11, s[2:3]
	v_lshlrev_b32_e32 v9, 2, v9
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v8, v0, v1
	v_mov_b32_e32 v0, 0x1280
	v_mov_b32_e32 v1, 0x1300
	v_addc_u32_e64 v0, vcc, v2, v0, s[2:3]
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_lshlrev_b32_e32 v0, 2, v0
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v10, 2, v10
	v_lshlrev_b32_e32 v11, 2, v11
	ds_read_b32 v11, v11
	ds_read_b32 v10, v10
	ds_read_b32 v9, v9
	ds_read_b32 v12, v1
	ds_read_b32 v13, v0
	ds_read2st64_b32 v[0:1], v3 offset0:64 offset1:80
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, v8, v0
	v_add_f32_e32 v0, v0, v4
	v_add_f32_e32 v0, v0, v5
	v_add_f32_e32 v0, v0, v6
	v_add_f32_e32 v0, v0, v7
	v_add_f32_e32 v0, v0, v13
	v_add_f32_e32 v0, v0, v12
	v_add_f32_e32 v0, v0, v9
	v_add_f32_e32 v0, v0, v1
	v_mov_b32_e32 v1, 0x1580
	v_mov_b32_e32 v4, 0x1600
	v_mov_b32_e32 v5, 0x1680
	v_mov_b32_e32 v6, 0x1700
	v_mov_b32_e32 v7, 0x1780
	v_addc_u32_e64 v1, vcc, v2, v1, s[2:3]
	v_addc_u32_e64 v4, vcc, v2, v4, s[2:3]
	v_addc_u32_e64 v5, vcc, v2, v5, s[2:3]
	v_addc_u32_e64 v6, vcc, v2, v6, s[2:3]
	v_addc_u32_e64 v2, vcc, v2, v7, s[2:3]
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshlrev_b32_e32 v4, 2, v4
	v_lshlrev_b32_e32 v5, 2, v5
	v_lshlrev_b32_e32 v6, 2, v6
	v_lshlrev_b32_e32 v2, 2, v2
	ds_read_b32 v2, v2
	ds_read_b32 v6, v6
	ds_read_b32 v5, v5
	ds_read_b32 v4, v4
	ds_read_b32 v1, v1
	v_add_f32_e32 v0, v0, v10
	v_add_f32_e32 v0, v0, v11
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v0, v0, v1
	v_add_f32_e32 v0, v0, v4
	v_add_f32_e32 v0, v0, v5
	v_add_f32_e32 v0, v0, v6
	v_add_f32_e32 v2, v0, v2
	v_mov_b32_e32 v1, s1
	v_add_u32_e32 v0, vcc, s0, v3
	v_addc_u32_e32 v1, vcc, 0, v1, vcc
	flat_store_dword v[0:1], v2
	s_endpgm
.Lfunc_end0:
	.size	microbench, .Lfunc_end0-microbench
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 1520
; NumSgprs: 12
; NumVgprs: 14
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 24576 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 12
; NumVGPRsForWavesPerEU: 14
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1

	.ident	"clang version 4.0 "
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn-amd-amdhsa-amdgizcl-gfx803"
	.amd_amdgpu_hsa_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            microbench
    SymbolName:      'microbench@kd'
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Args:            
      - Name:            in
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
      - Name:            out
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
      - Name:            clock
        TypeName:        int
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetX
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetY
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetZ
        ValueType:       I64
    CodeProps:       
      KernargSegmentSize: 56
      GroupSegmentFixedSize: 24576
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        12
      NumVGPRs:        14
      MaxFlatWorkGroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
