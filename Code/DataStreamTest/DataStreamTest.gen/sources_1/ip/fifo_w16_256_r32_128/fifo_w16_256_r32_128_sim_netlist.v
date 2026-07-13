// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Jun 15 15:14:51 2026
// Host        : LAPTOP-H85DCTKA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/olivi/Documents/Universite
//               Laval/Maitrise/DataStreamTest/DataStreamTest.gen/sources_1/ip/fifo_w16_256_r32_128/fifo_w16_256_r32_128_sim_netlist.v}
// Design      : fifo_w16_256_r32_128
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_w16_256_r32_128,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module fifo_w16_256_r32_128
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid,
    wr_data_count,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output [7:0]wr_data_count;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [15:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire valid;
  wire wr_clk;
  wire [7:0]wr_data_count;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [7:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [6:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "8" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "1" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "253" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "252" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "7" *) 
  (* C_RD_DEPTH = "128" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "7" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "8" *) 
  (* C_WR_DEPTH = "256" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "8" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_w16_256_r32_128_fifo_generator_v13_2_14 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[7:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[6:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(wr_data_count),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "8" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "soft" *) (* xpm_cdc = "GRAY" *) 
module fifo_w16_256_r32_128_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [7:0]src_in_bin;
  input dest_clk;
  output [7:0]dest_out_bin;

  wire \<const0> ;
  wire [7:0]async_path;
  wire [6:1]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[1] ;
  wire [7:1]\^dest_out_bin ;
  wire [6:0]gray_enc;
  wire src_clk;
  wire [7:0]src_in_bin;

  assign dest_out_bin[7:1] = \^dest_out_bin [7:1];
  assign dest_out_bin[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[2]),
        .O(binval[1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(\^dest_out_bin [1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(\^dest_out_bin [2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(\^dest_out_bin [3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(\^dest_out_bin [4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(\^dest_out_bin [5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(\^dest_out_bin [6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [7]),
        .Q(\^dest_out_bin [7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[7]),
        .Q(async_path[7]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "soft" *) (* xpm_cdc = "GRAY" *) 
module fifo_w16_256_r32_128_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "soft" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_w16_256_r32_128_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "soft" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_w16_256_r32_128_xpm_cdc_single__1
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "soft" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_w16_256_r32_128_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "soft" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_w16_256_r32_128_xpm_cdc_sync_rst__1
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 122688)
`pragma protect data_block
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
VPUb2vZp1V2A9liAV0BCkTInaWxfsjF2
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
