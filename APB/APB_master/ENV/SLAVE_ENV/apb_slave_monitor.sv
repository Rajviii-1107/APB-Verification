///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slave_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_MONITOR
`define APB_SLV_MONITOR

class apb_slave_monitor  extends uvm_monitor;

   //factory registration	
   `uvm_component_utils(apb_slave_monitor)

   //virtual interface handle 
   virtual apb_inf vif;

   //analysis port for broadcast
   uvm_analysis_port #(apb_slave_trans) slv_mon_ap;

   apb_slave_trans trans_h;

   //constructor
   function new(string name="",uvm_component parent=null);
     super.new(name,parent);
     slv_mon_ap=new("slv_mon_ap",this);
   endfunction

   function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    trans_h=apb_slave_trans::type_id::create("trans_h");
     `uvm_info(get_full_name(),"APB_SLV_MON:build_phase",UVM_MEDIUM)
   endfunction
   
   function void connect_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_MON:connect_phase",UVM_MEDIUM)
   endfunction

   function void end_of_elaboration_phase (uvm_phase phase);
	   `uvm_info(get_full_name(),"APB_SLV_MON:end of elaboration phase",UVM_MEDIUM)
   endfunction

   function void start_of_simulation_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_MON:start of simulation phase",UVM_MEDIUM)
   endfunction
   
   task run_phase(uvm_phase phase);
     `uvm_info(get_name(),"APB_SLV_MON:RUN PHASE inside run phase",UVM_HIGH)
     forever @(vif.slv_mon_cb) begin
     mon_apb_data();
     end
   endtask
  
   virtual task mon_apb_data();
    `uvm_info(get_name(),"APB_SLV_MON:RUN PHASE inside run phase",UVM_HIGH)
     if(vif.slv_mon_cb.presetn) begin
     trans_h.psel    = vif.slv_mon_cb.psel;
     trans_h.penable = vif.slv_mon_cb.penable;
     trans_h.pready  = vif.slv_mon_cb.pready;
     trans_h.paddr   = vif.slv_mon_cb.paddr;
     trans_h.pwdata  = vif.slv_mon_cb.pwdata;
     trans_h.pwrite  = vif.slv_mon_cb.pwrite;
     trans_h.pready  = vif.slv_mon_cb.pready;
     trans_h.prdata  = vif.slv_mon_cb.prdata;
     end
    `uvm_info(get_name(),"APB_SLV_MON:RUN PHASE inside run phase",UVM_HIGH)
   endtask

   function void extract_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_MON:extract phase",UVM_MEDIUM)
   endfunction

   function void check_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_MON:check phase",UVM_MEDIUM)
   endfunction
   
   function void report_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_MON:report phase",UVM_MEDIUM)
   endfunction

   function void final_phase (uvm_phase phase);
     `uvm_info(get_full_name(),"APB_SLV_MON:final phase",UVM_MEDIUM)
   endfunction
endclass

`endif
