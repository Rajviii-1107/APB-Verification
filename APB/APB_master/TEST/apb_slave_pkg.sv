///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slave_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_PKG
`define APB_SLV_PKG

`include "apb_inf.sv"
package apb_slave_pkg;

   import uvm_pkg::*;
  `include "uvm_macros.svh";

  `include "apb_slave_define.sv"
  `include "apb_slave_trans.sv"
  `include "apb_slave_base_seqs.sv"
  `include "apb_slave_drv.sv"
  `include "apb_slave_monitor.sv"
  `include "apb_slave_seqr.sv"
  `include "apb_slave_agent.sv"
  `include "apb_env.sv"

  `include "apb_base_test.sv"
endpackage
`endif
