 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master Agent class
 * File name: apb_mas_agent.sv 
 ******************************************************************************/

//`ifndef APB_MAS_AGENT
//`define APB_MAS_AGENT

class apb_mas_agent extends uvm_agent;

  `uvm_component_utils(apb_mas_agent)

  apb_mas_drv drv_h;
  apb_mas_mon mon_h;
  apb_mas_seqr seqr_h;

  virtual apb_inf vif;

  function new(string name="",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  //Build Phase for agent, We are creating Monitor, driver, sequencer for
  //master
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);  
    `uvm_info(get_name(),"Build",UVM_MEDIUM);
    mon_h = apb_mas_mon::type_id::create("mon_h",this);
	  drv_h = apb_mas_drv::type_id::create("drv_h",this);
	  seqr_h = apb_mas_seqr::type_id::create("seqr_h",this);
		
    if (!uvm_config_db #(virtual apb_inf)::get(this,"","vif",vif))
	   `uvm_fatal(get_full_name(), "Not able to get virtual interface!") 
      //$display(" agent size:- %0d", size)	;	
  endfunction

  //Connect phase in which we will connect driver-sequencer
  function void connect_phase(uvm_phase phase);
    drv_h.seq_item_port.connect(seqr_h.seq_item_export);
  endfunction

endclass
//`endif


