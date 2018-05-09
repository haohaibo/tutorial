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
		granulated_workitem_vgpr_count = 24
		granulated_wavefront_sgpr_count = 3
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
		workgroup_group_segment_byte_size = 4096
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 72
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 28
		workitem_vgpr_count = 98
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
	s_load_dwordx2 s[0:1], s[4:5], 0x10
	s_load_dword s2, s[4:5], 0x18
	s_load_dword s10, s[4:5], 0x20
	v_lshlrev_b32_e32 v2, 3, v1
	s_waitcnt lgkmcnt(0)
	s_cmp_gt_i32 s10, 7
	s_cbranch_scc0 BB0_3
; BB#1:                                 ; %.lr.ph
	s_ashr_i32 s3, s10, 31
	s_lshr_b32 s3, s3, 29
	s_add_i32 s3, s10, s3
	s_load_dwordx2 s[8:9], s[4:5], 0x0
	s_load_dwordx2 s[12:13], s[4:5], 0x8
	v_add_u32_e32 v4, vcc, v2, v0
	s_ashr_i32 s4, s3, 3
	s_lshl_b32 s3, s7, 6
	v_add_u32_e32 v3, vcc, s3, v4
	v_mul_lo_i32 v3, v3, s10
	v_lshlrev_b32_e32 v5, 3, v0
	v_lshlrev_b32_e32 v0, 5, v0
	s_lshl_b32 s5, s6, 6
	v_add_u32_e32 v36, vcc, 0x800, v0
	v_lshlrev_b32_e32 v0, 8, v1
	v_lshlrev_b32_e32 v43, 2, v4
	v_ashrrev_i32_e32 v4, 31, v3
	v_add_u32_e32 v41, vcc, v0, v36
	v_add_u32_e32 v32, vcc, s5, v5
	v_lshlrev_b64 v[3:4], 2, v[3:4]
	v_mul_lo_i32 v1, v1, s2
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s13
	v_add_u32_e32 v3, vcc, s12, v3
	v_addc_u32_e32 v0, vcc, v0, v4, vcc
	v_add_u32_e32 v49, vcc, 28, v3
	v_addc_u32_e32 v53, vcc, 0, v0, vcc
	v_add_u32_e32 v0, vcc, s5, v1
	v_add_u32_e32 v54, vcc, v0, v5
	v_lshlrev_b32_e32 v47, 2, v2
	s_lshl_b32 s5, s2, 3
	v_mov_b32_e32 v3, 0
	s_movk_i32 s6, 0x400
	s_movk_i32 s7, 0x408
	s_movk_i32 s10, 0x410
	s_movk_i32 s11, 0x418
	s_movk_i32 s12, 0x500
	s_movk_i32 s13, 0x508
	s_movk_i32 s14, 0x510
	s_movk_i32 s15, 0x518
	s_movk_i32 s16, 0x600
	s_movk_i32 s17, 0x608
	s_movk_i32 s18, 0x610
	s_movk_i32 s19, 0x618
	s_movk_i32 s20, 0x700
	s_movk_i32 s21, 0x708
	s_movk_i32 s22, 0x710
	s_movk_i32 s23, 0x718
	s_movk_i32 s24, 0xffe4
	s_mov_b32 s25, -12
	v_mov_b32_e32 v59, -1

    ; clear regC[8][8]
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v44, 0
	v_mov_b32_e32 v56, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v19, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v50, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v65, 0
	v_mov_b32_e32 v21, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v25, 0
	v_mov_b32_e32 v28, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v67, 0
	v_mov_b32_e32 v29, 0
	v_mov_b32_e32 v61, 0
	v_mov_b32_e32 v68, 0
	v_mov_b32_e32 v70, 0
	v_mov_b32_e32 v71, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v39, 0
	v_mov_b32_e32 v62, 0
	v_mov_b32_e32 v72, 0
	v_mov_b32_e32 v73, 0
	v_mov_b32_e32 v17, 0
	v_mov_b32_e32 v35, 0
	v_mov_b32_e32 v48, 0
	v_mov_b32_e32 v63, 0
	v_mov_b32_e32 v74, 0
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v75, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v58, 0
	v_mov_b32_e32 v66, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v31, 0
	v_mov_b32_e32 v45, 0
	v_mov_b32_e32 v69, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v42, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v27, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v52, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v38, 0
	v_mov_b32_e32 v57, 0
	s_mov_b32 m0, -1
BB0_2:                                  ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v55, 31, v54
	v_add_u32_e32 v76, vcc, 1, v54
	v_lshlrev_b64 v[78:79], 2, v[54:55]
	v_ashrrev_i32_e32 v77, 31, v76
	v_mov_b32_e32 v60, s9
	v_add_u32_e32 v78, vcc, s8, v78
	v_lshlrev_b64 v[76:77], 2, v[76:77]
	v_addc_u32_e32 v79, vcc, v60, v79, vcc
	v_mov_b32_e32 v80, s9
	v_add_u32_e32 v76, vcc, s8, v76
	v_addc_u32_e32 v77, vcc, v80, v77, vcc
	v_add_u32_e32 v80, vcc, s24, v49
	v_addc_u32_e32 v81, vcc, -1, v53, vcc
	flat_load_dword v55, v[76:77]
	flat_load_dword v60, v[78:79]
	flat_load_dwordx4 v[76:79], v[80:81]
	v_add_u32_e32 v80, vcc, 2, v54
	v_ashrrev_i32_e32 v81, 31, v80
	v_add_u32_e32 v82, vcc, 3, v54
	v_lshlrev_b64 v[80:81], 2, v[80:81]
	v_ashrrev_i32_e32 v83, 31, v82
	v_mov_b32_e32 v84, s9
	v_add_u32_e32 v80, vcc, s8, v80
	v_lshlrev_b64 v[82:83], 2, v[82:83]
	v_addc_u32_e32 v81, vcc, v84, v81, vcc
	v_mov_b32_e32 v85, s9
	v_add_u32_e32 v82, vcc, s8, v82
	v_addc_u32_e32 v83, vcc, v85, v83, vcc
	v_add_u32_e32 v84, vcc, 4, v54
	v_ashrrev_i32_e32 v85, 31, v84
	v_add_u32_e32 v86, vcc, 5, v54
	v_lshlrev_b64 v[84:85], 2, v[84:85]
	v_ashrrev_i32_e32 v87, 31, v86
	v_lshlrev_b64 v[86:87], 2, v[86:87]
	s_add_i32 s4, s4, -1
	s_cmp_eq_u32 s4, 0
	s_waitcnt vmcnt(1) lgkmcnt(1)
	ds_write2_b32 v41, v60, v55 offset1:1
	s_waitcnt vmcnt(0) lgkmcnt(1)
	ds_write2st64_b32 v43, v76, v77 offset1:1
	flat_load_dword v55, v[82:83]
	flat_load_dword v60, v[80:81]
	v_mov_b32_e32 v77, s9
	v_add_u32_e32 v76, vcc, s8, v84
	v_addc_u32_e32 v77, vcc, v77, v85, vcc
	ds_write2st64_b32 v43, v78, v79 offset0:2 offset1:3
	v_add_u32_e32 v78, vcc, s8, v86
	v_mov_b32_e32 v80, s9
	v_addc_u32_e32 v79, vcc, v80, v87, vcc
	v_add_u32_e32 v80, vcc, s25, v49
	v_addc_u32_e32 v81, vcc, v53, v59, vcc
	v_add_u32_e32 v82, vcc, 6, v54
	v_ashrrev_i32_e32 v83, 31, v82
	v_add_u32_e32 v84, vcc, 7, v54
	v_lshlrev_b64 v[82:83], 2, v[82:83]
	v_ashrrev_i32_e32 v85, 31, v84
	v_mov_b32_e32 v86, s9
	v_lshlrev_b64 v[84:85], 2, v[84:85]
	v_mov_b32_e32 v87, s9
	s_waitcnt vmcnt(0) lgkmcnt(1)
	ds_write2_b32 v41, v60, v55 offset0:2 offset1:3
	flat_load_dword v55, v[78:79]
	flat_load_dword v60, v[76:77]
	flat_load_dwordx4 v[76:79], v[80:81]
	v_add_u32_e32 v80, vcc, s8, v82
	v_addc_u32_e32 v81, vcc, v86, v83, vcc
	v_add_u32_e32 v82, vcc, s8, v84
	v_addc_u32_e32 v83, vcc, v87, v85, vcc
	s_waitcnt vmcnt(1) lgkmcnt(1)
	ds_write2_b32 v41, v60, v55 offset0:4 offset1:5
	s_waitcnt vmcnt(0) lgkmcnt(1)
	ds_write2st64_b32 v43, v76, v77 offset0:4 offset1:5
	flat_load_dword v55, v[82:83]
	flat_load_dword v60, v[80:81]
	ds_write2st64_b32 v43, v78, v79 offset0:6 offset1:7
	s_waitcnt vmcnt(0) lgkmcnt(1)
	ds_write2_b32 v41, v60, v55 offset0:6 offset1:7
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read2_b32 v[76:77], v36 offset1:1
	ds_read2_b32 v[78:79], v36 offset0:2 offset1:3
	ds_read2_b32 v[80:81], v36 offset0:4 offset1:5
	ds_read2_b32 v[82:83], v47 offset1:1
	ds_read2_b32 v[84:85], v47 offset0:2 offset1:3
	ds_read2_b32 v[86:87], v47 offset0:4 offset1:5
	ds_read2_b32 v[88:89], v47 offset0:6 offset1:7
	ds_read2_b32 v[90:91], v47 offset0:130 offset1:131
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v69, v76, v82
	v_mac_f32_e32 v57, v76, v83
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v45, v76, v84
	v_mac_f32_e32 v38, v76, v85
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v31, v76, v86
	v_mac_f32_e32 v22, v76, v87
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v9, v76, v88
	v_mac_f32_e32 v5, v76, v89
	v_mac_f32_e32 v66, v77, v82
	v_mac_f32_e32 v58, v77, v83
	v_mac_f32_e32 v37, v77, v84
	v_mac_f32_e32 v40, v77, v85
	v_mac_f32_e32 v26, v77, v86
	v_mac_f32_e32 v75, v77, v87
	v_mac_f32_e32 v4, v77, v88
	v_mac_f32_e32 v74, v77, v89
	ds_read2_b32 v[76:77], v36 offset0:6 offset1:7
	v_mac_f32_e32 v63, v78, v82
	v_mac_f32_e32 v48, v78, v83
	v_mac_f32_e32 v46, v78, v84
	v_mac_f32_e32 v35, v78, v85
	v_mac_f32_e32 v17, v78, v86
	v_mac_f32_e32 v73, v78, v87
	v_mac_f32_e32 v13, v78, v88
	v_mac_f32_e32 v72, v78, v89
	v_mac_f32_e32 v62, v79, v82
	v_mac_f32_e32 v39, v79, v83
	v_mac_f32_e32 v34, v79, v84
	v_mac_f32_e32 v30, v79, v85
	v_mac_f32_e32 v12, v79, v86
	v_mac_f32_e32 v71, v79, v87
	v_mac_f32_e32 v70, v79, v88
	v_mac_f32_e32 v68, v79, v89
	ds_read2_b32 v[78:79], v36 offset0:64 offset1:65
	v_mac_f32_e32 v61, v80, v82
	v_mac_f32_e32 v52, v80, v83
	v_mac_f32_e32 v29, v80, v84
	v_mac_f32_e32 v33, v80, v85
	v_mac_f32_e32 v27, v80, v86
	v_mac_f32_e32 v18, v80, v87
	v_mac_f32_e32 v67, v80, v88
	v_mac_f32_e32 v0, v80, v89
	v_mac_f32_e32 v51, v81, v82
	v_mac_f32_e32 v28, v81, v83
	v_mac_f32_e32 v25, v81, v84
	v_mac_f32_e32 v24, v81, v85
	v_mac_f32_e32 v23, v81, v86
	v_mac_f32_e32 v21, v81, v87
	v_mac_f32_e32 v65, v81, v88
	v_mac_f32_e32 v64, v81, v89
	ds_read2_b32 v[80:81], v36 offset0:66 offset1:67
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v50, v76, v82
	v_mac_f32_e32 v20, v76, v83
	v_mac_f32_e32 v44, v77, v82
	v_mac_f32_e32 v14, v77, v83
	ds_read2_b32 v[82:83], v47 offset0:64 offset1:65
	v_mac_f32_e32 v42, v76, v84
	v_mac_f32_e32 v19, v76, v85
	v_mac_f32_e32 v11, v77, v84
	v_mac_f32_e32 v8, v77, v85
	ds_read2_b32 v[84:85], v47 offset0:66 offset1:67
	v_mac_f32_e32 v16, v76, v86
	v_mac_f32_e32 v15, v76, v87
	v_mac_f32_e32 v7, v77, v86
	v_mac_f32_e32 v6, v77, v87
	ds_read2_b32 v[86:87], v47 offset0:68 offset1:69
	v_mac_f32_e32 v10, v76, v88
	v_mac_f32_e32 v56, v76, v89
	v_mac_f32_e32 v1, v77, v88
	v_mac_f32_e32 v3, v77, v89
	ds_read2_b32 v[76:77], v47 offset0:70 offset1:71
	ds_read2_b32 v[88:89], v47 offset0:128 offset1:129
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v69, v78, v82
	v_mac_f32_e32 v57, v78, v83
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v45, v78, v84
	v_mac_f32_e32 v38, v78, v85
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v31, v78, v86
	v_mac_f32_e32 v22, v78, v87
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v9, v78, v76
	v_mac_f32_e32 v5, v78, v77
	v_mac_f32_e32 v66, v79, v82
	v_mac_f32_e32 v58, v79, v83
	v_mac_f32_e32 v37, v79, v84
	v_mac_f32_e32 v40, v79, v85
	v_mac_f32_e32 v26, v79, v86
	v_mac_f32_e32 v75, v79, v87
	v_mac_f32_e32 v4, v79, v76
	v_mac_f32_e32 v74, v79, v77
	v_mac_f32_e32 v63, v80, v82
	v_mac_f32_e32 v48, v80, v83
	v_mac_f32_e32 v46, v80, v84
	v_mac_f32_e32 v35, v80, v85
	v_mac_f32_e32 v17, v80, v86
	v_mac_f32_e32 v73, v80, v87
	v_mac_f32_e32 v13, v80, v76
	v_mac_f32_e32 v72, v80, v77
	v_mac_f32_e32 v62, v81, v82
	v_mac_f32_e32 v39, v81, v83
	v_mac_f32_e32 v34, v81, v84
	v_mac_f32_e32 v30, v81, v85
	v_mac_f32_e32 v12, v81, v86
	v_mac_f32_e32 v71, v81, v87
	v_mac_f32_e32 v70, v81, v76
	v_mac_f32_e32 v68, v81, v77
	ds_read2_b32 v[78:79], v36 offset0:68 offset1:69
	ds_read2_b32 v[80:81], v36 offset0:70 offset1:71
	ds_read2_b32 v[92:93], v36 offset0:128 offset1:129
	ds_read2_b32 v[94:95], v47 offset0:134 offset1:135
	ds_read2_b32 v[96:97], v36 offset0:192 offset1:193
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v61, v78, v82
	v_mac_f32_e32 v52, v78, v83
	v_mac_f32_e32 v29, v78, v84
	v_mac_f32_e32 v33, v78, v85
	v_mac_f32_e32 v27, v78, v86
	v_mac_f32_e32 v18, v78, v87
	v_mac_f32_e32 v67, v78, v76
	v_mac_f32_e32 v0, v78, v77
	v_mac_f32_e32 v51, v79, v82
	v_mac_f32_e32 v28, v79, v83
	v_mac_f32_e32 v25, v79, v84
	v_mac_f32_e32 v24, v79, v85
	v_mac_f32_e32 v23, v79, v86
	v_mac_f32_e32 v21, v79, v87
	v_mac_f32_e32 v65, v79, v76
	v_mac_f32_e32 v64, v79, v77
	ds_read2_b32 v[78:79], v47 offset0:132 offset1:133
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v50, v80, v82
	v_mac_f32_e32 v20, v80, v83
	v_mac_f32_e32 v44, v81, v82
	v_mac_f32_e32 v14, v81, v83
	v_mac_f32_e32 v42, v80, v84
	v_mac_f32_e32 v19, v80, v85
	v_mac_f32_e32 v11, v81, v84
	v_mac_f32_e32 v8, v81, v85
	v_mac_f32_e32 v16, v80, v86
	v_mac_f32_e32 v15, v80, v87
	v_mac_f32_e32 v7, v81, v86
	v_mac_f32_e32 v6, v81, v87
	v_mac_f32_e32 v10, v80, v76
	v_mac_f32_e32 v56, v80, v77
	v_mac_f32_e32 v1, v81, v76
	v_mac_f32_e32 v3, v81, v77
	ds_read2_b32 v[76:77], v47 offset0:192 offset1:193
	ds_read2_b32 v[80:81], v36 offset0:130 offset1:131
	s_waitcnt lgkmcnt(5)
	v_mac_f32_e32 v69, v92, v88
	v_mac_f32_e32 v57, v92, v89
	v_mac_f32_e32 v66, v93, v88
	v_mac_f32_e32 v58, v93, v89
	v_mac_f32_e32 v45, v92, v90
	v_mac_f32_e32 v38, v92, v91
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v31, v92, v78
	v_mac_f32_e32 v22, v92, v79
	v_mac_f32_e32 v9, v92, v94
	v_mac_f32_e32 v5, v92, v95
	v_mac_f32_e32 v37, v93, v90
	v_mac_f32_e32 v40, v93, v91
	v_mac_f32_e32 v26, v93, v78
	v_mac_f32_e32 v75, v93, v79
	v_mac_f32_e32 v4, v93, v94
	v_mac_f32_e32 v74, v93, v95
	ds_read2_b32 v[82:83], v36 offset0:132 offset1:133
	ds_read2_b32 v[92:93], v36 offset0:134 offset1:135
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v63, v80, v88
	ds_read2_b32 v[86:87], v36 offset0:194 offset1:195
	v_mac_f32_e32 v48, v80, v89
	v_mac_f32_e32 v62, v81, v88
	v_mac_f32_e32 v39, v81, v89
	v_mac_f32_e32 v46, v80, v90
	v_mac_f32_e32 v35, v80, v91
	v_mac_f32_e32 v17, v80, v78
	v_mac_f32_e32 v73, v80, v79
	v_mac_f32_e32 v13, v80, v94
	v_mac_f32_e32 v72, v80, v95
	v_mac_f32_e32 v34, v81, v90
	v_mac_f32_e32 v30, v81, v91
	v_mac_f32_e32 v12, v81, v78
	v_mac_f32_e32 v71, v81, v79
	v_mac_f32_e32 v70, v81, v94
	v_mac_f32_e32 v68, v81, v95
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v61, v82, v88
	v_mac_f32_e32 v52, v82, v89
	v_mac_f32_e32 v29, v82, v90
	v_mac_f32_e32 v33, v82, v91
	v_mac_f32_e32 v27, v82, v78
	v_mac_f32_e32 v18, v82, v79
	v_mac_f32_e32 v67, v82, v94
	v_mac_f32_e32 v0, v82, v95
	v_mac_f32_e32 v51, v83, v88
	v_mac_f32_e32 v28, v83, v89
	v_mac_f32_e32 v25, v83, v90
	v_mac_f32_e32 v24, v83, v91
	v_mac_f32_e32 v23, v83, v78
	v_mac_f32_e32 v21, v83, v79
	v_mac_f32_e32 v65, v83, v94
	v_mac_f32_e32 v64, v83, v95
	ds_read2_b32 v[82:83], v47 offset0:194 offset1:195
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v16, v92, v78
	v_mac_f32_e32 v15, v92, v79
	v_mac_f32_e32 v7, v93, v78
	v_mac_f32_e32 v6, v93, v79
	ds_read2_b32 v[80:81], v47 offset0:196 offset1:197
	ds_read2_b32 v[78:79], v47 offset0:198 offset1:199
	ds_read2_b32 v[84:85], v36 offset0:196 offset1:197
	s_waitcnt lgkmcnt(4)
	v_mac_f32_e32 v63, v86, v76
	v_mac_f32_e32 v48, v86, v77
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v46, v86, v82
	v_mac_f32_e32 v35, v86, v83
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v17, v86, v80
	v_mac_f32_e32 v73, v86, v81
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v13, v86, v78
	v_mac_f32_e32 v72, v86, v79
	v_mac_f32_e32 v62, v87, v76
	v_mac_f32_e32 v39, v87, v77
	v_mac_f32_e32 v34, v87, v82
	v_mac_f32_e32 v30, v87, v83
	v_mac_f32_e32 v12, v87, v80
	v_mac_f32_e32 v71, v87, v81
	v_mac_f32_e32 v70, v87, v78
	v_mac_f32_e32 v68, v87, v79
	ds_read2_b32 v[86:87], v36 offset0:198 offset1:199
	v_mac_f32_e32 v42, v92, v90
	v_mac_f32_e32 v11, v93, v90
	v_add_u32_e32 v55, vcc, s22, v36
	v_add_u32_e32 v60, vcc, s23, v36
	v_mac_f32_e32 v50, v92, v88
	v_mac_f32_e32 v20, v92, v89
	v_mac_f32_e32 v44, v93, v88
	v_mac_f32_e32 v14, v93, v89
	v_mac_f32_e32 v19, v92, v91
	v_mac_f32_e32 v8, v93, v91
	v_mac_f32_e32 v10, v92, v94
	v_mac_f32_e32 v56, v92, v95
	v_mac_f32_e32 v1, v93, v94
	v_mac_f32_e32 v3, v93, v95
	v_mac_f32_e32 v45, v96, v82
	v_mac_f32_e32 v31, v96, v80
	v_mac_f32_e32 v37, v97, v82
	v_mac_f32_e32 v26, v97, v80
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v61, v84, v76
	v_mac_f32_e32 v52, v84, v77
	v_mac_f32_e32 v29, v84, v82
	v_mac_f32_e32 v33, v84, v83
	v_mac_f32_e32 v27, v84, v80
	v_mac_f32_e32 v18, v84, v81
	v_mac_f32_e32 v67, v84, v78
	v_mac_f32_e32 v0, v84, v79
	v_mac_f32_e32 v51, v85, v76
	v_mac_f32_e32 v28, v85, v77
	v_mac_f32_e32 v25, v85, v82
	v_mac_f32_e32 v24, v85, v83
	v_mac_f32_e32 v23, v85, v80
	v_mac_f32_e32 v21, v85, v81
	v_mac_f32_e32 v65, v85, v78
	v_mac_f32_e32 v64, v85, v79
	ds_read2_b32 v[84:85], v60 offset1:1
	ds_read2_b32 v[88:89], v55 offset1:1
	v_add_u32_e32 v55, vcc, s6, v36
	v_add_u32_e32 v60, vcc, s6, v47
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v42, v86, v82
	v_mac_f32_e32 v11, v87, v82
	v_add_u32_e32 v90, vcc, s7, v47
	v_add_u32_e32 v82, vcc, s10, v47
	v_mac_f32_e32 v16, v86, v80
	v_mac_f32_e32 v7, v87, v80
	v_add_u32_e32 v80, vcc, s11, v47
	v_mac_f32_e32 v69, v96, v76
	v_mac_f32_e32 v57, v96, v77
	v_mac_f32_e32 v38, v96, v83
	v_mac_f32_e32 v22, v96, v81
	v_mac_f32_e32 v9, v96, v78
	v_mac_f32_e32 v5, v96, v79
	v_mac_f32_e32 v66, v97, v76
	v_mac_f32_e32 v58, v97, v77
	v_mac_f32_e32 v40, v97, v83
	v_mac_f32_e32 v75, v97, v81
	v_mac_f32_e32 v4, v97, v78
	v_mac_f32_e32 v74, v97, v79
	v_mac_f32_e32 v50, v86, v76
	v_mac_f32_e32 v20, v86, v77
	v_mac_f32_e32 v44, v87, v76
	v_mac_f32_e32 v14, v87, v77
	ds_read2_b32 v[76:77], v55 offset1:1
	v_mac_f32_e32 v19, v86, v83
	v_mac_f32_e32 v8, v87, v83
	v_mac_f32_e32 v15, v86, v81
	v_mac_f32_e32 v6, v87, v81
	v_mac_f32_e32 v10, v86, v78
	v_mac_f32_e32 v56, v86, v79
	v_mac_f32_e32 v1, v87, v78
	v_mac_f32_e32 v3, v87, v79
	ds_read2_b32 v[78:79], v60 offset1:1
	ds_read2_b32 v[80:81], v80 offset1:1
	ds_read2_b32 v[82:83], v82 offset1:1
	ds_read2_b32 v[86:87], v90 offset1:1
	v_add_u32_e32 v55, vcc, s7, v36
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v69, v76, v78
	v_mac_f32_e32 v57, v76, v79
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v31, v76, v82
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v45, v76, v86
	v_mac_f32_e32 v38, v76, v87
	v_mac_f32_e32 v22, v76, v83
	v_mac_f32_e32 v9, v76, v80
	v_mac_f32_e32 v5, v76, v81
	v_mac_f32_e32 v66, v77, v78
	v_mac_f32_e32 v58, v77, v79
	v_mac_f32_e32 v37, v77, v86
	v_mac_f32_e32 v40, v77, v87
	v_mac_f32_e32 v26, v77, v82
	v_mac_f32_e32 v75, v77, v83
	v_mac_f32_e32 v4, v77, v80
	v_mac_f32_e32 v74, v77, v81
	ds_read2_b32 v[76:77], v55 offset1:1
	v_add_u32_e32 v55, vcc, s10, v36
	v_add_u32_e32 v60, vcc, s12, v47
	v_add_u32_e32 v90, vcc, s15, v47
	v_add_u32_e32 v91, vcc, s22, v47
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v63, v76, v78
	v_mac_f32_e32 v48, v76, v79
	v_mac_f32_e32 v46, v76, v86
	v_mac_f32_e32 v35, v76, v87
	v_mac_f32_e32 v17, v76, v82
	v_mac_f32_e32 v73, v76, v83
	v_mac_f32_e32 v13, v76, v80
	v_mac_f32_e32 v72, v76, v81
	v_mac_f32_e32 v62, v77, v78
	v_mac_f32_e32 v39, v77, v79
	v_mac_f32_e32 v34, v77, v86
	v_mac_f32_e32 v30, v77, v87
	v_mac_f32_e32 v12, v77, v82
	v_mac_f32_e32 v71, v77, v83
	v_mac_f32_e32 v70, v77, v80
	v_mac_f32_e32 v68, v77, v81
	ds_read2_b32 v[76:77], v55 offset1:1
	v_add_u32_e32 v55, vcc, s11, v36
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v61, v76, v78
	v_mac_f32_e32 v52, v76, v79
	v_mac_f32_e32 v29, v76, v86
	v_mac_f32_e32 v33, v76, v87
	v_mac_f32_e32 v27, v76, v82
	v_mac_f32_e32 v18, v76, v83
	v_mac_f32_e32 v67, v76, v80
	v_mac_f32_e32 v0, v76, v81
	v_mac_f32_e32 v51, v77, v78
	v_mac_f32_e32 v28, v77, v79
	v_mac_f32_e32 v25, v77, v86
	v_mac_f32_e32 v24, v77, v87
	v_mac_f32_e32 v23, v77, v82
	v_mac_f32_e32 v21, v77, v83
	v_mac_f32_e32 v65, v77, v80
	v_mac_f32_e32 v64, v77, v81
	ds_read2_b32 v[76:77], v55 offset1:1
	v_add_u32_e32 v55, vcc, s12, v36
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v42, v76, v86
	v_mac_f32_e32 v11, v77, v86
	v_mac_f32_e32 v19, v76, v87
	v_mac_f32_e32 v8, v77, v87
	v_add_u32_e32 v86, vcc, s13, v47
	v_add_u32_e32 v87, vcc, s14, v47
	v_mac_f32_e32 v50, v76, v78
	v_mac_f32_e32 v20, v76, v79
	v_mac_f32_e32 v44, v77, v78
	v_mac_f32_e32 v14, v77, v79
	ds_read2_b32 v[78:79], v55 offset1:1
	v_mac_f32_e32 v16, v76, v82
	v_mac_f32_e32 v15, v76, v83
	v_mac_f32_e32 v7, v77, v82
	v_mac_f32_e32 v6, v77, v83
	v_mac_f32_e32 v10, v76, v80
	v_mac_f32_e32 v56, v76, v81
	v_mac_f32_e32 v1, v77, v80
	v_mac_f32_e32 v3, v77, v81
	ds_read2_b32 v[76:77], v87 offset1:1
	ds_read2_b32 v[80:81], v86 offset1:1
	ds_read2_b32 v[82:83], v60 offset1:1
	ds_read2_b32 v[86:87], v90 offset1:1
	v_add_u32_e32 v55, vcc, s13, v36
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v31, v78, v76
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v45, v78, v80
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v69, v78, v82
	v_mac_f32_e32 v57, v78, v83
	v_mac_f32_e32 v38, v78, v81
	v_mac_f32_e32 v22, v78, v77
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v9, v78, v86
	v_mac_f32_e32 v5, v78, v87
	v_mac_f32_e32 v66, v79, v82
	v_mac_f32_e32 v58, v79, v83
	v_mac_f32_e32 v37, v79, v80
	v_mac_f32_e32 v40, v79, v81
	v_mac_f32_e32 v26, v79, v76
	v_mac_f32_e32 v75, v79, v77
	v_mac_f32_e32 v4, v79, v86
	v_mac_f32_e32 v74, v79, v87
	ds_read2_b32 v[78:79], v55 offset1:1
	v_add_u32_e32 v55, vcc, s14, v36
	v_add_u32_e32 v60, vcc, s16, v47
	v_add_u32_e32 v90, vcc, s18, v47
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v63, v78, v82
	v_mac_f32_e32 v48, v78, v83
	v_mac_f32_e32 v46, v78, v80
	v_mac_f32_e32 v35, v78, v81
	v_mac_f32_e32 v17, v78, v76
	v_mac_f32_e32 v73, v78, v77
	v_mac_f32_e32 v13, v78, v86
	v_mac_f32_e32 v72, v78, v87
	v_mac_f32_e32 v62, v79, v82
	v_mac_f32_e32 v39, v79, v83
	v_mac_f32_e32 v34, v79, v80
	v_mac_f32_e32 v30, v79, v81
	v_mac_f32_e32 v12, v79, v76
	v_mac_f32_e32 v71, v79, v77
	v_mac_f32_e32 v70, v79, v86
	v_mac_f32_e32 v68, v79, v87
	ds_read2_b32 v[78:79], v55 offset1:1
	v_add_u32_e32 v55, vcc, s15, v36
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v61, v78, v82
	v_mac_f32_e32 v52, v78, v83
	v_mac_f32_e32 v29, v78, v80
	v_mac_f32_e32 v33, v78, v81
	v_mac_f32_e32 v27, v78, v76
	v_mac_f32_e32 v18, v78, v77
	v_mac_f32_e32 v67, v78, v86
	v_mac_f32_e32 v0, v78, v87
	v_mac_f32_e32 v51, v79, v82
	v_mac_f32_e32 v28, v79, v83
	v_mac_f32_e32 v25, v79, v80
	v_mac_f32_e32 v24, v79, v81
	v_mac_f32_e32 v23, v79, v76
	v_mac_f32_e32 v21, v79, v77
	v_mac_f32_e32 v65, v79, v86
	v_mac_f32_e32 v64, v79, v87
	ds_read2_b32 v[78:79], v55 offset1:1
	v_add_u32_e32 v55, vcc, s16, v36
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v50, v78, v82
	v_mac_f32_e32 v44, v79, v82
	v_mac_f32_e32 v42, v78, v80
	v_mac_f32_e32 v11, v79, v80
	v_add_u32_e32 v80, vcc, s17, v47
	v_add_u32_e32 v82, vcc, s19, v47
	v_mac_f32_e32 v20, v78, v83
	v_mac_f32_e32 v14, v79, v83
	v_mac_f32_e32 v19, v78, v81
	v_mac_f32_e32 v8, v79, v81
	v_mac_f32_e32 v16, v78, v76
	v_mac_f32_e32 v15, v78, v77
	v_mac_f32_e32 v7, v79, v76
	v_mac_f32_e32 v6, v79, v77
	ds_read2_b32 v[76:77], v60 offset1:1
	v_mac_f32_e32 v10, v78, v86
	v_mac_f32_e32 v56, v78, v87
	v_mac_f32_e32 v1, v79, v86
	v_mac_f32_e32 v3, v79, v87
	ds_read2_b32 v[78:79], v80 offset1:1
	ds_read2_b32 v[80:81], v55 offset1:1
	ds_read2_b32 v[82:83], v82 offset1:1
	ds_read2_b32 v[86:87], v90 offset1:1
	v_add_u32_e32 v55, vcc, s17, v36
	v_add_u32_e32 v60, vcc, s20, v47
	s_waitcnt lgkmcnt(2)
	v_mac_f32_e32 v69, v80, v76
	v_mac_f32_e32 v57, v80, v77
	v_mac_f32_e32 v45, v80, v78
	v_mac_f32_e32 v38, v80, v79
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v31, v80, v86
	v_mac_f32_e32 v22, v80, v87
	v_mac_f32_e32 v9, v80, v82
	v_mac_f32_e32 v5, v80, v83
	v_mac_f32_e32 v66, v81, v76
	v_mac_f32_e32 v58, v81, v77
	v_mac_f32_e32 v37, v81, v78
	v_mac_f32_e32 v40, v81, v79
	v_mac_f32_e32 v26, v81, v86
	v_mac_f32_e32 v75, v81, v87
	v_mac_f32_e32 v4, v81, v82
	v_mac_f32_e32 v74, v81, v83
	ds_read2_b32 v[80:81], v55 offset1:1
	v_add_u32_e32 v55, vcc, s18, v36
	v_add_u32_e32 v90, vcc, s21, v47
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v63, v80, v76
	v_mac_f32_e32 v48, v80, v77
	v_mac_f32_e32 v46, v80, v78
	v_mac_f32_e32 v35, v80, v79
	v_mac_f32_e32 v17, v80, v86
	v_mac_f32_e32 v73, v80, v87
	v_mac_f32_e32 v13, v80, v82
	v_mac_f32_e32 v72, v80, v83
	v_mac_f32_e32 v62, v81, v76
	v_mac_f32_e32 v39, v81, v77
	v_mac_f32_e32 v34, v81, v78
	v_mac_f32_e32 v30, v81, v79
	v_mac_f32_e32 v12, v81, v86
	v_mac_f32_e32 v71, v81, v87
	v_mac_f32_e32 v70, v81, v82
	v_mac_f32_e32 v68, v81, v83
	ds_read2_b32 v[80:81], v55 offset1:1
	v_add_u32_e32 v55, vcc, s19, v36
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v61, v80, v76
	v_mac_f32_e32 v52, v80, v77
	v_mac_f32_e32 v29, v80, v78
	v_mac_f32_e32 v33, v80, v79
	v_mac_f32_e32 v27, v80, v86
	v_mac_f32_e32 v18, v80, v87
	v_mac_f32_e32 v67, v80, v82
	v_mac_f32_e32 v0, v80, v83
	v_mac_f32_e32 v51, v81, v76
	v_mac_f32_e32 v28, v81, v77
	v_mac_f32_e32 v25, v81, v78
	v_mac_f32_e32 v24, v81, v79
	v_mac_f32_e32 v23, v81, v86
	v_mac_f32_e32 v21, v81, v87
	v_mac_f32_e32 v65, v81, v82
	v_mac_f32_e32 v64, v81, v83
	ds_read2_b32 v[80:81], v55 offset1:1
	v_add_u32_e32 v55, vcc, s20, v36
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v16, v80, v86
	v_mac_f32_e32 v7, v81, v86
	v_add_u32_e32 v86, vcc, s23, v47
	v_mac_f32_e32 v50, v80, v76
	v_mac_f32_e32 v20, v80, v77
	v_mac_f32_e32 v44, v81, v76
	v_mac_f32_e32 v14, v81, v77
	ds_read2_b32 v[76:77], v55 offset1:1
	v_mac_f32_e32 v42, v80, v78
	v_mac_f32_e32 v19, v80, v79
	v_mac_f32_e32 v11, v81, v78
	v_mac_f32_e32 v8, v81, v79
	v_mac_f32_e32 v15, v80, v87
	v_mac_f32_e32 v6, v81, v87
	v_mac_f32_e32 v10, v80, v82
	v_mac_f32_e32 v56, v80, v83
	v_mac_f32_e32 v1, v81, v82
	v_mac_f32_e32 v3, v81, v83
	ds_read2_b32 v[78:79], v60 offset1:1
	ds_read2_b32 v[80:81], v86 offset1:1
	ds_read2_b32 v[82:83], v91 offset1:1
	ds_read2_b32 v[86:87], v90 offset1:1
	v_add_u32_e32 v55, vcc, s21, v36
	s_waitcnt lgkmcnt(3)
	v_mac_f32_e32 v69, v76, v78
	v_mac_f32_e32 v57, v76, v79
	s_waitcnt lgkmcnt(1)
	v_mac_f32_e32 v31, v76, v82
	s_waitcnt lgkmcnt(0)
	v_mac_f32_e32 v45, v76, v86
	v_mac_f32_e32 v38, v76, v87
	v_mac_f32_e32 v22, v76, v83
	v_mac_f32_e32 v9, v76, v80
	v_mac_f32_e32 v5, v76, v81
	v_mac_f32_e32 v66, v77, v78
	v_mac_f32_e32 v58, v77, v79
	v_mac_f32_e32 v37, v77, v86
	v_mac_f32_e32 v40, v77, v87
	v_mac_f32_e32 v26, v77, v82
	v_mac_f32_e32 v75, v77, v83
	v_mac_f32_e32 v4, v77, v80
	v_mac_f32_e32 v74, v77, v81
	ds_read2_b32 v[76:77], v55 offset1:1
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_add_u32_e32 v49, vcc, 32, v49
	v_addc_u32_e32 v53, vcc, 0, v53, vcc
	v_add_u32_e32 v54, vcc, s5, v54
	v_mac_f32_e32 v63, v76, v78
	v_mac_f32_e32 v48, v76, v79
	v_mac_f32_e32 v46, v76, v86
	v_mac_f32_e32 v35, v76, v87
	v_mac_f32_e32 v17, v76, v82
	v_mac_f32_e32 v73, v76, v83
	v_mac_f32_e32 v13, v76, v80
	v_mac_f32_e32 v72, v76, v81
	v_mac_f32_e32 v62, v77, v78
	v_mac_f32_e32 v39, v77, v79
	v_mac_f32_e32 v34, v77, v86
	v_mac_f32_e32 v30, v77, v87
	v_mac_f32_e32 v12, v77, v82
	v_mac_f32_e32 v71, v77, v83
	v_mac_f32_e32 v70, v77, v80
	v_mac_f32_e32 v68, v77, v81
	v_mac_f32_e32 v61, v88, v78
	v_mac_f32_e32 v52, v88, v79
	v_mac_f32_e32 v29, v88, v86
	v_mac_f32_e32 v33, v88, v87
	v_mac_f32_e32 v27, v88, v82
	v_mac_f32_e32 v18, v88, v83
	v_mac_f32_e32 v67, v88, v80
	v_mac_f32_e32 v0, v88, v81
	v_mac_f32_e32 v51, v89, v78
	v_mac_f32_e32 v28, v89, v79
	v_mac_f32_e32 v25, v89, v86
	v_mac_f32_e32 v24, v89, v87
	v_mac_f32_e32 v23, v89, v82
	v_mac_f32_e32 v21, v89, v83
	v_mac_f32_e32 v65, v89, v80
	v_mac_f32_e32 v64, v89, v81
	v_mac_f32_e32 v50, v84, v78
	v_mac_f32_e32 v20, v84, v79
	v_mac_f32_e32 v44, v85, v78
	v_mac_f32_e32 v14, v85, v79
	v_mac_f32_e32 v42, v84, v86
	v_mac_f32_e32 v19, v84, v87
	v_mac_f32_e32 v11, v85, v86
	v_mac_f32_e32 v8, v85, v87
	v_mac_f32_e32 v16, v84, v82
	v_mac_f32_e32 v15, v84, v83
	v_mac_f32_e32 v7, v85, v82
	v_mac_f32_e32 v6, v85, v83
	v_mac_f32_e32 v10, v84, v80
	v_mac_f32_e32 v56, v84, v81
	v_mac_f32_e32 v1, v85, v80
	v_mac_f32_e32 v3, v85, v81
	s_cbranch_scc0 BB0_2
	s_branch BB0_4
BB0_3:                                  ; %._crit_edge1229
	s_lshl_b32 s4, s6, 6
	v_lshlrev_b32_e32 v0, 3, v0
	v_add_u32_e32 v32, vcc, s4, v0
	s_lshl_b32 s3, s7, 6
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v56, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v19, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v65, 0
	v_mov_b32_e32 v21, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v25, 0
	v_mov_b32_e32 v28, 0
	v_mov_b32_e32 v67, 0
	v_mov_b32_e32 v29, 0
	v_mov_b32_e32 v68, 0
	v_mov_b32_e32 v70, 0
	v_mov_b32_e32 v71, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v72, 0
	v_mov_b32_e32 v73, 0
	v_mov_b32_e32 v17, 0
	v_mov_b32_e32 v35, 0
	v_mov_b32_e32 v74, 0
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v75, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v31, 0
	v_mov_b32_e32 v45, 0
	v_mov_b32_e32 v39, 0
	v_mov_b32_e32 v48, 0
	v_mov_b32_e32 v58, 0
	v_mov_b32_e32 v44, 0
	v_mov_b32_e32 v50, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v61, 0
	v_mov_b32_e32 v62, 0
	v_mov_b32_e32 v63, 0
	v_mov_b32_e32 v66, 0
	v_mov_b32_e32 v69, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v42, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v27, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v52, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v38, 0
	v_mov_b32_e32 v57, 0
BB0_4:
	v_add_u32_e32 v2, vcc, s3, v2
	v_mov_b32_e32 v43, v11
	v_mov_b32_e32 v11, v1
	v_mov_b32_e32 v1, v64
	v_mul_lo_i32 v64, v2, s2
	v_mov_b32_e32 v59, v48
	v_mov_b32_e32 v48, v29
	v_mov_b32_e32 v29, v16
	v_add_u32_e32 v64, vcc, v64, v32
	v_mov_b32_e32 v16, v65
	v_ashrrev_i32_e32 v65, 31, v64
	v_mov_b32_e32 v54, v20
	v_mov_b32_e32 v36, v8
	v_mov_b32_e32 v20, v15
	v_mov_b32_e32 v15, v67
	v_mov_b32_e32 v8, v68
	v_lshlrev_b64 v[67:68], 2, v[64:65]
	v_mov_b32_e32 v32, s1
	v_add_u32_e32 v67, vcc, s0, v67
	v_addc_u32_e32 v68, vcc, v32, v68, vcc
	flat_store_dword v[67:68], v69
	v_or_b32_e32 v67, 1, v64
	v_ashrrev_i32_e32 v68, 31, v67
	v_lshlrev_b64 v[67:68], 2, v[67:68]
	v_mov_b32_e32 v2, v56
	v_mov_b32_e32 v56, s1
	v_add_u32_e32 v67, vcc, s0, v67
	v_addc_u32_e32 v68, vcc, v56, v68, vcc
	v_or_b32_e32 v65, 2, v64
	flat_store_dword v[67:68], v66
	v_ashrrev_i32_e32 v66, 31, v65
	v_lshlrev_b64 v[65:66], 2, v[65:66]
	v_mov_b32_e32 v55, v14
	v_mov_b32_e32 v14, v70
	v_mov_b32_e32 v70, s1
	v_add_u32_e32 v65, vcc, s0, v65
	v_addc_u32_e32 v66, vcc, v70, v66, vcc
	flat_store_dword v[65:66], v63
	v_or_b32_e32 v65, 3, v64
	v_ashrrev_i32_e32 v66, 31, v65
	v_lshlrev_b64 v[65:66], 2, v[65:66]
	v_mov_b32_e32 v49, v25
	v_mov_b32_e32 v25, v71
	v_mov_b32_e32 v71, s1
	v_add_u32_e32 v65, vcc, s0, v65
	v_addc_u32_e32 v66, vcc, v71, v66, vcc
	flat_store_dword v[65:66], v62
	v_or_b32_e32 v62, 4, v64
	v_ashrrev_i32_e32 v63, 31, v62
	v_lshlrev_b64 v[62:63], 2, v[62:63]
	v_mov_b32_e32 v41, v30
	v_mov_b32_e32 v30, v7
	v_mov_b32_e32 v7, v72
	v_mov_b32_e32 v72, s1
	v_add_u32_e32 v62, vcc, s0, v62
	v_addc_u32_e32 v63, vcc, v72, v63, vcc
	flat_store_dword v[62:63], v61
	v_or_b32_e32 v61, 5, v64
	v_ashrrev_i32_e32 v62, 31, v61
	v_lshlrev_b64 v[61:62], 2, v[61:62]
	v_mov_b32_e32 v47, v34
	v_mov_b32_e32 v34, v24
	v_mov_b32_e32 v24, v73
	v_mov_b32_e32 v73, s1
	v_add_u32_e32 v61, vcc, s0, v61
	v_addc_u32_e32 v62, vcc, v73, v62, vcc
	flat_store_dword v[61:62], v51
	v_or_b32_e32 v61, 6, v64
	v_ashrrev_i32_e32 v62, 31, v61
	v_lshlrev_b64 v[61:62], 2, v[61:62]
	v_mov_b32_e32 v60, v39
	v_mov_b32_e32 v39, v40
	v_mov_b32_e32 v40, v35
	v_mov_b32_e32 v35, v19
	v_mov_b32_e32 v19, v21
	v_mov_b32_e32 v21, v6
	v_mov_b32_e32 v6, v74
	v_mov_b32_e32 v74, s1
	v_add_u32_e32 v61, vcc, s0, v61
	v_addc_u32_e32 v62, vcc, v74, v62, vcc
	flat_store_dword v[61:62], v50
	v_or_b32_e32 v50, 7, v64
	v_ashrrev_i32_e32 v51, 31, v50
	v_lshlrev_b64 v[50:51], 2, v[50:51]
	v_mov_b32_e32 v53, v28
	v_mov_b32_e32 v28, v23
	v_mov_b32_e32 v23, v75
	v_mov_b32_e32 v75, s1
	v_add_u32_e32 v50, vcc, s0, v50
	v_addc_u32_e32 v51, vcc, v75, v51, vcc
	flat_store_dword v[50:51], v44
	v_add_u32_e32 v50, vcc, s2, v64
	v_ashrrev_i32_e32 v51, 31, v50
	v_lshlrev_b64 v[61:62], 2, v[50:51]
	v_mov_b32_e32 v76, s1
	v_add_u32_e32 v61, vcc, s0, v61
	v_addc_u32_e32 v62, vcc, v76, v62, vcc
	v_add_u32_e32 v56, vcc, 16, v61
	flat_store_dwordx4 v[61:62], v[57:60]
	s_nop 0
	v_addc_u32_e32 v57, vcc, 0, v62, vcc
	v_add_u32_e32 v50, vcc, s2, v50
	v_ashrrev_i32_e32 v51, 31, v50
	flat_store_dwordx4 v[56:57], v[52:55]
	s_nop 0
	v_lshlrev_b64 v[51:52], 2, v[50:51]
	v_or_b32_e32 v53, 1, v50
	v_ashrrev_i32_e32 v54, 31, v53
	v_add_u32_e32 v51, vcc, s0, v51
	v_addc_u32_e32 v52, vcc, v32, v52, vcc
	v_lshlrev_b64 v[53:54], 2, v[53:54]
	v_add_u32_e32 v53, vcc, s0, v53
	v_addc_u32_e32 v54, vcc, v32, v54, vcc
	v_add_u32_e32 v44, vcc, 8, v51
	flat_store_dword v[51:52], v45
	flat_store_dword v[53:54], v37
	v_addc_u32_e32 v45, vcc, 0, v52, vcc
	flat_store_dwordx4 v[44:45], v[46:49]
	v_add_u32_e32 v44, vcc, 24, v51
	v_addc_u32_e32 v45, vcc, 0, v52, vcc
	flat_store_dwordx2 v[44:45], v[42:43]
	v_add_u32_e32 v42, vcc, s2, v50
	v_ashrrev_i32_e32 v43, 31, v42
	v_lshlrev_b64 v[43:44], 2, v[42:43]
	v_add_u32_e32 v43, vcc, s0, v43
	v_addc_u32_e32 v44, vcc, v32, v44, vcc
	v_add_u32_e32 v37, vcc, 16, v43
	flat_store_dwordx4 v[43:44], v[38:41]
	s_nop 0
	v_addc_u32_e32 v38, vcc, 0, v44, vcc
	v_add_u32_e32 v32, vcc, s2, v42
	flat_store_dwordx4 v[37:38], v[33:36]
	v_mov_b32_e32 v37, s1
	v_ashrrev_i32_e32 v33, 31, v32
	v_lshlrev_b64 v[33:34], 2, v[32:33]
	v_mov_b32_e32 v35, s1
	v_add_u32_e32 v33, vcc, s0, v33
	v_addc_u32_e32 v34, vcc, v35, v34, vcc
	v_or_b32_e32 v35, 1, v32
	v_ashrrev_i32_e32 v36, 31, v35
	v_lshlrev_b64 v[35:36], 2, v[35:36]
	v_add_u32_e32 v35, vcc, s0, v35
	v_addc_u32_e32 v36, vcc, v37, v36, vcc
	flat_store_dword v[33:34], v31
	flat_store_dword v[35:36], v26
	v_or_b32_e32 v35, 2, v32
	v_ashrrev_i32_e32 v36, 31, v35
	v_lshlrev_b64 v[35:36], 2, v[35:36]
	v_mov_b32_e32 v26, s1
	v_add_u32_e32 v35, vcc, s0, v35
	v_addc_u32_e32 v36, vcc, v26, v36, vcc
	flat_store_dword v[35:36], v17
	v_or_b32_e32 v35, 3, v32
	v_ashrrev_i32_e32 v36, 31, v35
	v_lshlrev_b64 v[35:36], 2, v[35:36]
	v_mov_b32_e32 v17, s1
	v_add_u32_e32 v35, vcc, s0, v35
	v_addc_u32_e32 v36, vcc, v17, v36, vcc
	v_add_u32_e32 v33, vcc, 16, v33
	v_addc_u32_e32 v34, vcc, 0, v34, vcc
	v_add_u32_e32 v26, vcc, s2, v32
	flat_store_dword v[35:36], v12
	flat_store_dwordx4 v[33:34], v[27:30]
	v_mov_b32_e32 v12, s1
	v_ashrrev_i32_e32 v27, 31, v26
	v_lshlrev_b64 v[27:28], 2, v[26:27]
	v_add_u32_e32 v27, vcc, s0, v27
	v_addc_u32_e32 v28, vcc, v12, v28, vcc
	flat_store_dwordx4 v[27:28], v[22:25]
	s_nop 0
	v_add_u32_e32 v22, vcc, 16, v27
	v_addc_u32_e32 v23, vcc, 0, v28, vcc
	v_add_u32_e32 v17, vcc, s2, v26
	flat_store_dwordx4 v[22:23], v[18:21]
	s_nop 0
	v_ashrrev_i32_e32 v18, 31, v17
	v_lshlrev_b64 v[18:19], 2, v[17:18]
	v_or_b32_e32 v20, 1, v17
	v_ashrrev_i32_e32 v21, 31, v20
	v_add_u32_e32 v18, vcc, s0, v18
	v_addc_u32_e32 v19, vcc, v12, v19, vcc
	v_lshlrev_b64 v[20:21], 2, v[20:21]
	v_add_u32_e32 v20, vcc, s0, v20
	v_addc_u32_e32 v21, vcc, v12, v21, vcc
	flat_store_dword v[18:19], v9
	flat_store_dword v[20:21], v4
	v_add_u32_e32 v20, vcc, 8, v18
	v_addc_u32_e32 v21, vcc, 0, v19, vcc
	v_add_u32_e32 v12, vcc, 24, v18
	flat_store_dwordx4 v[20:21], v[13:16]
	v_mov_b32_e32 v4, s1
	v_addc_u32_e32 v13, vcc, 0, v19, vcc
	v_add_u32_e32 v9, vcc, s2, v17
	flat_store_dwordx2 v[12:13], v[10:11]
	v_ashrrev_i32_e32 v10, 31, v9
	v_lshlrev_b64 v[9:10], 2, v[9:10]
	v_add_u32_e32 v9, vcc, s0, v9
	v_addc_u32_e32 v10, vcc, v4, v10, vcc
	v_add_u32_e32 v4, vcc, 16, v9
	flat_store_dwordx4 v[9:10], v[5:8]
	s_nop 0
	v_addc_u32_e32 v5, vcc, 0, v10, vcc
	flat_store_dwordx4 v[4:5], v[0:3]
	s_endpgm
.Lfunc_end0:
	.size	gemm, .Lfunc_end0-gemm
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 5128
; NumSgprs: 28
; NumVgprs: 98
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 4096 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 24
; NumSGPRsForWavesPerEU: 28
; NumVGPRsForWavesPerEU: 98
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
      GroupSegmentFixedSize: 4096
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        28
      NumVGPRs:        98
      MaxFlatWorkGroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
