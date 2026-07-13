vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xbip_utils_v3_0_15
vlib modelsim_lib/msim/mult_gen_v12_0_24
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/fifo_generator_v13_2_14

vmap xpm modelsim_lib/msim/xpm
vmap xbip_utils_v3_0_15 modelsim_lib/msim/xbip_utils_v3_0_15
vmap mult_gen_v12_0_24 modelsim_lib/msim/mult_gen_v12_0_24
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap fifo_generator_v13_2_14 modelsim_lib/msim/fifo_generator_v13_2_14

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../" \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_15  -93  \
"../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_24  -93  \
"../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../DataStreamTest.gen/sources_1/ip/multiplier_18x18/sim/multiplier_18x18.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -mfcu  "+incdir+../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../" \
"../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14  -93  \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -mfcu  "+incdir+../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../" \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../" \
"../../../DataStreamTest.gen/sources_1/ip/fifo_w256_8192_r32_65536/sim/fifo_w256_8192_r32_65536.v" \
"../../../DataStreamTest.gen/sources_1/ip/fifo_w32_2048_r256_256/sim/fifo_w32_2048_r256_256.v" \
"../../../DataStreamTest.gen/sources_1/ip/fifo_w16_256_r32_128/sim/fifo_w16_256_r32_128.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_std.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ddr3_256_32_mig_sim.v" \
"../../../DataStreamTest.gen/sources_1/ip/ddr3_256_32/ddr3_256_32/user_design/rtl/ddr3_256_32.v" \
"../../../ADC_input.v" \
"../../../DAC_output_scalable_HPF.v" \
"../../../MISO_phase_selector.v" \
"../../../RAM_bank.v" \
"../../../RAM_block.v" \
"../../../SDRAM_FIFO.v" \
"../../../ddr3_state_machine.v" \
"../../../digital_input_deserializer.v" \
"../../../mmcm_drp.v" \
"../../../okBTPipeOut.v" \
"../../../okCoreHarness.v" \
"../../../okLibrary.v" \
"../../../okTriggerIn.v" \
"../../../okWireIn.v" \
"../../../okWireOut.v" \
"../../../variable_freq_clk_generator.v" \
"../../../main.v" \

vlog -work xil_defaultlib \
"glbl.v"

