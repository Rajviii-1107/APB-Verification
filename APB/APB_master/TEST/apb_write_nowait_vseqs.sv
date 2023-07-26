 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
 * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Write with no wait Virtual sequence
 * File name: apb_write_nowait_vseqs.sv 
 ******************************************************************************/

 class apb_write_nowait_vseqs extends apb_base_vseqs;

  `uvm_object_utils(apb_write_nowait_vseqs)

  apb_write_nowait_seqs write_nowait_seqs_h;

  function new(string name = "write_nowait_vseqs_h");
    super.new(name);
  endfunction

  /*task body();
    write_nowait_seqs_h=apb_write_nowait::type_id::create("write_nowait_vseqs_h");
    void'(write_nowait_seqs_h.randomize());
    write_nowait_seqs_h.start(mas_seqr_h);
  endtask*/
endclass
