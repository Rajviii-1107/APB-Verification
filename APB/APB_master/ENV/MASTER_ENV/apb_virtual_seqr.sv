 /*******************************************************************************
 * Created on 24/07/2023
 * Updated on 24/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Virtual sequencer
 * File name: apb_virtual_seqr.sv 
 ******************************************************************************/

 class apb_virtual_seqr extends uvm_sequencer #(uvm_sequence_item);

  `uvm_component_utils(apb_virtual_seqr);

  function new(string name="apb_virtual_seqr",uvm_component parent);
    super.new(name);
  endfunction

  apb_mas_seqr mas_seqr_h;

endclass

