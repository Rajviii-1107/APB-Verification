 /*******************************************************************************
 * Created on 24/07/2023
 * Updated on 24/07/2023
  * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master base virtual sequence
 * File name: apb_base_vseqs.sv 
 ******************************************************************************/

class apb_base_vseqs extends uvm_sequence #(uvm_sequence_item)

  `uvm_object_utils(apb_base_vseqs)

  apb_virtual_seqr vseqr_h;
  apb_virtual_seqr p_sequencer;

  apb_mas_seqr mas_seqr_h;

  function new(string name="apb_base_vseqs"0;
    super.new(name);
  endfunction

  task pre_body();
    if(!$cast(p_sequencer,m_sequencer));
      `uvm_fatal(get_full_name(),"virtual sequencer cast failed!");
      vseqr_h = p_sequencer.vseqr_h;
  endtask

  
endtask
