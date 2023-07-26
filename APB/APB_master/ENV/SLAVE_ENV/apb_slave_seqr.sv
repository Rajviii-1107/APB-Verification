///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slave_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_SEQR
`define APB_SLV_SEQR
	
class apb_slave_seqr extends uvm_sequencer #(apb_slave_trans);
   
   //factory registratiom
   `uvm_component_utils(apb_slave_seqr)

   //constructor
   function new(string name="",uvm_component parent=null);
     super.new(name,parent);
   endfunction


endclass
`endif
