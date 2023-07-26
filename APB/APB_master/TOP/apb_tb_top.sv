import uvm_pkg::*;
 `include "uvm_macros.svh"


module apb_tb_top();
  import apb_test_pkg::*;
  bit presetn;
  bit pclk=0;
  apb_inf apb_if(pclk,presetn);
  
  always #5 pclk=~pclk;

  initial begin
 
    uvm_config_db #(virtual apb_inf)::set(null,"*","vif",apb_if);
    run_test("apb_base_test");
  end
  
  initial begin
   #1000ns;
  $finish;
  end

  initial begin
  presetn=0;
  #30;
  presetn=1;
  /*#20;
  presetn=1;
  #30;
  presetn=0;
  #15;
  presetn=1;
  #10;*/
  end

  /*initial begin
    #5;
    apb_if.pready=1;
    #115;
    apb_if.pready=0;
  end*/

endmodule
