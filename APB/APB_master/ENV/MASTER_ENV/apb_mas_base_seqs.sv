 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master base sequence class
 * File name: apb_mas_base_seqs.sv 
 ******************************************************************************/

`ifndef APB_MAS_BASE_SEQS
`define APB_MAS_BASE_SEQS

class apb_mas_base_seqs extends uvm_sequence #(apb_mas_trans);

  `uvm_object_utils_begin(apb_mas_base_seqs)
  `uvm_object_utils_end


  function new(string name="");
    super.new(name);
  endfunction
 
  apb_mas_trans trans_h;
  
  task body();
    repeat(1)begin
    `uvm_do(trans_h)
    end
  endtask

endclass
`endif
