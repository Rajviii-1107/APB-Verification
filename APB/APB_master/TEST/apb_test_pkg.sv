 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master package class
 * File name: apb_mas_pkg.sv 
 ******************************************************************************/

 `ifndef APB_TEST_PKG
 `define APB_TEST_PKG
 `include "../MASTER_ENV/apb_defines.sv"
 `include "../SLAVE_ENV/apb_slave_define.sv"

 `include "../MASTER_ENV/apb_inf.sv"

package apb_test_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  //Master files
  `include "apb_mas_trans.sv"
  `include "apb_mas_drv.sv"
  `include "apb_mas_seqr.sv"
  `include "apb_mas_mon.sv"
  `include "apb_mas_agent.sv"
  `include "apb_mas_base_seqs.sv"

  //Slave files
  `include "apb_slave_trans.sv"
  `include "apb_slave_drv.sv"
  `include "apb_slave_monitor.sv"
  `include "apb_slave_seqr.sv"
  `include "apb_slave_agent.sv"
  `include "apb_slave_base_seqs.sv"
  `include "apb_env.sv"
  `include "apb_base_test.sv"
  
  //`include "apb_write_nowait_vseqs.sv";
  //`include "apb_write_nowait_test.sv";
endpackage
`endif
