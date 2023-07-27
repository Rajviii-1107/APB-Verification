///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slv_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_BASE_SEQS
`define APB_SLV_BASE_SEQS

class apb_slv_base_seqs  extends uvm_sequence #(apb_slv_trans);

   //factory registration
   `uvm_object_utils(apb_slv_base_seqs)

   //constructor
   function new(string name="");
      super.new(name);
   endfunction

   //trans class handle
   apb_slv_trans trans_h;

   task body();
     `uvm_info(get_name(),"APB_SLV_SEQR:BODY inside body",UVM_HIGH)
     repeat(3) begin
      `uvm_do(trans_h);
      `uvm_info(get_name(),"APB_SLV_SEQR:BODY exiting from body",UVM_HIGH)
     end	
   endtask
endclass

`endif
