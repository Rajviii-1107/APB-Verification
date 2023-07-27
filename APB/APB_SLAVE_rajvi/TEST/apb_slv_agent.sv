///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slv_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_AGENT
`define APB_SLV_AGENT

class apb_slv_agent extends uvm_agent;
   
   //factory registration
   `uvm_component_utils(apb_slv_agent)

   //constructor
   function new(string name="",uvm_component parent=null);
      super.new(name,parent);
   endfunction

   //virtual iinterafce handle
   virtual apb_inf vif;

   //instance for components inside agent
   apb_slv_drv      drv_h;
   apb_slv_monitor  mon_h;
   apb_slv_seqr     seqr_h;

   function void build_phase(uvm_phase phase);
     drv_h=apb_slv_drv ::type_id::create("drv_h",this);
     mon_h=apb_slv_monitor ::type_id::create("mon_h",this);
     seqr_h=apb_slv_seqr ::type_id::create("seqr_h",this);

     if(!uvm_config_db #(virtual apb_inf)::get(this,"","vif",vif))
	`uvm_fatal(get_full_name(),"NO HANDLE OF VIRTUAL INTERFACE RECEIVED SLV AGENT")
   endfunction

   function void connect_phase(uvm_phase phase);
     drv_h.seq_item_port.connect(seqr_h.seq_item_export);
     drv_h.vif=vif;
     //mon_h.vif=vif;
   endfunction

   function void end_of_elaboration_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_AGNT:start of end of elaboration phase",UVM_MEDIUM)
   endfunction

   function void start_of_simulation_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_AGNT:start of simulation phase",UVM_MEDIUM)
   endfunction

 /*  task run_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_AGNT:RUN PHASE inside run phase",UVM_MEDIUM)
   endtask
*/
   function void extract_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_AGNT:start of extract phase",UVM_MEDIUM)
   endfunction

   function void check_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_AGNT:start of check phase",UVM_MEDIUM)
   endfunction

   function void final_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_AGNT:start of final phase",UVM_MEDIUM)
   endfunction
endclass
`endif 
