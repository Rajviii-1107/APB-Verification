 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master Sequencer class
 * File name: apb_mas_seqr.sv 
 ******************************************************************************/

`ifndef APB_MAS_SEQR
`define APB_MAS_SEQR

class apb_mas_seqr extends uvm_sequencer #(apb_mas_trans);

  `uvm_component_utils(apb_mas_seqr)
  
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
  endfunction:new

endclass
`endif
