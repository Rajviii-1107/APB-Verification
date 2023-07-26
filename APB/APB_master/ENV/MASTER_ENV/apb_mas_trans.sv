 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master transaction class
 * File name: apb_imas_trans.sv 
 ******************************************************************************/

//`ifndef APB_MAS_TRANS
//`define APB_MAS_TRANS

class apb_mas_trans extends uvm_sequence_item;

  rand bit [`ADDR_WIDTH-1:0]paddr;
  rand bit                  psel;
  rand bit                  penable;
  rand bit                  pwrite;
  rand bit [`DATA_WIDTH-1:0]pwdata;
       bit [`DATA_WIDTH-1:0]prdata;
       bit                  pready;
       bit                  pslverr;

  //factory registration for all signals and apb_mas_trans class
  `uvm_object_utils_begin(apb_mas_trans)
    `uvm_field_int(paddr,UVM_ALL_ON | UVM_NOPACK)
    `uvm_field_int(psel,UVM_ALL_ON | UVM_NOPACK)
    `uvm_field_int(penable,UVM_ALL_ON | UVM_NOPACK)
    `uvm_field_int(pwrite,UVM_ALL_ON | UVM_NOPACK)
    `uvm_field_int(pwdata,UVM_ALL_ON | UVM_NOPACK)
   `uvm_object_utils_end

   function new(string name= "");
    super.new(name);
   endfunction

endclass
//`endif
