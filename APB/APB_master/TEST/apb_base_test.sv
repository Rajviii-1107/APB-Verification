 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master base test class
 * File name: apb_base_test.sv 
 ******************************************************************************/

 `ifndef APB_BASE_TEST
 `define APB_BASE_TEST

 class apb_base_test extends uvm_test;

  `uvm_component_utils(apb_base_test)

  apb_env env_h;
  apb_mas_base_seqs seqs_h;
  apb_slave_base_seqs sseqs_h;
  
  
  function new(string name="apb_base_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction:new
  
  function void build_phase(uvm_phase phase);
  env_h=apb_env::type_id::create("env_h",this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    `uvm_info(get_name(),"END OF ELABORATION PHASE of BASE_TEST",UVM_MEDIUM);
    uvm_top.print_topology();
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_name(),"RUN PHASE of BASE_TEST",UVM_MEDIUM);
    phase.raise_objection(this);
    seqs_h = apb_mas_base_seqs::type_id::create("seqs_h");
    sseqs_h=apb_slave_base_seqs::type_id::create("sseqs_h");
    fork 
      seqs_h.start(env_h.m_agent.seqr_h);
      sseqs_h.start(env_h.s_agent.seqr_h);
    join_any
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,40);
  endtask

endclass
`endif
