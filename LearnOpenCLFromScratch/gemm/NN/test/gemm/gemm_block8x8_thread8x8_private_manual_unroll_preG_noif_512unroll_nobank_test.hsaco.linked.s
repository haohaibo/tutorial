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
		wavefront_sgpr_count = 18
		workitem_vgpr_count = 107
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
	s_load_dword s2, s[4:5], 0x18
	s_load_dword s10, s[4:5], 0x20
	v_lshlrev_b32_e32 v2, 3, v1
	v_add_u32_e32 v28, vcc, v0, v2
	s_load_dwordx2 s[8:9], s[4:5], 0x0
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v3, v1, s2
	s_lshl_b32 s3, s6, 6
	v_lshlrev_b32_e32 v2, 3, v0
	v_add_u32_e32 v4, vcc, s3, v2
	v_add_u32_e32 v3, vcc, v4, v3
	v_ashrrev_i32_e32 v4, 31, v3
	v_lshlrev_b64 v[3:4], 2, v[3:4]
	s_load_dwordx2 s[12:13], s[4:5], 0x8
	s_load_dwordx2 s[0:1], s[4:5], 0x10
	s_lshl_b32 s4, s7, 6
	v_mov_b32_e32 v5, s9
	v_add_u32_e32 v3, vcc, s8, v3
	v_addc_u32_e32 v4, vcc, v5, v4, vcc
	v_add_u32_e32 v5, vcc, s4, v28
	v_mul_lo_i32 v5, v5, s10
	v_add_u32_e32 v6, vcc, 16, v3
	v_addc_u32_e32 v7, vcc, 0, v4, vcc
	s_waitcnt lgkmcnt(0)
	flat_load_dwordx4 v[69:72], v[3:4]
	flat_load_dwordx4 v[73:76], v[6:7]
	v_ashrrev_i32_e32 v6, 31, v5
	v_lshlrev_b64 v[3:4], 2, v[5:6]
	v_mov_b32_e32 v5, s13
	v_add_u32_e32 v67, vcc, s12, v3
	v_addc_u32_e32 v68, vcc, v5, v4, vcc
	v_add_u32_e32 v3, vcc, 16, v67
	v_addc_u32_e32 v4, vcc, 0, v68, vcc
	flat_load_dwordx4 v[79:82], v[67:68]
	flat_load_dwordx4 v[83:86], v[3:4]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	s_cmp_gt_i32 s10, 7
	s_cbranch_scc0 BB0_5
; BB#1:                                 ; %.lr.ph
	v_lshlrev_b32_e32 v3, 6, v1
	v_add_u32_e32 v77, vcc, v2, v3
	v_add_u32_e32 v3, vcc, 8, v1
	v_mul_lo_i32 v3, s2, v3
	s_ashr_i32 s5, s10, 31
	s_lshr_b32 s5, s5, 29
	s_add_i32 s10, s10, s5
	v_lshlrev_b32_e32 v19, 2, v1
	v_add_u32_e32 v1, vcc, s3, v3
	v_add_u32_e32 v78, vcc, v2, v1
	s_ashr_i32 s5, s10, 3
	v_lshlrev_b32_e32 v0, 2, v0
	s_mov_b32 s6, 8
	s_lshl_b32 s10, s2, 3
	s_mov_b32 s13, 0
	s_movk_i32 s11, 0x1000
	s_movk_i32 s12, 0x1008
	v_mov_b32_e32 v65, 0
	v_mov_b32_e32 v57, 0
	v_mov_b32_e32 v52, 0
	v_mov_b32_e32 v63, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v50, 0
	v_mov_b32_e32 v59, 0
	v_mov_b32_e32 v60, 0
	v_mov_b32_e32 v61, 0
	v_mov_b32_e32 v54, 0
	v_mov_b32_e32 v55, 0
	v_mov_b32_e32 v56, 0
	v_mov_b32_e32 v41, 0
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v49, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v32, 0
	v_mov_b32_e32 v47, 0
	v_mov_b32_e32 v43, 0
	v_mov_b32_e32 v44, 0
	v_mov_b32_e32 v45, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v38, 0
	v_mov_b32_e32 v39, 0
	v_mov_b32_e32 v35, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v31, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v66, 0
	v_mov_b32_e32 v29, 0
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
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v62, 0
	v_mov_b32_e32 v48, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v58, 0
	v_mov_b32_e32 v53, 0
	v_mov_b32_e32 v42, 0
	v_mov_b32_e32 v36, 0
	v_mov_b32_e32 v27, 0
	v_mov_b32_e32 v25, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v21, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v16, 0
BB0_2:                                  ; =>This Inner Loop Header: Depth=1
	v_add_u32_e32 v87, vcc, s13, v77
	v_lshlrev_b32_e32 v87, 2, v87
	v_add_u32_e32 v88, vcc, s11, v87
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(3)
	ds_write2_b32 v88, v69, v70 offset1:1
	v_add_u32_e32 v88, vcc, s12, v87
	ds_write2_b32 v88, v71, v72 offset1:1
	v_add_u32_e32 v88, vcc, 0x1010, v87
	v_add_u32_e32 v87, vcc, 0x1018, v87
	s_waitcnt vmcnt(1)
	ds_write2_b32 v88, v73, v74 offset1:1
	ds_write2_b32 v87, v75, v76 offset1:1
	v_add_u32_e32 v87, vcc, s13, v28
	v_lshlrev_b32_e32 v87, 2, v87
	ds_write2st64_b32 v87, v79, v80 offset1:1
	ds_write2st64_b32 v87, v81, v82 offset0:2 offset1:3
	s_waitcnt vmcnt(0)
	ds_write2st64_b32 v87, v83, v84 offset0:4 offset1:5
	ds_write2st64_b32 v87, v85, v86 offset0:6 offset1:7
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_cmp_eq_u32 s5, 1
	s_cbranch_scc1 BB0_4
; BB#3:                                 ;   in Loop: Header=BB0_2 Depth=1
	v_ashrrev_i32_e32 v79, 31, v78
	v_lshlrev_b64 v[69:70], 2, v[78:79]
	v_mov_b32_e32 v71, s9
	v_add_u32_e32 v69, vcc, s8, v69
	v_addc_u32_e32 v70, vcc, v71, v70, vcc
	v_add_u32_e32 v73, vcc, 16, v69
	s_ashr_i32 s7, s6, 31
	v_addc_u32_e32 v74, vcc, 0, v70, vcc
	s_lshl_b64 s[14:15], s[6:7], 2
	v_mov_b32_e32 v80, s15
	v_add_u32_e32 v79, vcc, s14, v67
	v_addc_u32_e32 v80, vcc, v68, v80, vcc
	v_add_u32_e32 v83, vcc, 16, v79
	v_addc_u32_e32 v84, vcc, 0, v80, vcc
	flat_load_dwordx4 v[69:72], v[69:70]
	flat_load_dwordx4 v[79:82], v[79:80]
	flat_load_dwordx4 v[73:76], v[73:74]
	flat_load_dwordx4 v[83:86], v[83:84]
BB0_4:                                  ;   in Loop: Header=BB0_2 Depth=1
	v_add_u32_e32 v87, vcc, s13, v0
	v_lshlrev_b32_e32 v88, 2, v87
	v_add_u32_e32 v87, vcc, s13, v19
	s_mov_b32 m0, -1
	v_lshlrev_b32_e32 v87, 2, v87
	v_add_u32_e32 v91, vcc, s11, v88
	v_add_u32_e32 v89, vcc, s12, v88
	v_add_u32_e32 v99, vcc, 0x1080, v88
	v_add_u32_e32 v97, vcc, 0x1088, v88
	v_add_u32_e32 v95, vcc, 0x1100, v88
	ds_read2_b32 v[89:90], v89 offset1:1
	ds_read2_b32 v[91:92], v91 offset1:1
	ds_read2_b32 v[93:94], v87 offset1:1
	ds_read2_b32 v[95:96], v95 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	s_add_i32 s7, s13, 0x200
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v64, v91, v93
	v_mac_f32_e32 v65, v92, v93
	v_mac_f32_e32 v57, v89, v93
	v_mac_f32_e32 v52, v90, v93
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v62, v99, v93
	v_mac_f32_e32 v63, v100, v93
	v_mac_f32_e32 v51, v97, v93
	v_mac_f32_e32 v50, v98, v93
	v_mac_f32_e32 v58, v91, v94
	v_mac_f32_e32 v59, v92, v94
	v_mac_f32_e32 v60, v89, v94
	v_mac_f32_e32 v61, v90, v94
	v_mac_f32_e32 v53, v99, v94
	v_mac_f32_e32 v54, v100, v94
	v_mac_f32_e32 v55, v97, v94
	v_mac_f32_e32 v56, v98, v94
	ds_read2_b32 v[93:94], v87 offset0:2 offset1:3
	ds_read2_b32 v[101:102], v87 offset0:32 offset1:33
	ds_read2_b32 v[103:104], v87 offset0:34 offset1:35
	s_ashr_i32 s13, s7, 31
	s_lshr_b32 s13, s13, 22
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v33, v99, v93
	v_mac_f32_e32 v46, v97, v93
	v_mac_f32_e32 v36, v99, v94
	v_mac_f32_e32 v38, v97, v94
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v34, v91, v101
	v_mac_f32_e32 v35, v92, v101
	v_mac_f32_e32 v26, v89, v101
	v_mac_f32_e32 v24, v90, v101
	v_mac_f32_e32 v30, v99, v101
	v_mac_f32_e32 v31, v100, v101
	v_mac_f32_e32 v22, v97, v101
	v_mac_f32_e32 v20, v98, v101
	v_mac_f32_e32 v25, v99, v102
	v_mac_f32_e32 v14, v97, v102
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v21, v99, v103
	v_mac_f32_e32 v16, v99, v104
	v_mac_f32_e32 v8, v97, v103
	v_mac_f32_e32 v2, v97, v104
	v_add_u32_e32 v101, vcc, 0x1108, v88
	v_add_u32_e32 v99, vcc, 0x1180, v88
	v_add_u32_e32 v97, vcc, 0x1188, v88
	v_mac_f32_e32 v41, v91, v93
	v_mac_f32_e32 v40, v92, v93
	v_mac_f32_e32 v48, v89, v93
	v_mac_f32_e32 v49, v90, v93
	v_mac_f32_e32 v32, v100, v93
	v_mac_f32_e32 v47, v98, v93
	v_mac_f32_e32 v42, v91, v94
	v_mac_f32_e32 v43, v92, v94
	v_mac_f32_e32 v44, v89, v94
	v_mac_f32_e32 v45, v90, v94
	v_mac_f32_e32 v37, v100, v94
	v_mac_f32_e32 v39, v98, v94
	v_mac_f32_e32 v27, v91, v102
	v_mac_f32_e32 v66, v92, v102
	v_mac_f32_e32 v29, v89, v102
	v_mac_f32_e32 v17, v90, v102
	v_mac_f32_e32 v15, v100, v102
	v_mac_f32_e32 v13, v98, v102
	v_mac_f32_e32 v23, v91, v103
	v_mac_f32_e32 v12, v92, v103
	v_mac_f32_e32 v18, v91, v104
	v_mac_f32_e32 v6, v92, v104
	v_mac_f32_e32 v11, v89, v103
	v_mac_f32_e32 v10, v90, v103
	v_mac_f32_e32 v5, v89, v104
	v_mac_f32_e32 v4, v90, v104
	ds_read2_b32 v[89:90], v87 offset0:64 offset1:65
	ds_read2_b32 v[91:92], v87 offset0:66 offset1:67
	v_mac_f32_e32 v9, v100, v103
	v_mac_f32_e32 v7, v98, v103
	v_mac_f32_e32 v3, v100, v104
	v_mac_f32_e32 v1, v98, v104
	ds_read2_b32 v[97:98], v97 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	ds_read2_b32 v[101:102], v101 offset1:1
	ds_read2_b32 v[93:94], v87 offset0:96 offset1:97
	s_waitcnt lgkmcnt(5)
	v_mac_f32_e32 v64, v95, v89
	v_mac_f32_e32 v65, v96, v89
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v62, v99, v89
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v57, v101, v89
	v_mac_f32_e32 v52, v102, v89
	v_mac_f32_e32 v63, v100, v89
	v_mac_f32_e32 v51, v97, v89
	v_mac_f32_e32 v50, v98, v89
	v_mac_f32_e32 v58, v95, v90
	v_mac_f32_e32 v59, v96, v90
	v_mac_f32_e32 v60, v101, v90
	v_mac_f32_e32 v61, v102, v90
	v_mac_f32_e32 v53, v99, v90
	v_mac_f32_e32 v54, v100, v90
	v_mac_f32_e32 v55, v97, v90
	v_mac_f32_e32 v56, v98, v90
	v_mac_f32_e32 v41, v95, v91
	v_mac_f32_e32 v40, v96, v91
	v_mac_f32_e32 v48, v101, v91
	v_mac_f32_e32 v49, v102, v91
	v_mac_f32_e32 v33, v99, v91
	v_mac_f32_e32 v32, v100, v91
	v_mac_f32_e32 v46, v97, v91
	v_mac_f32_e32 v47, v98, v91
	v_mac_f32_e32 v42, v95, v92
	v_mac_f32_e32 v43, v96, v92
	v_mac_f32_e32 v44, v101, v92
	v_mac_f32_e32 v45, v102, v92
	v_mac_f32_e32 v36, v99, v92
	v_mac_f32_e32 v37, v100, v92
	v_mac_f32_e32 v38, v97, v92
	v_mac_f32_e32 v39, v98, v92
	ds_read2_b32 v[89:90], v87 offset0:98 offset1:99
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v34, v95, v93
	v_mac_f32_e32 v35, v96, v93
	v_mac_f32_e32 v26, v101, v93
	v_mac_f32_e32 v24, v102, v93
	v_mac_f32_e32 v30, v99, v93
	v_mac_f32_e32 v31, v100, v93
	v_mac_f32_e32 v22, v97, v93
	v_mac_f32_e32 v20, v98, v93
	v_mac_f32_e32 v27, v95, v94
	v_mac_f32_e32 v66, v96, v94
	v_mac_f32_e32 v29, v101, v94
	v_mac_f32_e32 v17, v102, v94
	v_mac_f32_e32 v25, v99, v94
	v_mac_f32_e32 v15, v100, v94
	v_mac_f32_e32 v14, v97, v94
	v_mac_f32_e32 v13, v98, v94
	ds_read2_b32 v[91:92], v87 offset0:128 offset1:129
	ds_read2_b32 v[93:94], v87 offset0:130 offset1:131
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v23, v95, v89
	v_mac_f32_e32 v18, v95, v90
	v_mac_f32_e32 v12, v96, v89
	v_mac_f32_e32 v11, v101, v89
	v_mac_f32_e32 v5, v101, v90
	v_mac_f32_e32 v10, v102, v89
	v_mac_f32_e32 v21, v99, v89
	v_mac_f32_e32 v16, v99, v90
	v_mac_f32_e32 v9, v100, v89
	v_mac_f32_e32 v8, v97, v89
	v_mac_f32_e32 v7, v98, v89
	v_mac_f32_e32 v2, v97, v90
	v_add_u32_e32 v97, vcc, 0x1200, v88
	v_add_u32_e32 v95, vcc, 0x1208, v88
	v_add_u32_e32 v89, vcc, 0x1280, v88
	v_add_u32_e32 v103, vcc, 0x1288, v88
	v_add_u32_e32 v101, vcc, 0x1300, v88
	v_add_u32_e32 v99, vcc, 0x1308, v88
	v_mac_f32_e32 v6, v96, v90
	v_mac_f32_e32 v4, v102, v90
	v_mac_f32_e32 v3, v100, v90
	v_mac_f32_e32 v1, v98, v90
	ds_read2_b32 v[89:90], v89 offset1:1
	ds_read2_b32 v[95:96], v95 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	ds_read2_b32 v[101:102], v101 offset1:1
	ds_read2_b32 v[103:104], v103 offset1:1
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v57, v95, v91
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v64, v97, v91
	v_mac_f32_e32 v65, v98, v91
	v_mac_f32_e32 v52, v96, v91
	v_mac_f32_e32 v62, v89, v91
	v_mac_f32_e32 v63, v90, v91
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v51, v103, v91
	v_mac_f32_e32 v50, v104, v91
	v_mac_f32_e32 v58, v97, v92
	v_mac_f32_e32 v59, v98, v92
	v_mac_f32_e32 v60, v95, v92
	v_mac_f32_e32 v61, v96, v92
	v_mac_f32_e32 v53, v89, v92
	v_mac_f32_e32 v54, v90, v92
	v_mac_f32_e32 v55, v103, v92
	v_mac_f32_e32 v56, v104, v92
	v_mac_f32_e32 v41, v97, v93
	v_mac_f32_e32 v40, v98, v93
	v_mac_f32_e32 v48, v95, v93
	v_mac_f32_e32 v49, v96, v93
	v_mac_f32_e32 v33, v89, v93
	v_mac_f32_e32 v32, v90, v93
	v_mac_f32_e32 v46, v103, v93
	v_mac_f32_e32 v47, v104, v93
	v_mac_f32_e32 v42, v97, v94
	v_mac_f32_e32 v43, v98, v94
	v_mac_f32_e32 v44, v95, v94
	v_mac_f32_e32 v45, v96, v94
	v_mac_f32_e32 v36, v89, v94
	v_mac_f32_e32 v37, v90, v94
	v_mac_f32_e32 v38, v103, v94
	v_mac_f32_e32 v39, v104, v94
	ds_read2_b32 v[91:92], v87 offset0:160 offset1:161
	ds_read2_b32 v[93:94], v87 offset0:162 offset1:163
	ds_read2_b32 v[105:106], v87 offset0:192 offset1:193
	s_add_i32 s13, s7, s13
	s_and_b32 s13, s13, 0xfffffc00
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v34, v97, v91
	v_mac_f32_e32 v35, v98, v91
	v_mac_f32_e32 v26, v95, v91
	v_mac_f32_e32 v24, v96, v91
	v_mac_f32_e32 v30, v89, v91
	v_mac_f32_e32 v31, v90, v91
	v_mac_f32_e32 v22, v103, v91
	v_mac_f32_e32 v20, v104, v91
	v_mac_f32_e32 v25, v89, v92
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v23, v97, v93
	v_mac_f32_e32 v12, v98, v93
	v_mac_f32_e32 v11, v95, v93
	v_mac_f32_e32 v10, v96, v93
	v_mac_f32_e32 v21, v89, v93
	v_mac_f32_e32 v16, v89, v94
	v_mac_f32_e32 v9, v90, v93
	v_mac_f32_e32 v8, v103, v93
	v_mac_f32_e32 v7, v104, v93
	v_add_u32_e32 v93, vcc, 0x1380, v88
	v_add_u32_e32 v91, vcc, 0x1388, v88
	v_add_u32_e32 v89, vcc, 0x1400, v88
	v_mac_f32_e32 v27, v97, v92
	v_mac_f32_e32 v66, v98, v92
	v_mac_f32_e32 v29, v95, v92
	v_mac_f32_e32 v17, v96, v92
	v_mac_f32_e32 v15, v90, v92
	v_mac_f32_e32 v14, v103, v92
	v_mac_f32_e32 v13, v104, v92
	v_mac_f32_e32 v3, v90, v94
	v_mac_f32_e32 v18, v97, v94
	v_mac_f32_e32 v6, v98, v94
	v_mac_f32_e32 v5, v95, v94
	v_mac_f32_e32 v4, v96, v94
	v_mac_f32_e32 v2, v103, v94
	v_mac_f32_e32 v1, v104, v94
	ds_read2_b32 v[89:90], v89 offset1:1
	ds_read2_b32 v[91:92], v91 offset1:1
	ds_read2_b32 v[93:94], v93 offset1:1
	ds_read2_b32 v[95:96], v87 offset0:194 offset1:195
	ds_read2_b32 v[97:98], v87 offset0:224 offset1:225
	ds_read2_b32 v[103:104], v87 offset0:226 offset1:227
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v51, v91, v105
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v62, v93, v105
	v_mac_f32_e32 v53, v93, v106
	v_mac_f32_e32 v55, v91, v106
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v41, v101, v95
	v_mac_f32_e32 v40, v102, v95
	v_mac_f32_e32 v48, v99, v95
	v_mac_f32_e32 v49, v100, v95
	v_mac_f32_e32 v33, v93, v95
	v_mac_f32_e32 v32, v94, v95
	v_mac_f32_e32 v46, v91, v95
	v_mac_f32_e32 v47, v92, v95
	v_mac_f32_e32 v36, v93, v96
	v_mac_f32_e32 v38, v91, v96
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v34, v101, v97
	v_mac_f32_e32 v35, v102, v97
	v_mac_f32_e32 v26, v99, v97
	v_mac_f32_e32 v24, v100, v97
	v_mac_f32_e32 v30, v93, v97
	v_mac_f32_e32 v31, v94, v97
	v_mac_f32_e32 v22, v91, v97
	v_mac_f32_e32 v20, v92, v97
	v_mac_f32_e32 v25, v93, v98
	v_mac_f32_e32 v14, v91, v98
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v21, v93, v103
	v_mac_f32_e32 v16, v93, v104
	v_mac_f32_e32 v8, v91, v103
	v_mac_f32_e32 v2, v91, v104
	v_add_u32_e32 v91, vcc, 0x400, v87
	v_add_u32_e32 v97, vcc, 0x1408, v88
	v_add_u32_e32 v95, vcc, 0x1480, v88
	v_add_u32_e32 v93, vcc, 0x1488, v88
	v_mac_f32_e32 v63, v94, v105
	v_mac_f32_e32 v50, v92, v105
	v_mac_f32_e32 v54, v94, v106
	v_mac_f32_e32 v56, v92, v106
	v_mac_f32_e32 v42, v101, v96
	v_mac_f32_e32 v43, v102, v96
	v_mac_f32_e32 v44, v99, v96
	v_mac_f32_e32 v45, v100, v96
	v_mac_f32_e32 v37, v94, v96
	v_mac_f32_e32 v39, v92, v96
	v_mac_f32_e32 v27, v101, v98
	v_mac_f32_e32 v66, v102, v98
	v_mac_f32_e32 v29, v99, v98
	v_mac_f32_e32 v17, v100, v98
	v_mac_f32_e32 v15, v94, v98
	v_mac_f32_e32 v13, v92, v98
	v_mac_f32_e32 v9, v94, v103
	v_mac_f32_e32 v3, v94, v104
	ds_read2_b32 v[93:94], v93 offset1:1
	ds_read2_b32 v[95:96], v95 offset1:1
	v_mac_f32_e32 v7, v92, v103
	v_mac_f32_e32 v1, v92, v104
	ds_read2_b32 v[91:92], v91 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	v_mac_f32_e32 v64, v101, v105
	v_mac_f32_e32 v65, v102, v105
	v_mac_f32_e32 v57, v99, v105
	v_mac_f32_e32 v52, v100, v105
	v_mac_f32_e32 v58, v101, v106
	v_mac_f32_e32 v59, v102, v106
	v_mac_f32_e32 v60, v99, v106
	v_mac_f32_e32 v61, v100, v106
	v_mac_f32_e32 v23, v101, v103
	v_mac_f32_e32 v18, v101, v104
	v_mac_f32_e32 v11, v99, v103
	v_mac_f32_e32 v5, v99, v104
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v64, v89, v91
	v_mac_f32_e32 v65, v90, v91
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v57, v97, v91
	v_mac_f32_e32 v52, v98, v91
	v_mac_f32_e32 v62, v95, v91
	v_mac_f32_e32 v63, v96, v91
	v_mac_f32_e32 v51, v93, v91
	v_mac_f32_e32 v50, v94, v91
	v_add_u32_e32 v101, vcc, 0x408, v87
	v_add_u32_e32 v99, vcc, 0x480, v87
	v_add_u32_e32 v91, vcc, 0x488, v87
	v_mac_f32_e32 v12, v102, v103
	v_mac_f32_e32 v10, v100, v103
	v_mac_f32_e32 v6, v102, v104
	v_mac_f32_e32 v4, v100, v104
	v_mac_f32_e32 v58, v89, v92
	v_mac_f32_e32 v59, v90, v92
	v_mac_f32_e32 v60, v97, v92
	v_mac_f32_e32 v61, v98, v92
	v_mac_f32_e32 v53, v95, v92
	v_mac_f32_e32 v54, v96, v92
	v_mac_f32_e32 v55, v93, v92
	v_mac_f32_e32 v56, v94, v92
	ds_read2_b32 v[91:92], v91 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	ds_read2_b32 v[101:102], v101 offset1:1
	v_add_u32_e32 v105, vcc, 0x1588, v88
	v_add_u32_e32 v103, vcc, 0x1600, v88
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v23, v89, v91
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v34, v89, v99
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v41, v89, v101
	v_mac_f32_e32 v40, v90, v101
	v_mac_f32_e32 v48, v97, v101
	v_mac_f32_e32 v49, v98, v101
	v_mac_f32_e32 v33, v95, v101
	v_mac_f32_e32 v32, v96, v101
	v_mac_f32_e32 v46, v93, v101
	v_mac_f32_e32 v47, v94, v101
	v_mac_f32_e32 v42, v89, v102
	v_mac_f32_e32 v44, v97, v102
	v_mac_f32_e32 v36, v95, v102
	v_mac_f32_e32 v38, v93, v102
	v_mac_f32_e32 v35, v90, v99
	v_mac_f32_e32 v26, v97, v99
	v_mac_f32_e32 v24, v98, v99
	v_mac_f32_e32 v30, v95, v99
	v_mac_f32_e32 v31, v96, v99
	v_mac_f32_e32 v22, v93, v99
	v_mac_f32_e32 v20, v94, v99
	v_mac_f32_e32 v27, v89, v100
	v_mac_f32_e32 v18, v89, v92
	v_mac_f32_e32 v29, v97, v100
	v_mac_f32_e32 v25, v95, v100
	v_mac_f32_e32 v14, v93, v100
	v_mac_f32_e32 v12, v90, v91
	v_mac_f32_e32 v11, v97, v91
	v_mac_f32_e32 v5, v97, v92
	v_mac_f32_e32 v10, v98, v91
	v_mac_f32_e32 v21, v95, v91
	v_mac_f32_e32 v16, v95, v92
	v_mac_f32_e32 v9, v96, v91
	v_mac_f32_e32 v8, v93, v91
	v_mac_f32_e32 v7, v94, v91
	v_mac_f32_e32 v2, v93, v92
	v_add_u32_e32 v93, vcc, 0x1500, v88
	v_add_u32_e32 v91, vcc, 0x1508, v88
	v_add_u32_e32 v89, vcc, 0x1580, v88
	v_add_u32_e32 v99, vcc, 0x500, v87
	v_add_u32_e32 v97, vcc, 0x508, v87
	v_add_u32_e32 v95, vcc, 0x580, v87
	v_add_u32_e32 v101, vcc, 0x1608, v88
	v_mac_f32_e32 v43, v90, v102
	v_mac_f32_e32 v45, v98, v102
	v_mac_f32_e32 v37, v96, v102
	v_mac_f32_e32 v39, v94, v102
	ds_read2_b32 v[101:102], v101 offset1:1
	ds_read2_b32 v[103:104], v103 offset1:1
	v_mac_f32_e32 v66, v90, v100
	v_mac_f32_e32 v17, v98, v100
	v_mac_f32_e32 v15, v96, v100
	v_mac_f32_e32 v13, v94, v100
	v_mac_f32_e32 v6, v90, v92
	v_mac_f32_e32 v4, v98, v92
	v_mac_f32_e32 v3, v96, v92
	v_mac_f32_e32 v1, v94, v92
	ds_read2_b32 v[89:90], v89 offset1:1
	ds_read2_b32 v[91:92], v91 offset1:1
	ds_read2_b32 v[95:96], v95 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	ds_read2_b32 v[93:94], v93 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	ds_read2_b32 v[105:106], v105 offset1:1
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v26, v91, v95
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v48, v91, v97
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v41, v93, v97
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v64, v93, v99
	v_mac_f32_e32 v65, v94, v99
	v_mac_f32_e32 v57, v91, v99
	v_mac_f32_e32 v52, v92, v99
	v_mac_f32_e32 v62, v89, v99
	v_mac_f32_e32 v63, v90, v99
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v51, v105, v99
	v_mac_f32_e32 v50, v106, v99
	v_mac_f32_e32 v40, v94, v97
	v_mac_f32_e32 v49, v92, v97
	v_mac_f32_e32 v33, v89, v97
	v_mac_f32_e32 v32, v90, v97
	v_mac_f32_e32 v46, v105, v97
	v_mac_f32_e32 v47, v106, v97
	v_mac_f32_e32 v34, v93, v95
	v_mac_f32_e32 v35, v94, v95
	v_mac_f32_e32 v24, v92, v95
	v_mac_f32_e32 v30, v89, v95
	v_mac_f32_e32 v31, v90, v95
	v_mac_f32_e32 v22, v105, v95
	v_mac_f32_e32 v20, v106, v95
	v_add_u32_e32 v99, vcc, 0x588, v87
	v_add_u32_e32 v97, vcc, 0x600, v87
	v_add_u32_e32 v95, vcc, 0x608, v87
	v_mac_f32_e32 v58, v93, v100
	v_mac_f32_e32 v59, v94, v100
	v_mac_f32_e32 v60, v91, v100
	v_mac_f32_e32 v61, v92, v100
	v_mac_f32_e32 v53, v89, v100
	v_mac_f32_e32 v54, v90, v100
	v_mac_f32_e32 v55, v105, v100
	v_mac_f32_e32 v56, v106, v100
	v_mac_f32_e32 v42, v93, v98
	v_mac_f32_e32 v43, v94, v98
	v_mac_f32_e32 v44, v91, v98
	v_mac_f32_e32 v45, v92, v98
	v_mac_f32_e32 v36, v89, v98
	v_mac_f32_e32 v37, v90, v98
	v_mac_f32_e32 v38, v105, v98
	v_mac_f32_e32 v39, v106, v98
	v_mac_f32_e32 v27, v93, v96
	v_mac_f32_e32 v66, v94, v96
	v_mac_f32_e32 v29, v91, v96
	v_mac_f32_e32 v17, v92, v96
	v_mac_f32_e32 v25, v89, v96
	v_mac_f32_e32 v15, v90, v96
	v_mac_f32_e32 v14, v105, v96
	v_mac_f32_e32 v13, v106, v96
	ds_read2_b32 v[95:96], v95 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	s_sub_i32 s13, s7, s13
	s_add_i32 s5, s5, -1
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v41, v103, v95
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v64, v103, v97
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v23, v93, v99
	v_mac_f32_e32 v18, v93, v100
	v_mac_f32_e32 v11, v91, v99
	v_mac_f32_e32 v5, v91, v100
	v_mac_f32_e32 v21, v89, v99
	v_mac_f32_e32 v16, v89, v100
	v_add_u32_e32 v93, vcc, 0x1680, v88
	v_add_u32_e32 v91, vcc, 0x1688, v88
	v_add_u32_e32 v89, vcc, 0x1700, v88
	v_mac_f32_e32 v12, v94, v99
	v_mac_f32_e32 v6, v94, v100
	v_mac_f32_e32 v10, v92, v99
	v_mac_f32_e32 v4, v92, v100
	v_mac_f32_e32 v9, v90, v99
	v_mac_f32_e32 v3, v90, v100
	ds_read2_b32 v[89:90], v89 offset1:1
	ds_read2_b32 v[91:92], v91 offset1:1
	ds_read2_b32 v[93:94], v93 offset1:1
	v_mac_f32_e32 v8, v105, v99
	v_mac_f32_e32 v7, v106, v99
	v_mac_f32_e32 v65, v104, v97
	v_mac_f32_e32 v57, v101, v97
	v_mac_f32_e32 v52, v102, v97
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v62, v93, v97
	v_mac_f32_e32 v63, v94, v97
	v_mac_f32_e32 v51, v91, v97
	v_mac_f32_e32 v50, v92, v97
	v_mac_f32_e32 v40, v104, v95
	v_mac_f32_e32 v48, v101, v95
	v_mac_f32_e32 v49, v102, v95
	v_mac_f32_e32 v33, v93, v95
	v_mac_f32_e32 v32, v94, v95
	v_mac_f32_e32 v46, v91, v95
	v_mac_f32_e32 v47, v92, v95
	v_add_u32_e32 v99, vcc, 0x680, v87
	v_add_u32_e32 v97, vcc, 0x688, v87
	v_add_u32_e32 v95, vcc, 0x700, v87
	v_mac_f32_e32 v2, v105, v100
	v_mac_f32_e32 v1, v106, v100
	v_mac_f32_e32 v58, v103, v98
	v_mac_f32_e32 v59, v104, v98
	v_mac_f32_e32 v60, v101, v98
	v_mac_f32_e32 v61, v102, v98
	v_mac_f32_e32 v53, v93, v98
	v_mac_f32_e32 v54, v94, v98
	v_mac_f32_e32 v55, v91, v98
	v_mac_f32_e32 v56, v92, v98
	v_mac_f32_e32 v42, v103, v96
	v_mac_f32_e32 v43, v104, v96
	v_mac_f32_e32 v44, v101, v96
	v_mac_f32_e32 v45, v102, v96
	v_mac_f32_e32 v36, v93, v96
	v_mac_f32_e32 v37, v94, v96
	v_mac_f32_e32 v38, v91, v96
	v_mac_f32_e32 v39, v92, v96
	ds_read2_b32 v[95:96], v95 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	s_add_i32 s6, s6, 8
	s_cmp_eq_u32 s5, 0
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v64, v89, v95
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v23, v103, v97
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v30, v93, v99
	v_mac_f32_e32 v25, v93, v100
	v_mac_f32_e32 v12, v104, v97
	v_mac_f32_e32 v11, v101, v97
	v_mac_f32_e32 v10, v102, v97
	v_mac_f32_e32 v21, v93, v97
	v_mac_f32_e32 v16, v93, v98
	v_mac_f32_e32 v9, v94, v97
	v_mac_f32_e32 v8, v91, v97
	v_mac_f32_e32 v7, v92, v97
	v_add_u32_e32 v97, vcc, 0x1708, v88
	v_add_u32_e32 v93, vcc, 0x1780, v88
	v_add_u32_e32 v88, vcc, 0x1788, v88
	v_mac_f32_e32 v31, v94, v99
	v_mac_f32_e32 v22, v91, v99
	v_mac_f32_e32 v20, v92, v99
	v_mac_f32_e32 v15, v94, v100
	v_mac_f32_e32 v14, v91, v100
	v_mac_f32_e32 v13, v92, v100
	v_mac_f32_e32 v18, v103, v98
	v_mac_f32_e32 v6, v104, v98
	v_mac_f32_e32 v5, v101, v98
	v_mac_f32_e32 v4, v102, v98
	v_mac_f32_e32 v3, v94, v98
	v_mac_f32_e32 v2, v91, v98
	v_mac_f32_e32 v1, v92, v98
	ds_read2_b32 v[91:92], v88 offset1:1
	ds_read2_b32 v[93:94], v93 offset1:1
	ds_read2_b32 v[97:98], v97 offset1:1
	v_mac_f32_e32 v34, v103, v99
	v_mac_f32_e32 v35, v104, v99
	v_mac_f32_e32 v26, v101, v99
	v_mac_f32_e32 v24, v102, v99
	v_mac_f32_e32 v65, v90, v95
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v57, v97, v95
	v_mac_f32_e32 v52, v98, v95
	v_mac_f32_e32 v62, v93, v95
	v_mac_f32_e32 v63, v94, v95
	v_mac_f32_e32 v51, v91, v95
	v_mac_f32_e32 v50, v92, v95
	v_add_u32_e32 v99, vcc, 0x708, v87
	v_add_u32_e32 v95, vcc, 0x780, v87
	v_add_u32_e32 v87, vcc, 0x788, v87
	v_mac_f32_e32 v27, v103, v100
	v_mac_f32_e32 v66, v104, v100
	v_mac_f32_e32 v29, v101, v100
	v_mac_f32_e32 v17, v102, v100
	v_mac_f32_e32 v58, v89, v96
	v_mac_f32_e32 v59, v90, v96
	v_mac_f32_e32 v60, v97, v96
	v_mac_f32_e32 v61, v98, v96
	v_mac_f32_e32 v53, v93, v96
	v_mac_f32_e32 v54, v94, v96
	v_mac_f32_e32 v55, v91, v96
	v_mac_f32_e32 v56, v92, v96
	ds_read2_b32 v[87:88], v87 offset1:1
	ds_read2_b32 v[95:96], v95 offset1:1
	ds_read2_b32 v[99:100], v99 offset1:1
	v_add_u32_e32 v78, vcc, s10, v78
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v23, v89, v87
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v34, v89, v95
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v41, v89, v99
	v_mac_f32_e32 v40, v90, v99
	v_mac_f32_e32 v48, v97, v99
	v_mac_f32_e32 v49, v98, v99
	v_mac_f32_e32 v33, v93, v99
	v_mac_f32_e32 v32, v94, v99
	v_mac_f32_e32 v46, v91, v99
	v_mac_f32_e32 v47, v92, v99
	v_mac_f32_e32 v42, v89, v100
	v_mac_f32_e32 v43, v90, v100
	v_mac_f32_e32 v44, v97, v100
	v_mac_f32_e32 v45, v98, v100
	v_mac_f32_e32 v36, v93, v100
	v_mac_f32_e32 v37, v94, v100
	v_mac_f32_e32 v38, v91, v100
	v_mac_f32_e32 v39, v92, v100
	v_mac_f32_e32 v35, v90, v95
	v_mac_f32_e32 v26, v97, v95
	v_mac_f32_e32 v24, v98, v95
	v_mac_f32_e32 v30, v93, v95
	v_mac_f32_e32 v31, v94, v95
	v_mac_f32_e32 v22, v91, v95
	v_mac_f32_e32 v20, v92, v95
	v_mac_f32_e32 v27, v89, v96
	v_mac_f32_e32 v66, v90, v96
	v_mac_f32_e32 v29, v97, v96
	v_mac_f32_e32 v17, v98, v96
	v_mac_f32_e32 v25, v93, v96
	v_mac_f32_e32 v15, v94, v96
	v_mac_f32_e32 v14, v91, v96
	v_mac_f32_e32 v13, v92, v96
	v_mac_f32_e32 v12, v90, v87
	v_mac_f32_e32 v18, v89, v88
	v_mac_f32_e32 v6, v90, v88
	v_mac_f32_e32 v11, v97, v87
	v_mac_f32_e32 v10, v98, v87
	v_mac_f32_e32 v5, v97, v88
	v_mac_f32_e32 v4, v98, v88
	v_mac_f32_e32 v21, v93, v87
	v_mac_f32_e32 v9, v94, v87
	v_mac_f32_e32 v16, v93, v88
	v_mac_f32_e32 v3, v94, v88
	v_mac_f32_e32 v8, v91, v87
	v_mac_f32_e32 v7, v92, v87
	v_mac_f32_e32 v2, v91, v88
	v_mac_f32_e32 v1, v92, v88
	s_cbranch_scc0 BB0_2
	s_branch BB0_6
BB0_5:                                  ; %.._crit_edge_crit_edge
	v_lshlrev_b32_e32 v19, 2, v1
	v_lshlrev_b32_e32 v0, 2, v0
	v_mov_b32_e32 v1, 0
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
	v_mov_b32_e32 v29, 0
	v_mov_b32_e32 v66, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v31, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v35, 0
	v_mov_b32_e32 v39, 0
	v_mov_b32_e32 v38, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v45, 0
	v_mov_b32_e32 v44, 0
	v_mov_b32_e32 v43, 0
	v_mov_b32_e32 v47, 0
	v_mov_b32_e32 v32, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v49, 0
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v41, 0
	v_mov_b32_e32 v56, 0
	v_mov_b32_e32 v55, 0
	v_mov_b32_e32 v54, 0
	v_mov_b32_e32 v61, 0
	v_mov_b32_e32 v60, 0
	v_mov_b32_e32 v59, 0
	v_mov_b32_e32 v50, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v63, 0
	v_mov_b32_e32 v52, 0
	v_mov_b32_e32 v57, 0
	v_mov_b32_e32 v65, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v48, 0
	v_mov_b32_e32 v62, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v21, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v25, 0
	v_mov_b32_e32 v27, 0
	v_mov_b32_e32 v36, 0
	v_mov_b32_e32 v42, 0
	v_mov_b32_e32 v53, 0
	v_mov_b32_e32 v58, 0
BB0_6:                                  ; %._crit_edge
	v_mov_b32_e32 v28, v66
	v_add_u32_e32 v66, vcc, s4, v19
	v_mul_lo_i32 v66, v66, s2
	s_waitcnt vmcnt(3)
	v_mov_b32_e32 v70, s1
	s_or_b32 s4, s4, 32
	v_add_u32_e32 v69, vcc, s3, v66
	v_add_u32_e32 v66, vcc, v69, v0
	v_ashrrev_i32_e32 v67, 31, v66
	v_lshlrev_b64 v[67:68], 2, v[66:67]
	v_add_u32_e32 v67, vcc, s0, v67
	v_addc_u32_e32 v68, vcc, v70, v68, vcc
	flat_store_dwordx2 v[67:68], v[64:65]
	v_or_b32_e32 v64, 2, v66
	v_ashrrev_i32_e32 v65, 31, v64
	v_lshlrev_b64 v[64:65], 2, v[64:65]
	v_mov_b32_e32 v67, s1
	v_add_u32_e32 v64, vcc, s0, v64
	v_addc_u32_e32 v65, vcc, v67, v65, vcc
	flat_store_dword v[64:65], v57
	v_or_b32_e32 v64, 3, v66
	v_ashrrev_i32_e32 v65, 31, v64
	v_lshlrev_b64 v[64:65], 2, v[64:65]
	v_mov_b32_e32 v57, s1
	v_add_u32_e32 v64, vcc, s0, v64
	v_addc_u32_e32 v65, vcc, v57, v65, vcc
	v_add_u32_e32 v57, vcc, 32, v0
	flat_store_dword v[64:65], v52
	v_add_u32_e32 v64, vcc, v69, v57
	v_ashrrev_i32_e32 v65, 31, v64
	v_lshlrev_b64 v[65:66], 2, v[64:65]
	v_mov_b32_e32 v52, s1
	v_add_u32_e32 v65, vcc, s0, v65
	v_addc_u32_e32 v66, vcc, v52, v66, vcc
	flat_store_dwordx2 v[65:66], v[62:63]
	v_or_b32_e32 v62, 2, v64
	v_ashrrev_i32_e32 v63, 31, v62
	v_lshlrev_b64 v[62:63], 2, v[62:63]
	v_add_u32_e32 v62, vcc, s0, v62
	v_addc_u32_e32 v63, vcc, v52, v63, vcc
	flat_store_dword v[62:63], v51
	v_or_b32_e32 v51, 3, v64
	v_ashrrev_i32_e32 v52, 31, v51
	v_lshlrev_b64 v[51:52], 2, v[51:52]
	v_mov_b32_e32 v62, s1
	v_add_u32_e32 v51, vcc, s0, v51
	v_addc_u32_e32 v52, vcc, v62, v52, vcc
	flat_store_dword v[51:52], v50
	v_add_u32_e32 v52, vcc, s2, v69
	v_add_u32_e32 v50, vcc, v52, v0
	v_ashrrev_i32_e32 v51, 31, v50
	v_lshlrev_b64 v[50:51], 2, v[50:51]
	v_add_u32_e32 v50, vcc, s0, v50
	v_addc_u32_e32 v51, vcc, v62, v51, vcc
	flat_store_dwordx4 v[50:51], v[58:61]
	v_add_u32_e32 v50, vcc, v52, v57
	v_ashrrev_i32_e32 v51, 31, v50
	v_lshlrev_b64 v[50:51], 2, v[50:51]
	v_mov_b32_e32 v58, s1
	v_add_u32_e32 v50, vcc, s0, v50
	v_addc_u32_e32 v51, vcc, v58, v51, vcc
	flat_store_dwordx4 v[50:51], v[53:56]
	s_nop 0
	v_add_u32_e32 v55, vcc, s2, v52
	v_add_u32_e32 v50, vcc, v55, v0
	v_ashrrev_i32_e32 v51, 31, v50
	v_lshlrev_b64 v[51:52], 2, v[50:51]
	v_mov_b32_e32 v53, s1
	v_add_u32_e32 v51, vcc, s0, v51
	v_addc_u32_e32 v52, vcc, v53, v52, vcc
	v_or_b32_e32 v53, 1, v50
	v_ashrrev_i32_e32 v54, 31, v53
	v_lshlrev_b64 v[53:54], 2, v[53:54]
	v_mov_b32_e32 v50, s1
	v_add_u32_e32 v53, vcc, s0, v53
	v_addc_u32_e32 v54, vcc, v50, v54, vcc
	flat_store_dword v[51:52], v41
	flat_store_dword v[53:54], v40
	v_add_u32_e32 v40, vcc, 8, v51
	v_addc_u32_e32 v41, vcc, 0, v52, vcc
	flat_store_dwordx2 v[40:41], v[48:49]
	v_add_u32_e32 v40, vcc, v55, v57
	v_ashrrev_i32_e32 v41, 31, v40
	v_lshlrev_b64 v[48:49], 2, v[40:41]
	v_or_b32_e32 v40, 1, v40
	v_ashrrev_i32_e32 v41, 31, v40
	v_add_u32_e32 v48, vcc, s0, v48
	v_addc_u32_e32 v49, vcc, v50, v49, vcc
	v_lshlrev_b64 v[40:41], 2, v[40:41]
	v_add_u32_e32 v40, vcc, s0, v40
	v_addc_u32_e32 v41, vcc, v50, v41, vcc
	flat_store_dword v[48:49], v33
	flat_store_dword v[40:41], v32
	v_add_u32_e32 v32, vcc, 8, v48
	v_addc_u32_e32 v33, vcc, 0, v49, vcc
	v_add_u32_e32 v40, vcc, s2, v55
	flat_store_dwordx2 v[32:33], v[46:47]
	v_add_u32_e32 v32, vcc, v40, v0
	v_ashrrev_i32_e32 v33, 31, v32
	v_lshlrev_b64 v[32:33], 2, v[32:33]
	v_mov_b32_e32 v41, s1
	v_add_u32_e32 v32, vcc, s0, v32
	v_addc_u32_e32 v33, vcc, v41, v33, vcc
	v_add_u32_e32 v19, vcc, s4, v19
	flat_store_dwordx4 v[32:33], v[42:45]
	v_add_u32_e32 v32, vcc, v40, v57
	v_mul_lo_i32 v19, v19, s2
	v_ashrrev_i32_e32 v33, 31, v32
	v_lshlrev_b64 v[32:33], 2, v[32:33]
	v_mov_b32_e32 v40, s1
	v_add_u32_e32 v32, vcc, s0, v32
	v_addc_u32_e32 v33, vcc, v40, v33, vcc
	v_add_u32_e32 v19, vcc, s3, v19
	flat_store_dwordx4 v[32:33], v[36:39]
	v_add_u32_e32 v32, vcc, v19, v0
	v_ashrrev_i32_e32 v33, 31, v32
	v_lshlrev_b64 v[36:37], 2, v[32:33]
	v_mov_b32_e32 v38, s1
	v_add_u32_e32 v36, vcc, s0, v36
	v_addc_u32_e32 v37, vcc, v38, v37, vcc
	v_or_b32_e32 v33, 2, v32
	flat_store_dwordx2 v[36:37], v[34:35]
	v_ashrrev_i32_e32 v34, 31, v33
	v_lshlrev_b64 v[33:34], 2, v[33:34]
	v_mov_b32_e32 v35, s1
	v_add_u32_e32 v33, vcc, s0, v33
	v_addc_u32_e32 v34, vcc, v35, v34, vcc
	v_or_b32_e32 v32, 3, v32
	flat_store_dword v[33:34], v26
	v_ashrrev_i32_e32 v33, 31, v32
	v_lshlrev_b64 v[32:33], 2, v[32:33]
	v_mov_b32_e32 v26, s1
	v_add_u32_e32 v32, vcc, s0, v32
	v_addc_u32_e32 v33, vcc, v26, v33, vcc
	flat_store_dword v[32:33], v24
	v_add_u32_e32 v32, vcc, v19, v57
	v_ashrrev_i32_e32 v33, 31, v32
	v_lshlrev_b64 v[33:34], 2, v[32:33]
	v_mov_b32_e32 v24, s1
	v_add_u32_e32 v33, vcc, s0, v33
	v_addc_u32_e32 v34, vcc, v24, v34, vcc
	flat_store_dwordx2 v[33:34], v[30:31]
	v_or_b32_e32 v30, 2, v32
	v_ashrrev_i32_e32 v31, 31, v30
	v_lshlrev_b64 v[30:31], 2, v[30:31]
	v_add_u32_e32 v30, vcc, s0, v30
	v_addc_u32_e32 v31, vcc, v24, v31, vcc
	flat_store_dword v[30:31], v22
	v_or_b32_e32 v30, 3, v32
	v_ashrrev_i32_e32 v31, 31, v30
	v_lshlrev_b64 v[30:31], 2, v[30:31]
	v_mov_b32_e32 v22, s1
	v_add_u32_e32 v30, vcc, s0, v30
	v_addc_u32_e32 v31, vcc, v22, v31, vcc
	v_add_u32_e32 v22, vcc, s2, v19
	v_add_u32_e32 v19, vcc, v22, v0
	flat_store_dword v[30:31], v20
	v_ashrrev_i32_e32 v20, 31, v19
	v_lshlrev_b64 v[19:20], 2, v[19:20]
	v_add_u32_e32 v19, vcc, s0, v19
	v_addc_u32_e32 v20, vcc, v24, v20, vcc
	v_mov_b32_e32 v30, v17
	flat_store_dwordx4 v[19:20], v[27:30]
	v_add_u32_e32 v19, vcc, v22, v57
	v_ashrrev_i32_e32 v20, 31, v19
	v_lshlrev_b64 v[19:20], 2, v[19:20]
	v_mov_b32_e32 v17, s1
	v_add_u32_e32 v19, vcc, s0, v19
	v_addc_u32_e32 v20, vcc, v17, v20, vcc
	v_mov_b32_e32 v26, v15
	v_add_u32_e32 v15, vcc, s2, v22
	v_mov_b32_e32 v28, v13
	v_add_u32_e32 v13, vcc, v15, v0
	v_mov_b32_e32 v27, v14
	v_ashrrev_i32_e32 v14, 31, v13
	v_lshlrev_b64 v[13:14], 2, v[13:14]
	v_add_u32_e32 v13, vcc, s0, v13
	flat_store_dwordx4 v[19:20], v[25:28]
	v_addc_u32_e32 v14, vcc, v17, v14, vcc
	v_mov_b32_e32 v26, v10
	v_add_u32_e32 v10, vcc, v15, v57
	v_mov_b32_e32 v25, v11
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshlrev_b64 v[10:11], 2, v[10:11]
	v_mov_b32_e32 v24, v12
	v_mov_b32_e32 v12, s1
	v_add_u32_e32 v10, vcc, s0, v10
	v_addc_u32_e32 v11, vcc, v12, v11, vcc
	v_mov_b32_e32 v22, v9
	v_add_u32_e32 v9, vcc, s2, v15
	flat_store_dwordx4 v[13:14], v[23:26]
	v_mov_b32_e32 v20, v5
	v_mov_b32_e32 v24, v7
	v_add_u32_e32 v7, vcc, v9, v0
	v_mov_b32_e32 v23, v8
	v_ashrrev_i32_e32 v8, 31, v7
	v_lshlrev_b64 v[7:8], 2, v[7:8]
	v_mov_b32_e32 v0, s1
	v_add_u32_e32 v7, vcc, s0, v7
	flat_store_dwordx4 v[10:11], v[21:24]
	v_addc_u32_e32 v8, vcc, v0, v8, vcc
	v_mov_b32_e32 v21, v4
	v_add_u32_e32 v4, vcc, v9, v57
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_add_u32_e32 v4, vcc, s0, v4
	v_mov_b32_e32 v19, v6
	flat_store_dwordx4 v[7:8], v[18:21]
	v_addc_u32_e32 v5, vcc, v0, v5, vcc
	v_mov_b32_e32 v17, v3
	v_mov_b32_e32 v18, v2
	v_mov_b32_e32 v19, v1
	flat_store_dwordx4 v[4:5], v[16:19]
	s_endpgm
.Lfunc_end0:
	.size	gemm, .Lfunc_end0-gemm
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 5284
; NumSgprs: 18
; NumVgprs: 107
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 8192 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 26
; NumSGPRsForWavesPerEU: 18
; NumVGPRsForWavesPerEU: 107
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
      NumSGPRs:        18
      NumVGPRs:        107
      MaxFlatWorkGroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
