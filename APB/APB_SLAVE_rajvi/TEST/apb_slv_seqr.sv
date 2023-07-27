///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slv_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_SEQR
`define APB_SLV_SEQR
	
class apb_slv_seqr extends uvm_sequencer #(apb_slv_trans);
   
   //factory registratiom
   `uvm_component_utils(apb_slv_seqr)

   //constructor
   function new(string name="",uvm_component parent=null);
     super.new(name,parent);
   endfunction


endclass
`endif
