 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master Monitor
 * File name: apb_mas_mon.sv 
 ******************************************************************************/

`ifndef APB_MAS_MON
`define APB_MAS_MON

class apb_mas_mon extends uvm_monitor;

  virtual apb_inf.MAS_MON_MP mas_mon_vif;

  `uvm_component_utils(apb_mas_mon)

  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   
   if (!uvm_config_db #(virtual apb_inf)::get(this,"","vif",mas_mon_vif))
	   `uvm_fatal(get_full_name(), "Not able to get virtual interface!") 
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info(get_name(),"Run Phase of APB_MAS_MON",UVM_MEDIUM);
    monitor_apb_data();
  endtask
  
  virtual task monitor_apb_data();

  endtask

endclass
`endif
