/*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Slave environment class
 * File name: apb_env.sv 
 ******************************************************************************/

`ifndef APB_ENV
`define APB_ENV

class apb_env extends uvm_env;

   //factory registration
  `uvm_component_utils(apb_env)

   //apb_mas_agent m_agent;
    apb_slv_agent slv_agent;

    //scoreboard handle
    apb_slv_sb sb_h;

    //monitor handle
    apb_slv_monitor mon_h;

    //constructor
   function new(string name="",uvm_component parent=null);
      super.new(name,parent);
   endfunction:new

   function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   `uvm_info(get_full_name(),"Build Phase of APB_ENV",UVM_MEDIUM);
    //m_agent = apb_mas_agent::type_id::create("m_agent",this);
    mon_h=apb_slv_monitor::type_id::create("mon_h",this);
    slv_agent = apb_slv_agent ::type_id::create("slv_agent",this);
    sb_h=apb_slv_sb::type_id::create("sb_h",this);
   endfunction

   function void connect_phase(uvm_phase phase);
     mon_h.slv_mon_ap.connect(sb_h.sb_imp);
   endfunction
endclass
`endif


