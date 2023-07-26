/*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : TEST- APB Write with no wait Virtual sequence
 * File name: apb_write_nowait_test.sv 
 ******************************************************************************/

 class apb_write_nowait_test extends apb_base_test;

  `uvm_component_utils(apb_write_nowait_test);
  
  //apb_write_nowait_vseqs vseqs_h;
  apb_mas_seqr seqs_h;

  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction

  function build_phase(uvm_phase phase);
    super.build_phase(phase);
    vseqs_h=apb_write_nowait_test::type_id::create("vseqs_h",this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    vseqs_h.start(seqs_h);
    phase.drop_obejction(this);
  endtask

endclass

