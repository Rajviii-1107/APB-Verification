///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slv_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

class apb_slv_sb extends uvm_scoreboard;
   `uvm_component_utils(apb_slv_sb)
   
  apb_slv_trans trans_h;
  uvm_analysis_imp #(apb_slv_trans,apb_slv_sb) sb_imp;


 function new(string name="",uvm_component parent);
   super.new(name,parent);
   sb_imp=new("sb_imp",this);
 endfunction 

 function void build_phase (uvm_phase phase);
   trans_h=apb_slv_trans::type_id::create("trans_h",this);
 endfunction

 function void write(apb_slv_trans trans_h);
    //trans_h.copy(trans_h);
    trans_h.print();
 endfunction


endclass
