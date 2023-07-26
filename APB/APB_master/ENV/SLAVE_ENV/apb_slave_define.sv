
//address width:32 bit
`ifndef  ADDR_WIDTH 
`define  ADDR_WIDTH 32
`endif

//clock period
`ifndef APB_CLOCK_CYCLE_NS 
`define APB_CLOCK_CYCLE_NS 10ns
`endif

//data width : 8
`ifndef DATA_WIDTH
`define DATA_WIDTH 8
`endif

//max delay
`ifndef MAX_DELAY
`define MAX_DELAY 0ns
`endif

//min delay
`ifndef MIN_DELAY
`define MIN_DELAY 0ns
`endif

//depth 16
`ifndef DEPTH
`define DEPTH 16
`endif

//clocking block signals
`ifndef DRV_CB
`define DRV_CB vif.slv_drv_cb
`endif

