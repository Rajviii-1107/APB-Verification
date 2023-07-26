 /*******************************************************************************
 * Created on 26/07/2023
 * Updated on 26/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master Monitor
 * File name: apb_mas_mon.sv 
 ******************************************************************************/

`ifndef APB_MAS_MON
`define APB_MAS_MON

class apb_mas_mon extends uvm_monitor;
  
  //Taking interface using modports for master monitor
  virtual apb_inf.MAS_MON_MP mas_mon_vif;
  
  //factory registration for Master monitor
  `uvm_component_utils(apb_mas_mon)
  
  //Assigning handle to Master transaction class
  apb_mas_trans req;

  //Analysis port to send the data to scoreboard
  uvm_analysis_port #(apb_mas_trans) analysis_port;

  //constructor "new"
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
  endfunction:new
  
  //getting Interface to "apb_mas_mon" using build_phase
  function void build_phase(uvm_phase phase);
   super.build_phase(phase); 
   if (!uvm_config_db #(virtual apb_inf)::get(this,"","vif",mas_mon_vif))
	   `uvm_fatal(get_full_name(), "Not able to get virtual interface!") 
  endfunction
  
  //To get and send the data packet
  task run_phase(uvm_phase phase);
    `uvm_info(get_name(),"Run Phase of APB_MAS_MON",UVM_MEDIUM);
    monitor_apb_data(req);
    analysis_port.write(req);
  endtask
  
  //Task: To sample data from interface
  virtual task monitor_apb_data(apb_mas_trans req);
  @(mas_mon_vif.mas_mon_cb);
    req.penable <= mas_mon_vif.mas_mon_cb.penable;
    req.pwrite  <= mas_mon_vif.mas_mon_cb.pwrite;
    req.pwdata  <= mas_mon_vif.mas_mon_cb.pwdata;
    req.pready  <= mas_mon_vif.mas_mon_cb.pready;
    req.pslverr <= mas_mon_vif.mas_mon_cb.pslverr;
    req.prdata  <= mas_mon_vif.mas_mon_cb.prdata;
  endtask

endclass
`endif
