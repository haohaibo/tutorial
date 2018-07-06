/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/
	.text
	.hsa_code_object_version 2,1
	.hsa_code_object_isa 8,0,3,"AMD","AMDGPU"
	.globl	gemm                    ; -- Begin function gemm
	.p2align	8

	.type	gemm,@function
	.amdgpu_hsa_kernel gemm
gemm:                                   ; @gemm
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
		granulated_workitem_vgpr_count = 26
		granulated_wavefront_sgpr_count = 2
		priority = 0
		float_mode = 192
		priv = 0
		enable_dx10_clamp = 1
		debug_mode = 0
		enable_ieee_mode = 1
		enable_sgpr_private_segment_wave_byte_offset = 0
		user_sgpr_count = 6
		enable_trap_handler = 1
		enable_sgpr_workgroup_id_x = 1
		enable_sgpr_workgroup_id_y = 1
		enable_sgpr_workgroup_id_z = 0
		enable_sgpr_workgroup_info = 0
		enable_vgpr_workitem_id = 1
		enable_exception_msb = 0
		granulated_lds_size = 0
		enable_exception = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 0
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
		workgroup_group_segment_byte_size = 8192
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 72
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 20
		workitem_vgpr_count = 106
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
    ; s2 <- M
	s_load_dword s2, s[4:5], 0x18
    ; s10 <- N
	s_load_dword s10, s[4:5], 0x20
	v_lshlrev_b32_e32 v28, 3, v1
	v_add_u32_e32 v35, vcc, v0, v28
	s_lshl_b32 s3, s7, 6
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v3, v1, s2
	v_add_u32_e32 v2, vcc, s3, v35
    ; A矩阵的首地址
	s_load_dwordx2 s[8:9], s[4:5], 0x0
    ; B矩阵的首地址
	s_load_dwordx2 s[12:13], s[4:5], 0x8
    ; C矩阵首地址
	s_load_dwordx2 s[0:1], s[4:5], 0x10
	s_lshl_b32 s5, s6, 6
	v_lshlrev_b32_e32 v38, 3, v0
	v_add_u32_e32 v31, vcc, s5, v38
	v_mul_lo_i32 v2, v2, s10
	v_add_u32_e32 v4, vcc, v31, v3
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_ashrrev_i32_e32 v3, 31, v2
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s9
	v_add_u32_e32 v4, vcc, s8, v4
	v_addc_u32_e32 v5, vcc, v0, v5, vcc
	v_lshlrev_b64 v[2:3], 2, v[2:3]
	v_mov_b32_e32 v6, s13
	v_add_u32_e32 v39, vcc, s12, v2
	v_addc_u32_e32 v40, vcc, v6, v3, vcc
	v_add_u32_e32 v2, vcc, 16, v4
	v_addc_u32_e32 v3, vcc, 0, v5, vcc
	v_add_u32_e32 v6, vcc, 16, v39
	v_addc_u32_e32 v7, vcc, 0, v40, vcc
	flat_load_dwordx4 v[42:45], v[4:5]
	flat_load_dwordx4 v[47:50], v[2:3]
	flat_load_dwordx4 v[54:57], v[39:40]
	flat_load_dwordx4 v[60:63], v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	s_cmp_lt_i32 s10, 8
	v_mov_b32_e32 v0, 0
	s_mov_b32 s4, 8
    ;
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v17, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v19, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v25, 0
	v_mov_b32_e32 v27, 0
	v_mov_b32_e32 v29, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v58, 0
	v_mov_b32_e32 v59, 0
	v_mov_b32_e32 v80, 0
	v_mov_b32_e32 v81, 0
	v_mov_b32_e32 v82, 0
	v_mov_b32_e32 v83, 0
	v_mov_b32_e32 v52, 0
	v_mov_b32_e32 v84, 0
	v_mov_b32_e32 v85, 0
	v_mov_b32_e32 v86, 0
	v_mov_b32_e32 v36, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v67, 0
	v_mov_b32_e32 v87, 0
	v_mov_b32_e32 v88, 0
	v_mov_b32_e32 v71, 0
	v_mov_b32_e32 v70, 0
	v_mov_b32_e32 v69, 0
	v_mov_b32_e32 v75, 0
	v_mov_b32_e32 v74, 0
	v_mov_b32_e32 v73, 0
	v_mov_b32_e32 v79, 0
	v_mov_b32_e32 v78, 0
	v_mov_b32_e32 v77, 0
	v_mov_b32_e32 v21, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v32, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v41, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v53, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v68, 0
	v_mov_b32_e32 v72, 0
	v_mov_b32_e32 v76, 0
	s_cbranch_scc1 BB0_5
; BB#1:                                 ; %.lr.ph
	v_lshlrev_b32_e32 v0, 6, v1
	v_add_u32_e32 v1, vcc, 8, v1
	v_mul_lo_i32 v2, s2, v1
	s_ashr_i32 s6, s10, 31
	s_lshr_b32 s6, s6, 29
	s_add_i32 s10, s10, s6
	v_add_u32_e32 v1, vcc, v38, v0
	v_add_u32_e32 v0, vcc, s5, v2
	s_ashr_i32 s6, s10, 3
	v_add_u32_e32 v65, vcc, v38, v0
	s_lshl_b32 s7, s2, 3
	s_mov_b32 s12, 0
	s_movk_i32 s10, 0x1000
	s_movk_i32 s11, 0x1008
	s_movk_i32 s13, 0x1010
	s_movk_i32 s14, 0x1018
	v_mov_b32_e32 v77, 0
	v_mov_b32_e32 v78, 0
	v_mov_b32_e32 v79, 0
	v_mov_b32_e32 v73, 0
	v_mov_b32_e32 v74, 0
	v_mov_b32_e32 v75, 0
	v_mov_b32_e32 v69, 0
	v_mov_b32_e32 v70, 0
	v_mov_b32_e32 v71, 0
	v_mov_b32_e32 v88, 0
	v_mov_b32_e32 v87, 0
	v_mov_b32_e32 v67, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v36, 0
	v_mov_b32_e32 v86, 0
	v_mov_b32_e32 v85, 0
	v_mov_b32_e32 v84, 0
	v_mov_b32_e32 v52, 0
	v_mov_b32_e32 v83, 0
	v_mov_b32_e32 v82, 0
	v_mov_b32_e32 v81, 0
	v_mov_b32_e32 v80, 0
	v_mov_b32_e32 v59, 0
	v_mov_b32_e32 v58, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v29, 0
	v_mov_b32_e32 v27, 0
	v_mov_b32_e32 v25, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v19, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v17, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v21, 0
	v_mov_b32_e32 v76, 0
	v_mov_b32_e32 v72, 0
	v_mov_b32_e32 v68, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v53, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v41, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v32, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v16, 0
; for(int i =0; i < K/NUM_UNROLL; ++i) 
BB0_2:                                  ; =>This Inner Loop Header: Depth=1
	v_add_u32_e32 v66, vcc, s12, v1
	v_lshlrev_b32_e32 v66, 2, v66
	v_add_u32_e32 v89, vcc, s10, v66
	s_mov_b32 m0, -1
	ds_write2_b32 v89, v42, v43 offset1:1
	v_add_u32_e32 v89, vcc, s11, v66
	ds_write2_b32 v89, v44, v45 offset1:1
	v_add_u32_e32 v89, vcc, s13, v66
	v_add_u32_e32 v66, vcc, s14, v66
	ds_write2_b32 v89, v47, v48 offset1:1
	ds_write2_b32 v66, v49, v50 offset1:1
	v_add_u32_e32 v66, vcc, s12, v35
	v_lshlrev_b32_e32 v66, 2, v66

    ; register -> shared
	ds_write2st64_b32 v66, v54, v55 offset1:1
	ds_write2st64_b32 v66, v56, v57 offset0:2 offset1:3

	ds_write2st64_b32 v66, v60, v61 offset0:4 offset1:5
	ds_write2st64_b32 v66, v62, v63 offset0:6 offset1:7
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_cmp_eq_u32 s6, 1
	s_cbranch_scc1 BB0_4
; BB#3:                                 ;   in Loop: Header=BB0_2 Depth=1
	v_ashrrev_i32_e32 v66, 31, v65
	v_lshlrev_b64 v[42:43], 2, v[65:66]
	v_mov_b32_e32 v44, s9
	v_add_u32_e32 v42, vcc, s8, v42
	v_addc_u32_e32 v43, vcc, v44, v43, vcc
	v_add_u32_e32 v47, vcc, 16, v42
	s_ashr_i32 s5, s4, 31
	v_addc_u32_e32 v48, vcc, 0, v43, vcc
	s_lshl_b64 s[16:17], s[4:5], 2
	v_mov_b32_e32 v55, s17
	v_add_u32_e32 v54, vcc, s16, v39
	v_addc_u32_e32 v55, vcc, v40, v55, vcc
	v_add_u32_e32 v60, vcc, 16, v54
	v_addc_u32_e32 v61, vcc, 0, v55, vcc
	flat_load_dwordx4 v[42:45], v[42:43]
	flat_load_dwordx4 v[54:57], v[54:55]
	flat_load_dwordx4 v[47:50], v[47:48]
	flat_load_dwordx4 v[60:63], v[60:61]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
BB0_4:                                  ;   in Loop: Header=BB0_2 Depth=1
	v_add_u32_e32 v66, vcc, s12, v38
	v_lshlrev_b32_e32 v89, 2, v66
	v_add_u32_e32 v66, vcc, s12, v28
	s_mov_b32 m0, -1
	v_add_u32_e32 v102, vcc, s14, v89
	v_lshlrev_b32_e32 v66, 2, v66
	v_add_u32_e32 v90, vcc, s10, v89
	v_add_u32_e32 v100, vcc, s11, v89
	v_add_u32_e32 v98, vcc, s13, v89
    ; v90 v91
	ds_read2_b32 v[90:91], v90 offset1:1
    ; v92 v93
	ds_read2_b32 v[92:93], v66 offset1:1
    ; v94 v95
	ds_read2_b32 v[94:95], v66 offset0:2 offset1:3
    ; v98 v99
	ds_read2_b32 v[98:99], v98 offset1:1
    ; v100 v101
	ds_read2_b32 v[100:101], v100 offset1:1
    ; v102 v103
	ds_read2_b32 v[102:103], v102 offset1:1
    ; v96 v97
	ds_read2_b32 v[96:97], v66 offset0:4 offset1:5
	s_waitcnt lgkmcnt(5)

    ; col 0
	v_mac_f32_e32 v76, v90, v92
	v_mac_f32_e32 v77, v91, v92
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v78, v100, v92
	v_mac_f32_e32 v79, v101, v92
	v_mac_f32_e32 v72, v98, v92
	v_mac_f32_e32 v73, v99, v92
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v74, v102, v92
	v_mac_f32_e32 v75, v103, v92

    ; col 1
	v_mac_f32_e32 v68, v90, v93
	v_mac_f32_e32 v69, v91, v93
	v_mac_f32_e32 v70, v100, v93
	v_mac_f32_e32 v71, v101, v93
	v_mac_f32_e32 v64, v98, v93
	v_mac_f32_e32 v88, v99, v93
	v_mac_f32_e32 v87, v102, v93
	v_mac_f32_e32 v67, v103, v93

    ; col 2
	v_mac_f32_e32 v37, v90, v94
	v_mac_f32_e32 v36, v91, v94
	v_mac_f32_e32 v53, v100, v94
	v_mac_f32_e32 v86, v101, v94
	v_mac_f32_e32 v85, v98, v94
	v_mac_f32_e32 v84, v99, v94
	v_mac_f32_e32 v51, v102, v94
	v_mac_f32_e32 v52, v103, v94

    ; col 3
	v_mac_f32_e32 v46, v90, v95
	v_mac_f32_e32 v83, v91, v95
	v_mac_f32_e32 v82, v100, v95
	v_mac_f32_e32 v81, v101, v95
	v_mac_f32_e32 v41, v98, v95
	v_mac_f32_e32 v80, v99, v95
	v_mac_f32_e32 v59, v102, v95
	v_mac_f32_e32 v58, v103, v95
	ds_read2_b32 v[92:93], v66 offset0:6 offset1:7
	s_waitcnt lgkmcnt(1)

    ; col 4
	v_mac_f32_e32 v30, v90, v96
	v_mac_f32_e32 v29, v91, v96
	v_mac_f32_e32 v27, v100, v96
	v_mac_f32_e32 v25, v101, v96
	v_mac_f32_e32 v34, v98, v96
	v_mac_f32_e32 v24, v99, v96
	v_mac_f32_e32 v23, v102, v96
	v_mac_f32_e32 v22, v103, v96
    
    ; col 5
	v_mac_f32_e32 v33, v90, v97
	v_mac_f32_e32 v19, v91, v97
	v_mac_f32_e32 v18, v100, v97
	v_mac_f32_e32 v17, v101, v97
	v_mac_f32_e32 v32, v98, v97
	v_mac_f32_e32 v15, v99, v97
	v_mac_f32_e32 v14, v102, v97
	v_mac_f32_e32 v13, v103, v97
	ds_read2_b32 v[94:95], v66 offset0:64 offset1:65
	ds_read2_b32 v[96:97], v66 offset0:66 offset1:67
	s_waitcnt lgkmcnt(2)

    ;
	v_mac_f32_e32 v12, v90, v92
	v_mac_f32_e32 v20, v90, v93
	v_mac_f32_e32 v11, v91, v92
	v_mac_f32_e32 v26, v100, v92
	v_mac_f32_e32 v5, v100, v93
	v_mac_f32_e32 v10, v101, v92
	v_mac_f32_e32 v9, v98, v92
	v_mac_f32_e32 v16, v98, v93
	v_mac_f32_e32 v8, v99, v92
	v_mac_f32_e32 v21, v102, v92
	v_mac_f32_e32 v7, v103, v92
	v_add_u32_e32 v98, vcc, 0x1100, v89
	v_add_u32_e32 v92, vcc, 0x1108, v89
	v_add_u32_e32 v90, vcc, 0x1110, v89
	v_add_u32_e32 v100, vcc, 0x1118, v89
	v_mac_f32_e32 v4, v101, v93
	ds_read2_b32 v[100:101], v100 offset1:1
	v_mac_f32_e32 v6, v91, v93
	v_mac_f32_e32 v3, v99, v93
	v_mac_f32_e32 v2, v102, v93
	v_mac_f32_e32 v0, v103, v93
	ds_read2_b32 v[90:91], v90 offset1:1
	ds_read2_b32 v[92:93], v92 offset1:1
	ds_read2_b32 v[98:99], v98 offset1:1
	s_waitcnt lgkmcnt(3)

    ;
	v_mac_f32_e32 v74, v100, v94
	v_mac_f32_e32 v75, v101, v94
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v72, v90, v94
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v78, v92, v94
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v76, v98, v94
	v_mac_f32_e32 v77, v99, v94
	v_mac_f32_e32 v79, v93, v94
	v_mac_f32_e32 v73, v91, v94
    
    ;
	v_mac_f32_e32 v68, v98, v95
	v_mac_f32_e32 v69, v99, v95
	v_mac_f32_e32 v70, v92, v95
	v_mac_f32_e32 v71, v93, v95
	v_mac_f32_e32 v64, v90, v95
	v_mac_f32_e32 v88, v91, v95
	v_mac_f32_e32 v87, v100, v95
	v_mac_f32_e32 v67, v101, v95

    ;
	v_mac_f32_e32 v37, v98, v96
	v_mac_f32_e32 v36, v99, v96
	v_mac_f32_e32 v53, v92, v96
	v_mac_f32_e32 v86, v93, v96
	v_mac_f32_e32 v85, v90, v96
	v_mac_f32_e32 v84, v91, v96
	v_mac_f32_e32 v51, v100, v96
	v_mac_f32_e32 v52, v101, v96

    ;
	v_mac_f32_e32 v46, v98, v97
	v_mac_f32_e32 v83, v99, v97
	v_mac_f32_e32 v82, v92, v97
	v_mac_f32_e32 v81, v93, v97
	v_mac_f32_e32 v41, v90, v97
	v_mac_f32_e32 v80, v91, v97
	v_mac_f32_e32 v59, v100, v97
	v_mac_f32_e32 v58, v101, v97
	ds_read2_b32 v[94:95], v66 offset0:68 offset1:69
	ds_read2_b32 v[96:97], v66 offset0:70 offset1:71
	ds_read2_b32 v[102:103], v66 offset0:128 offset1:129
	v_add_u32_e32 v104, vcc, 0x1418, v89
	ds_read2_b32 v[104:105], v104 offset1:1
	s_waitcnt lgkmcnt(3)

    ;
	v_mac_f32_e32 v30, v98, v94
	v_mac_f32_e32 v29, v99, v94
	v_mac_f32_e32 v27, v92, v94
	v_mac_f32_e32 v25, v93, v94
	v_mac_f32_e32 v34, v90, v94
	v_mac_f32_e32 v24, v91, v94
	v_mac_f32_e32 v23, v100, v94
	v_mac_f32_e32 v22, v101, v94

    ;
	v_mac_f32_e32 v18, v92, v95
	v_mac_f32_e32 v32, v90, v95
	v_mac_f32_e32 v15, v91, v95
	v_add_u32_e32 v94, vcc, 0x1200, v89
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v26, v92, v96
	v_mac_f32_e32 v5, v92, v97
	v_add_u32_e32 v92, vcc, 0x1208, v89
	v_mac_f32_e32 v9, v90, v96
	v_mac_f32_e32 v16, v90, v97
	v_mac_f32_e32 v8, v91, v96
	v_mac_f32_e32 v3, v91, v97
	v_add_u32_e32 v90, vcc, 0x1210, v89
	v_add_u32_e32 v91, vcc, 0x1218, v89
	v_mac_f32_e32 v33, v98, v95
	v_mac_f32_e32 v19, v99, v95
	v_mac_f32_e32 v17, v93, v95
	v_mac_f32_e32 v14, v100, v95
	v_mac_f32_e32 v13, v101, v95
	ds_read2_b32 v[94:95], v94 offset1:1
	v_mac_f32_e32 v12, v98, v96
	v_mac_f32_e32 v11, v99, v96
	v_mac_f32_e32 v20, v98, v97
	v_mac_f32_e32 v6, v99, v97
	v_mac_f32_e32 v10, v93, v96
	v_mac_f32_e32 v4, v93, v97
	ds_read2_b32 v[92:93], v92 offset1:1
	v_mac_f32_e32 v21, v100, v96
	v_mac_f32_e32 v7, v101, v96
	v_mac_f32_e32 v2, v100, v97
	v_mac_f32_e32 v0, v101, v97
	ds_read2_b32 v[96:97], v91 offset1:1
	ds_read2_b32 v[98:99], v90 offset1:1
	s_waitcnt lgkmcnt(3)
    
    ;
	v_mac_f32_e32 v76, v94, v102
	v_mac_f32_e32 v77, v95, v102
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v78, v92, v102
	v_mac_f32_e32 v79, v93, v102
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v72, v98, v102
	v_mac_f32_e32 v73, v99, v102
	v_mac_f32_e32 v74, v96, v102
	v_mac_f32_e32 v75, v97, v102

    ;
	v_mac_f32_e32 v68, v94, v103
	v_mac_f32_e32 v69, v95, v103
	v_mac_f32_e32 v70, v92, v103
	v_mac_f32_e32 v71, v93, v103
	v_mac_f32_e32 v64, v98, v103
	v_mac_f32_e32 v88, v99, v103
	v_mac_f32_e32 v87, v96, v103
	v_mac_f32_e32 v67, v97, v103
	ds_read2_b32 v[90:91], v66 offset0:130 offset1:131
	ds_read2_b32 v[100:101], v66 offset0:132 offset1:133
	ds_read2_b32 v[102:103], v66 offset0:134 offset1:135
	s_add_i32 s5, s12, 0x200
	s_ashr_i32 s12, s5, 31
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v37, v94, v90
	v_mac_f32_e32 v53, v92, v90
	v_mac_f32_e32 v46, v94, v91
	v_mac_f32_e32 v82, v92, v91
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v30, v94, v100
	v_mac_f32_e32 v27, v92, v100
	v_mac_f32_e32 v33, v94, v101
	v_mac_f32_e32 v18, v92, v101
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v12, v94, v102
	v_mac_f32_e32 v20, v94, v103
	v_mac_f32_e32 v26, v92, v102
	v_mac_f32_e32 v5, v92, v103
	v_add_u32_e32 v94, vcc, 0x1308, v89
	v_add_u32_e32 v92, vcc, 0x1310, v89
	v_mac_f32_e32 v36, v95, v90
	v_mac_f32_e32 v86, v93, v90
	v_mac_f32_e32 v85, v98, v90
	v_mac_f32_e32 v84, v99, v90
	v_mac_f32_e32 v51, v96, v90
	v_mac_f32_e32 v52, v97, v90
	v_mac_f32_e32 v81, v93, v91
	v_mac_f32_e32 v59, v96, v91
	v_mac_f32_e32 v58, v97, v91
	v_mac_f32_e32 v25, v93, v100
	v_mac_f32_e32 v23, v96, v100
	v_mac_f32_e32 v22, v97, v100
	v_mac_f32_e32 v17, v93, v101
	v_mac_f32_e32 v14, v96, v101
	v_mac_f32_e32 v13, v97, v101
	v_add_u32_e32 v90, vcc, 0x1300, v89
	v_mac_f32_e32 v10, v93, v102
	v_mac_f32_e32 v4, v93, v103
	v_mac_f32_e32 v21, v96, v102
	v_mac_f32_e32 v7, v97, v102
	v_mac_f32_e32 v2, v96, v103
	v_mac_f32_e32 v0, v97, v103
	ds_read2_b32 v[92:93], v92 offset1:1
	ds_read2_b32 v[96:97], v94 offset1:1
	v_add_u32_e32 v94, vcc, 0x1318, v89
	v_mac_f32_e32 v83, v95, v91
	v_mac_f32_e32 v41, v98, v91
	v_mac_f32_e32 v80, v99, v91
	v_mac_f32_e32 v29, v95, v100
	v_mac_f32_e32 v34, v98, v100
	v_mac_f32_e32 v24, v99, v100
	v_mac_f32_e32 v19, v95, v101
	v_mac_f32_e32 v32, v98, v101
	v_mac_f32_e32 v15, v99, v101
	ds_read2_b32 v[90:91], v90 offset1:1
	v_mac_f32_e32 v11, v95, v102
	v_mac_f32_e32 v6, v95, v103
	v_mac_f32_e32 v9, v98, v102
	v_mac_f32_e32 v8, v99, v102
	v_mac_f32_e32 v16, v98, v103
	v_mac_f32_e32 v3, v99, v103
	ds_read2_b32 v[98:99], v66 offset0:192 offset1:193
	ds_read2_b32 v[100:101], v66 offset0:194 offset1:195
	ds_read2_b32 v[94:95], v94 offset1:1
	ds_read2_b32 v[102:103], v66 offset0:196 offset1:197
	s_lshr_b32 s12, s12, 22
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v76, v90, v98
	v_mac_f32_e32 v77, v91, v98
	v_mac_f32_e32 v78, v96, v98
	v_mac_f32_e32 v79, v97, v98
	v_mac_f32_e32 v72, v92, v98
	v_mac_f32_e32 v73, v93, v98
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v74, v94, v98
	v_mac_f32_e32 v75, v95, v98
	v_mac_f32_e32 v68, v90, v99
	v_mac_f32_e32 v69, v91, v99
	v_mac_f32_e32 v70, v96, v99
	v_mac_f32_e32 v71, v97, v99
	v_mac_f32_e32 v64, v92, v99
	v_mac_f32_e32 v88, v93, v99
	v_mac_f32_e32 v87, v94, v99
	v_mac_f32_e32 v67, v95, v99
	v_mac_f32_e32 v37, v90, v100
	v_mac_f32_e32 v36, v91, v100
	v_mac_f32_e32 v53, v96, v100
	v_mac_f32_e32 v86, v97, v100
	v_mac_f32_e32 v85, v92, v100
	v_mac_f32_e32 v84, v93, v100
	v_mac_f32_e32 v51, v94, v100
	v_mac_f32_e32 v52, v95, v100
	v_mac_f32_e32 v46, v90, v101
	v_mac_f32_e32 v83, v91, v101
	v_mac_f32_e32 v82, v96, v101
	v_mac_f32_e32 v81, v97, v101
	v_mac_f32_e32 v41, v92, v101
	v_mac_f32_e32 v80, v93, v101
	v_mac_f32_e32 v59, v94, v101
	v_mac_f32_e32 v58, v95, v101
	v_add_u32_e32 v100, vcc, 0x718, v66
	ds_read2_b32 v[98:99], v66 offset0:198 offset1:199
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v30, v90, v102
	v_mac_f32_e32 v29, v91, v102
	v_mac_f32_e32 v27, v96, v102
	v_mac_f32_e32 v25, v97, v102
	v_mac_f32_e32 v34, v92, v102
	v_mac_f32_e32 v24, v93, v102
	v_mac_f32_e32 v23, v94, v102
	v_mac_f32_e32 v22, v95, v102
	v_add_u32_e32 v102, vcc, 0x710, v66
	v_mac_f32_e32 v33, v90, v103
	v_mac_f32_e32 v19, v91, v103
	v_mac_f32_e32 v18, v96, v103
	v_mac_f32_e32 v17, v97, v103
	v_mac_f32_e32 v32, v92, v103
	v_mac_f32_e32 v15, v93, v103
	v_mac_f32_e32 v14, v94, v103
	v_mac_f32_e32 v13, v95, v103
	ds_read2_b32 v[100:101], v100 offset1:1
	ds_read2_b32 v[102:103], v102 offset1:1
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v12, v90, v98
	v_mac_f32_e32 v20, v90, v99
	v_mac_f32_e32 v11, v91, v98
	v_mac_f32_e32 v26, v96, v98
	v_mac_f32_e32 v10, v97, v98
	v_mac_f32_e32 v9, v92, v98
	v_mac_f32_e32 v16, v92, v99
	v_mac_f32_e32 v8, v93, v98
	v_mac_f32_e32 v21, v94, v98
	v_mac_f32_e32 v7, v95, v98
	v_mac_f32_e32 v2, v94, v99
	v_add_u32_e32 v92, vcc, 0x1400, v89
	v_add_u32_e32 v90, vcc, 0x1408, v89
	v_add_u32_e32 v94, vcc, 0x400, v66
	v_add_u32_e32 v98, vcc, 0x1410, v89
	v_mac_f32_e32 v5, v96, v99
	v_mac_f32_e32 v6, v91, v99
	v_mac_f32_e32 v3, v93, v99
	ds_read2_b32 v[90:91], v90 offset1:1
	v_mac_f32_e32 v4, v97, v99
	v_mac_f32_e32 v0, v95, v99
	v_add_u32_e32 v96, vcc, 0x1718, v89
	ds_read2_b32 v[94:95], v94 offset1:1
	ds_read2_b32 v[92:93], v92 offset1:1
	ds_read2_b32 v[98:99], v98 offset1:1
	ds_read2_b32 v[96:97], v96 offset1:1
	s_add_i32 s12, s5, s12
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v78, v90, v94
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v76, v92, v94
	v_mac_f32_e32 v77, v93, v94
	v_mac_f32_e32 v79, v91, v94
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v72, v98, v94
	v_mac_f32_e32 v73, v99, v94
	v_mac_f32_e32 v74, v104, v94
	v_mac_f32_e32 v75, v105, v94
	v_add_u32_e32 v94, vcc, 0x408, v66
	v_mac_f32_e32 v68, v92, v95
	v_mac_f32_e32 v69, v93, v95
	v_mac_f32_e32 v70, v90, v95
	v_mac_f32_e32 v71, v91, v95
	v_mac_f32_e32 v64, v98, v95
	v_mac_f32_e32 v88, v99, v95
	v_mac_f32_e32 v87, v104, v95
	v_mac_f32_e32 v67, v105, v95
	ds_read2_b32 v[94:95], v94 offset1:1
	s_and_b32 s12, s12, 0xfffffc00
	s_sub_i32 s12, s5, s12
	s_add_i32 s6, s6, -1
	s_add_i32 s4, s4, 8
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v37, v92, v94
	v_mac_f32_e32 v36, v93, v94
	v_mac_f32_e32 v53, v90, v94
	v_mac_f32_e32 v86, v91, v94
	v_mac_f32_e32 v85, v98, v94
	v_mac_f32_e32 v84, v99, v94
	v_mac_f32_e32 v51, v104, v94
	v_mac_f32_e32 v52, v105, v94
	v_add_u32_e32 v94, vcc, 0x410, v66
	v_mac_f32_e32 v46, v92, v95
	v_mac_f32_e32 v83, v93, v95
	v_mac_f32_e32 v82, v90, v95
	v_mac_f32_e32 v81, v91, v95
	v_mac_f32_e32 v41, v98, v95
	v_mac_f32_e32 v80, v99, v95
	v_mac_f32_e32 v59, v104, v95
	v_mac_f32_e32 v58, v105, v95
	ds_read2_b32 v[94:95], v94 offset1:1
	s_cmp_eq_u32 s6, 0
	v_add_u32_e32 v65, vcc, s7, v65
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v30, v92, v94
	v_mac_f32_e32 v29, v93, v94
	v_mac_f32_e32 v27, v90, v94
	v_mac_f32_e32 v25, v91, v94
	v_mac_f32_e32 v34, v98, v94
	v_mac_f32_e32 v24, v99, v94
	v_mac_f32_e32 v23, v104, v94
	v_mac_f32_e32 v22, v105, v94
	v_add_u32_e32 v94, vcc, 0x418, v66
	v_mac_f32_e32 v33, v92, v95
	v_mac_f32_e32 v19, v93, v95
	v_mac_f32_e32 v18, v90, v95
	v_mac_f32_e32 v17, v91, v95
	v_mac_f32_e32 v32, v98, v95
	v_mac_f32_e32 v15, v99, v95
	v_mac_f32_e32 v14, v104, v95
	v_mac_f32_e32 v13, v105, v95
	ds_read2_b32 v[94:95], v94 offset1:1
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v12, v92, v94
	v_mac_f32_e32 v20, v92, v95
	v_mac_f32_e32 v11, v93, v94
	v_mac_f32_e32 v26, v90, v94
	v_mac_f32_e32 v5, v90, v95
	v_mac_f32_e32 v10, v91, v94
	v_mac_f32_e32 v9, v98, v94
	v_mac_f32_e32 v16, v98, v95
	v_mac_f32_e32 v8, v99, v94
	v_add_u32_e32 v90, vcc, 0x1500, v89
	v_mac_f32_e32 v21, v104, v94
	v_mac_f32_e32 v7, v105, v94
	v_mac_f32_e32 v2, v104, v95
	v_add_u32_e32 v92, vcc, 0x500, v66
	v_add_u32_e32 v94, vcc, 0x1508, v89
	v_add_u32_e32 v98, vcc, 0x1510, v89
	v_add_u32_e32 v104, vcc, 0x1518, v89
	v_mac_f32_e32 v6, v93, v95
	v_mac_f32_e32 v4, v91, v95
	v_mac_f32_e32 v3, v99, v95
	v_mac_f32_e32 v0, v105, v95
	ds_read2_b32 v[90:91], v90 offset1:1
	ds_read2_b32 v[92:93], v92 offset1:1
	ds_read2_b32 v[94:95], v94 offset1:1
	ds_read2_b32 v[98:99], v98 offset1:1
	ds_read2_b32 v[104:105], v104 offset1:1
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v76, v90, v92
	v_mac_f32_e32 v77, v91, v92
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v78, v94, v92
	v_mac_f32_e32 v79, v95, v92
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v72, v98, v92
	v_mac_f32_e32 v73, v99, v92
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v74, v104, v92
	v_mac_f32_e32 v75, v105, v92
	v_add_u32_e32 v92, vcc, 0x508, v66
	v_mac_f32_e32 v68, v90, v93
	v_mac_f32_e32 v69, v91, v93
	v_mac_f32_e32 v70, v94, v93
	v_mac_f32_e32 v71, v95, v93
	v_mac_f32_e32 v64, v98, v93
	v_mac_f32_e32 v88, v99, v93
	v_mac_f32_e32 v87, v104, v93
	v_mac_f32_e32 v67, v105, v93
	ds_read2_b32 v[92:93], v92 offset1:1
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v37, v90, v92
	v_mac_f32_e32 v36, v91, v92
	v_mac_f32_e32 v53, v94, v92
	v_mac_f32_e32 v86, v95, v92
	v_mac_f32_e32 v85, v98, v92
	v_mac_f32_e32 v84, v99, v92
	v_mac_f32_e32 v51, v104, v92
	v_mac_f32_e32 v52, v105, v92
	v_add_u32_e32 v92, vcc, 0x510, v66
	v_mac_f32_e32 v46, v90, v93
	v_mac_f32_e32 v83, v91, v93
	v_mac_f32_e32 v82, v94, v93
	v_mac_f32_e32 v81, v95, v93
	v_mac_f32_e32 v41, v98, v93
	v_mac_f32_e32 v80, v99, v93
	v_mac_f32_e32 v59, v104, v93
	v_mac_f32_e32 v58, v105, v93
	ds_read2_b32 v[92:93], v92 offset1:1
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v30, v90, v92
	v_mac_f32_e32 v29, v91, v92
	v_mac_f32_e32 v27, v94, v92
	v_mac_f32_e32 v25, v95, v92
	v_mac_f32_e32 v34, v98, v92
	v_mac_f32_e32 v24, v99, v92
	v_mac_f32_e32 v23, v104, v92
	v_mac_f32_e32 v22, v105, v92
	v_add_u32_e32 v92, vcc, 0x518, v66
	v_mac_f32_e32 v33, v90, v93
	v_mac_f32_e32 v19, v91, v93
	v_mac_f32_e32 v18, v94, v93
	v_mac_f32_e32 v17, v95, v93
	v_mac_f32_e32 v32, v98, v93
	v_mac_f32_e32 v15, v99, v93
	v_mac_f32_e32 v14, v104, v93
	v_mac_f32_e32 v13, v105, v93
	ds_read2_b32 v[92:93], v92 offset1:1
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v12, v90, v92
	v_mac_f32_e32 v20, v90, v93
	v_mac_f32_e32 v11, v91, v92
	v_mac_f32_e32 v26, v94, v92
	v_mac_f32_e32 v5, v94, v93
	v_mac_f32_e32 v10, v95, v92
	v_mac_f32_e32 v9, v98, v92
	v_mac_f32_e32 v16, v98, v93
	v_mac_f32_e32 v8, v99, v92
	v_add_u32_e32 v90, vcc, 0x1600, v89
	v_mac_f32_e32 v21, v104, v92
	v_mac_f32_e32 v7, v105, v92
	v_mac_f32_e32 v2, v104, v93
	v_add_u32_e32 v92, vcc, 0x600, v66
	v_add_u32_e32 v94, vcc, 0x1608, v89
	v_add_u32_e32 v98, vcc, 0x1610, v89
	v_add_u32_e32 v104, vcc, 0x1618, v89
	v_mac_f32_e32 v6, v91, v93
	v_mac_f32_e32 v4, v95, v93
	v_mac_f32_e32 v3, v99, v93
	v_mac_f32_e32 v0, v105, v93
	ds_read2_b32 v[90:91], v90 offset1:1
	ds_read2_b32 v[92:93], v92 offset1:1
	ds_read2_b32 v[94:95], v94 offset1:1
	ds_read2_b32 v[98:99], v98 offset1:1
	ds_read2_b32 v[104:105], v104 offset1:1
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v76, v90, v92
	v_mac_f32_e32 v77, v91, v92
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v78, v94, v92
	v_mac_f32_e32 v79, v95, v92
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v72, v98, v92
	v_mac_f32_e32 v73, v99, v92
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v74, v104, v92
	v_mac_f32_e32 v75, v105, v92
	v_add_u32_e32 v92, vcc, 0x608, v66
	v_mac_f32_e32 v68, v90, v93
	v_mac_f32_e32 v69, v91, v93
	v_mac_f32_e32 v70, v94, v93
	v_mac_f32_e32 v71, v95, v93
	v_mac_f32_e32 v64, v98, v93
	v_mac_f32_e32 v88, v99, v93
	v_mac_f32_e32 v87, v104, v93
	v_mac_f32_e32 v67, v105, v93
	ds_read2_b32 v[92:93], v92 offset1:1
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v37, v90, v92
	v_mac_f32_e32 v36, v91, v92
	v_mac_f32_e32 v53, v94, v92
	v_mac_f32_e32 v86, v95, v92
	v_mac_f32_e32 v85, v98, v92
	v_mac_f32_e32 v84, v99, v92
	v_mac_f32_e32 v51, v104, v92
	v_mac_f32_e32 v52, v105, v92
	v_add_u32_e32 v92, vcc, 0x610, v66
	v_mac_f32_e32 v46, v90, v93
	v_mac_f32_e32 v83, v91, v93
	v_mac_f32_e32 v82, v94, v93
	v_mac_f32_e32 v81, v95, v93
	v_mac_f32_e32 v41, v98, v93
	v_mac_f32_e32 v80, v99, v93
	v_mac_f32_e32 v59, v104, v93
	v_mac_f32_e32 v58, v105, v93
	ds_read2_b32 v[92:93], v92 offset1:1
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v23, v104, v92
	v_mac_f32_e32 v22, v105, v92
	v_mac_f32_e32 v30, v90, v92
	v_mac_f32_e32 v29, v91, v92
	v_mac_f32_e32 v27, v94, v92
	v_mac_f32_e32 v25, v95, v92
	v_mac_f32_e32 v34, v98, v92
	v_mac_f32_e32 v24, v99, v92
	v_add_u32_e32 v92, vcc, 0x618, v66
	v_mac_f32_e32 v14, v104, v93
	v_mac_f32_e32 v13, v105, v93
	v_mac_f32_e32 v33, v90, v93
	v_mac_f32_e32 v19, v91, v93
	v_mac_f32_e32 v18, v94, v93
	v_mac_f32_e32 v17, v95, v93
	v_mac_f32_e32 v32, v98, v93
	v_mac_f32_e32 v15, v99, v93
	ds_read2_b32 v[92:93], v92 offset1:1
	v_mac_f32_e32 v23, v96, v102
	v_mac_f32_e32 v22, v97, v102
	v_mac_f32_e32 v14, v96, v103
	v_mac_f32_e32 v13, v97, v103
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v12, v90, v92
	v_mac_f32_e32 v20, v90, v93
	v_add_u32_e32 v90, vcc, 0x700, v66
	v_mac_f32_e32 v26, v94, v92
	v_mac_f32_e32 v5, v94, v93
	v_mac_f32_e32 v9, v98, v92
	v_mac_f32_e32 v16, v98, v93
	v_add_u32_e32 v98, vcc, 0x1700, v89
	v_add_u32_e32 v94, vcc, 0x1708, v89
	v_add_u32_e32 v89, vcc, 0x1710, v89
	v_mac_f32_e32 v21, v104, v92
	v_mac_f32_e32 v7, v105, v92
	v_mac_f32_e32 v2, v104, v93
	v_mac_f32_e32 v0, v105, v93
	v_mac_f32_e32 v11, v91, v92
	v_mac_f32_e32 v6, v91, v93
	ds_read2_b32 v[90:91], v90 offset1:1
	v_mac_f32_e32 v10, v95, v92
	v_mac_f32_e32 v4, v95, v93
	v_mac_f32_e32 v8, v99, v92
	v_mac_f32_e32 v3, v99, v93
	ds_read2_b32 v[92:93], v89 offset1:1
	ds_read2_b32 v[94:95], v94 offset1:1
	ds_read2_b32 v[98:99], v98 offset1:1
	v_add_u32_e32 v66, vcc, 0x708, v66
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v74, v96, v90
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v72, v92, v90
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v78, v94, v90
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v76, v98, v90
	v_mac_f32_e32 v77, v99, v90
	v_mac_f32_e32 v79, v95, v90
	v_mac_f32_e32 v73, v93, v90
	v_mac_f32_e32 v75, v97, v90
	ds_read2_b32 v[89:90], v66 offset1:1
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mac_f32_e32 v68, v98, v91
	v_mac_f32_e32 v69, v99, v91
	v_mac_f32_e32 v70, v94, v91
	v_mac_f32_e32 v71, v95, v91
	v_mac_f32_e32 v64, v92, v91
	v_mac_f32_e32 v88, v93, v91
	v_mac_f32_e32 v87, v96, v91
	v_mac_f32_e32 v67, v97, v91
	v_mac_f32_e32 v37, v98, v89
	v_mac_f32_e32 v36, v99, v89
	v_mac_f32_e32 v53, v94, v89
	v_mac_f32_e32 v86, v95, v89
	v_mac_f32_e32 v85, v92, v89
	v_mac_f32_e32 v84, v93, v89
	v_mac_f32_e32 v51, v96, v89
	v_mac_f32_e32 v52, v97, v89
	v_mac_f32_e32 v46, v98, v90
	v_mac_f32_e32 v83, v99, v90
	v_mac_f32_e32 v82, v94, v90
	v_mac_f32_e32 v81, v95, v90
	v_mac_f32_e32 v41, v92, v90
	v_mac_f32_e32 v80, v93, v90
	v_mac_f32_e32 v59, v96, v90
	v_mac_f32_e32 v58, v97, v90
	v_mac_f32_e32 v30, v98, v102
	v_mac_f32_e32 v29, v99, v102
	v_mac_f32_e32 v27, v94, v102
	v_mac_f32_e32 v25, v95, v102
	v_mac_f32_e32 v34, v92, v102
	v_mac_f32_e32 v24, v93, v102
	v_mac_f32_e32 v33, v98, v103
	v_mac_f32_e32 v19, v99, v103
	v_mac_f32_e32 v18, v94, v103
	v_mac_f32_e32 v17, v95, v103
	v_mac_f32_e32 v32, v92, v103
	v_mac_f32_e32 v15, v93, v103
	v_mac_f32_e32 v12, v98, v100
	v_mac_f32_e32 v11, v99, v100
	v_mac_f32_e32 v20, v98, v101
	v_mac_f32_e32 v6, v99, v101
	v_mac_f32_e32 v26, v94, v100
	v_mac_f32_e32 v10, v95, v100
	v_mac_f32_e32 v5, v94, v101
	v_mac_f32_e32 v4, v95, v101
	v_mac_f32_e32 v9, v92, v100
	v_mac_f32_e32 v8, v93, v100
	v_mac_f32_e32 v16, v92, v101
	v_mac_f32_e32 v3, v93, v101
	v_mac_f32_e32 v21, v96, v100
	v_mac_f32_e32 v7, v97, v100
	v_mac_f32_e32 v2, v96, v101
	v_mac_f32_e32 v0, v97, v101
	s_cbranch_scc0 BB0_2
BB0_5:                                  ; %._crit_edge
	v_add_u32_e32 v1, vcc, s3, v28
	v_mul_lo_i32 v1, v1, s2
	v_mov_b32_e32 v28, s1
	v_mov_b32_e32 v65, v88
	v_mov_b32_e32 v66, v87
	v_add_u32_e32 v38, vcc, v31, v1
	v_ashrrev_i32_e32 v39, 31, v38
	v_lshlrev_b64 v[39:40], 2, v[38:39]
	v_mov_b32_e32 v1, s1
	v_add_u32_e32 v39, vcc, s0, v39
	v_addc_u32_e32 v40, vcc, v1, v40, vcc
	flat_store_dwordx4 v[39:40], v[76:79]
	v_or_b32_e32 v39, 4, v38
	v_ashrrev_i32_e32 v40, 31, v39
	v_lshlrev_b64 v[39:40], 2, v[39:40]
	v_add_u32_e32 v39, vcc, s0, v39
	v_addc_u32_e32 v40, vcc, v28, v40, vcc
	v_add_u32_e32 v38, vcc, s2, v38
	flat_store_dwordx4 v[39:40], v[72:75]
	v_ashrrev_i32_e32 v39, 31, v38
	v_lshlrev_b64 v[39:40], 2, v[38:39]
	v_mov_b32_e32 v31, s1
	v_add_u32_e32 v39, vcc, s0, v39
	v_addc_u32_e32 v40, vcc, v31, v40, vcc
	flat_store_dwordx4 v[39:40], v[68:71]
	v_add_u32_e32 v39, vcc, 16, v39
	v_addc_u32_e32 v40, vcc, 0, v40, vcc
	v_add_u32_e32 v38, vcc, s2, v38
	flat_store_dwordx4 v[39:40], v[64:67]
	v_ashrrev_i32_e32 v39, 31, v38
	v_lshlrev_b64 v[39:40], 2, v[38:39]
	v_or_b32_e32 v57, 1, v38
	v_mov_b32_e32 v44, v58
	v_ashrrev_i32_e32 v58, 31, v57
	v_mov_b32_e32 v35, s1
	v_add_u32_e32 v39, vcc, s0, v39
	v_addc_u32_e32 v40, vcc, v35, v40, vcc
	v_lshlrev_b64 v[57:58], 2, v[57:58]
	v_mov_b32_e32 v45, s1
	v_add_u32_e32 v57, vcc, s0, v57
	v_addc_u32_e32 v58, vcc, v45, v58, vcc
	v_add_u32_e32 v35, vcc, 8, v39
	flat_store_dword v[39:40], v37
	flat_store_dword v[57:58], v36
	v_mov_b32_e32 v54, v86
	v_mov_b32_e32 v55, v85
	v_mov_b32_e32 v56, v84
	v_addc_u32_e32 v36, vcc, 0, v40, vcc
	flat_store_dwordx4 v[35:36], v[53:56]
	v_add_u32_e32 v35, vcc, 24, v39
	v_addc_u32_e32 v36, vcc, 0, v40, vcc
	flat_store_dwordx2 v[35:36], v[51:52]
	v_add_u32_e32 v35, vcc, s2, v38
	v_ashrrev_i32_e32 v36, 31, v35
	v_lshlrev_b64 v[36:37], 2, v[35:36]
	v_mov_b32_e32 v50, s1
	v_add_u32_e32 v36, vcc, s0, v36
	v_mov_b32_e32 v47, v83
	v_mov_b32_e32 v48, v82
	v_mov_b32_e32 v49, v81
	v_addc_u32_e32 v37, vcc, v50, v37, vcc
	flat_store_dwordx4 v[36:37], v[46:49]
	v_add_u32_e32 v36, vcc, 16, v36
	v_addc_u32_e32 v37, vcc, 0, v37, vcc
	v_add_u32_e32 v38, vcc, s2, v35
	v_mov_b32_e32 v43, v59
	v_mov_b32_e32 v42, v80
	v_ashrrev_i32_e32 v39, 31, v38
	flat_store_dwordx4 v[36:37], v[41:44]
	v_lshlrev_b64 v[35:36], 2, v[38:39]
	v_or_b32_e32 v39, 1, v38
	v_ashrrev_i32_e32 v40, 31, v39
	v_mov_b32_e32 v59, s1
	v_add_u32_e32 v35, vcc, s0, v35
	v_addc_u32_e32 v36, vcc, v59, v36, vcc
	v_lshlrev_b64 v[39:40], 2, v[39:40]
	v_mov_b32_e32 v60, s1
	v_add_u32_e32 v39, vcc, s0, v39
	v_addc_u32_e32 v40, vcc, v60, v40, vcc
	v_or_b32_e32 v28, 2, v38
	flat_store_dword v[35:36], v30
	flat_store_dword v[39:40], v29
	v_ashrrev_i32_e32 v29, 31, v28
	v_lshlrev_b64 v[28:29], 2, v[28:29]
	v_add_u32_e32 v28, vcc, s0, v28
	v_addc_u32_e32 v29, vcc, v1, v29, vcc
	flat_store_dword v[28:29], v27
	v_or_b32_e32 v27, 3, v38
	v_ashrrev_i32_e32 v28, 31, v27
	v_lshlrev_b64 v[27:28], 2, v[27:28]
	v_add_u32_e32 v27, vcc, s0, v27
	v_addc_u32_e32 v28, vcc, v1, v28, vcc
	flat_store_dword v[27:28], v25
	v_add_u32_e32 v27, vcc, 16, v35
	v_addc_u32_e32 v28, vcc, 0, v36, vcc
	v_mov_b32_e32 v37, v22
	v_add_u32_e32 v22, vcc, s2, v38
	v_mov_b32_e32 v36, v23
	v_ashrrev_i32_e32 v23, 31, v22
	v_mov_b32_e32 v35, v24
	v_lshlrev_b64 v[23:24], 2, v[22:23]
	v_add_u32_e32 v23, vcc, s0, v23
	v_addc_u32_e32 v24, vcc, v1, v24, vcc
	flat_store_dwordx4 v[27:28], v[34:37]
	v_mov_b32_e32 v28, v9
	v_mov_b32_e32 v34, v19
	v_mov_b32_e32 v36, v17
	v_mov_b32_e32 v35, v18
	v_add_u32_e32 v17, vcc, 16, v23
	flat_store_dwordx4 v[23:24], v[33:36]
	v_addc_u32_e32 v18, vcc, 0, v24, vcc
	v_mov_b32_e32 v35, v13
	v_add_u32_e32 v13, vcc, s2, v22
	v_mov_b32_e32 v34, v14
	v_mov_b32_e32 v33, v15
	v_ashrrev_i32_e32 v14, 31, v13
	v_lshlrev_b64 v[14:15], 2, v[13:14]
	flat_store_dwordx4 v[17:18], v[32:35]
	v_or_b32_e32 v17, 1, v13
	v_ashrrev_i32_e32 v18, 31, v17
	v_add_u32_e32 v14, vcc, s0, v14
	v_addc_u32_e32 v15, vcc, v1, v15, vcc
	v_lshlrev_b64 v[17:18], 2, v[17:18]
	v_add_u32_e32 v17, vcc, s0, v17
	v_addc_u32_e32 v18, vcc, v1, v18, vcc
	v_add_u32_e32 v9, vcc, 8, v14
	v_mov_b32_e32 v27, v10
	v_addc_u32_e32 v10, vcc, 0, v15, vcc
	v_mov_b32_e32 v29, v8
	v_add_u32_e32 v8, vcc, 24, v14
	flat_store_dword v[14:15], v12
	flat_store_dword v[17:18], v11
	flat_store_dwordx4 v[9:10], v[26:29]
	v_addc_u32_e32 v9, vcc, 0, v15, vcc
	v_mov_b32_e32 v22, v7
	v_add_u32_e32 v7, vcc, s2, v13
	flat_store_dwordx2 v[8:9], v[21:22]
	v_ashrrev_i32_e32 v8, 31, v7
	v_lshlrev_b64 v[7:8], 2, v[7:8]
	v_add_u32_e32 v7, vcc, s0, v7
	v_addc_u32_e32 v8, vcc, v1, v8, vcc
	v_mov_b32_e32 v23, v4
	v_add_u32_e32 v4, vcc, 16, v7
	v_mov_b32_e32 v22, v5
	v_mov_b32_e32 v21, v6
	v_addc_u32_e32 v5, vcc, 0, v8, vcc
	v_mov_b32_e32 v17, v3
	v_mov_b32_e32 v18, v2
	v_mov_b32_e32 v19, v0
	flat_store_dwordx4 v[7:8], v[20:23]
	flat_store_dwordx4 v[4:5], v[16:19]
	s_endpgm
.Lfunc_end0:
	.size	gemm, .Lfunc_end0-gemm
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 4956
; NumSgprs: 20
; NumVgprs: 106
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 8192 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 26
; NumSGPRsForWavesPerEU: 20
; NumVGPRsForWavesPerEU: 106
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1

	.ident	"clang version 4.0 "
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn-amd-amdhsa-amdgizcl-gfx803"
	.amd_amdgpu_hsa_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            gemm
    SymbolName:      'gemm@kd'
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Args:            
      - Name:            A
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
        IsConst:         true
      - Name:            B
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
        IsConst:         true
      - Name:            C
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
      - Name:            M
        TypeName:        int
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
      - Name:            N
        TypeName:        int
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
      - Name:            K
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
      KernargSegmentSize: 72
      GroupSegmentFixedSize: 8192
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        20
      NumVGPRs:        106
      MaxFlatWorkGroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
