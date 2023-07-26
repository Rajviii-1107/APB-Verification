/*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master environment class
 * File name: apb_mas_env.sv 
 ******************************************************************************/

//`ifndef APB_ENV
//`define APB_ENV
import uvm_pkg::*;
`include "uvm_macros.svh"
class apb_env extends uvm_env;

  `uvm_component_utils(apb_env)

   apb_mas_agent m_agent;
   apb_slave_agent s_agent;

   function new(string name="",uvm_component parent=null);
      super.new(name,parent);
   endfunction:new

   function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   `uvm_info(get_name(),"Build Phase of APB_ENV",UVM_MEDIUM);
    m_agent = apb_mas_agent::type_id::create("m_agent",this);
    s_agent = apb_slave_agent::type_id::create("s_agent",this);
   endfunction
endclass
//`endif


