 /********************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master base test class
 * File name: apb_base_test.sv 
 *********************************************/

 `ifndef APB_BASE_TEST
 `define APB_BASE_TEST

 class apb_base_test extends uvm_test;
   
   //factory registration
  `uvm_component_utils(apb_base_test)

  //evn instance
  apb_env env_h;

  //sequence handle
  apb_slave_base_seqs  seqs_h;

  //constructor
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
  env_h=apb_env::type_id::create("env_h",this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"END OF ELABORATION PHASE of BASE_TEST",UVM_MEDIUM);
    uvm_top.print_topology();
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"BASE_TEST:Inside run phase before rasie objection",UVM_MEDIUM);
     phase.raise_objection(this);
    `uvm_info(get_full_name(),"BASE_TEST:Inside run phase after raise objection",UVM_MEDIUM);
    `uvm_info(get_full_name(),"RUN PHASE of BASE_TEST",UVM_MEDIUM);
     seqs_h=apb_slave_base_seqs::type_id::create("seqs_h");
    `uvm_info(get_full_name(),"BASE_TEST:Inside run phase after seq created",UVM_MEDIUM);
     seqs_h.start(env_h.slv_agent.seqr_h);
    `uvm_info(get_full_name(),"BASE_TEST:Inside run phase after seqs has started",UVM_MEDIUM);
     #500ns;
    phase.drop_objection(this);
    `uvm_info(get_full_name(),"BASE_TEST:Inside run phase after drop objection",UVM_MEDIUM);
  endtask

endclass

`endif
