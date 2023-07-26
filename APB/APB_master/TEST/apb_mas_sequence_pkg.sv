 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master package class
 * File name: apb_mas_pkg.sv 
 ******************************************************************************/

 `ifndef APB_MAS_PKG
 `define APB_MAS_PKG

 `include "apb_defines.sv";
 `include "apb_inf.sv"

package apb_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
   
  
  `include "apb_mas_trans.sv";
  `include "apb_mas_drv.sv";
  `include "apb_mas_seqr.sv";
  `include "apb_mas_mon.sv";
  `include "apb_mas_agent.sv";
  `include "apb_mas_base_seqs.sv";

  `include "apb_env.sv";
  `include "apb_base_test.sv";

  `
endpackage
`endif
