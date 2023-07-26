 /*******************************************************************************
 * Created on 21/07/2023
 * Updated on 21/07/2023
  * Author: Ravi Kothiya <ravi.k@scaledge.io>
 * File : APB Master driver class
 * File name: apb_mas_drv.sv 
 ******************************************************************************/

`ifndef APB_MAS_DRV
`define APB_MAS_DRV

class apb_mas_drv extends uvm_driver #(apb_mas_trans);

  virtual apb_inf.MAS_DRV_MP mas_drv_vif;

  bit psel;
  bit penable;
  bit pwrite;
  bit [`ADDR_WIDTH-1:0]paddr;
  bit [`DATA_WIDTH-1:0]pwdata;

  `uvm_component_utils_begin(apb_mas_drv)
    `uvm_field_int(psel, UVM_PRINT)
    `uvm_field_int(penable, UVM_PRINT)
    `uvm_field_int(pwrite, UVM_PRINT)
    `uvm_field_int(paddr, UVM_PRINT)
    `uvm_field_int(pwdata, UVM_PRINT)
  `uvm_component_utils_end

  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
  endfunction
   
  //build phase for master drive
  function void build_phase(uvm_phase phase); 
   super.build_phase(phase);
  `uvm_info(get_name(),"Build Phase of APB_DRV",UVM_MEDIUM); 
    if (!uvm_config_db #(virtual apb_inf)::get(this,"","vif",mas_drv_vif))
	   `uvm_fatal(get_full_name(), "Not able to get virtual interface!") 
  endfunction

  //run phase consisting all driving logic from master
  task run_phase(uvm_phase phase);
  super.run_phase(phase);
   
   `uvm_info(get_name(),"Run Phase of APB_DRV",UVM_MEDIUM);
   wait(!mas_drv_vif.mas_drv_cb.presetn);
   wait(mas_drv_vif.mas_drv_cb.presetn);

      forever begin
      fork 
        begin
          wait(!mas_drv_vif.presetn);
        end

      forever begin
           seq_item_port.get_next_item(req);
           req.print();
            if(req!==null)
            begin
               drive_to_inf(req);
               assert_enable(req);                       //Asserting penable signal just after one posedge of psel high 
               deassert_enable(req);                     //When we get pready signal from slave side, after 1 clk cycle will deassert penable
               req.print();
               seq_item_port.item_done();
            end
      end
      join_any

      disable fork;
      @(posedge mas_drv_vif.mas_drv_cb ) begin
      mas_drv_vif.mas_drv_cb.psel <= 0;
      mas_drv_vif.mas_drv_cb.penable <= 0;
      mas_drv_vif.mas_drv_cb.pwrite <= 0;
      end

      wait(mas_drv_vif.presetn);
     end  
  endtask
 
  //Task: Signals to drive at interface 
  virtual task drive_to_inf(apb_mas_trans trans_h);
     begin
       mas_drv_vif.mas_drv_cb.psel   <= 1; 
       mas_drv_vif.mas_drv_cb.pwrite <= trans_h.pwrite;
       mas_drv_vif.mas_drv_cb.paddr  <= trans_h.paddr;
       mas_drv_vif.mas_drv_cb.pwdata <= trans_h.pwdata;
     end
  endtask
  
  //Task: To assert "penable" as per the protocol
  task assert_enable(apb_mas_trans trans_h);
		@(mas_drv_vif.mas_drv_cb);
    `uvm_info(get_name(),"assert of APB_DRV",UVM_MEDIUM); 
		mas_drv_vif.mas_drv_cb.penable <= 1;
  endtask

  //Task: To deassert enable after successful transfer of packet  
  task deassert_enable(apb_mas_trans trans_h);
    fork
    `uvm_info(get_name(),"Deassert of APB_DRV",UVM_MEDIUM); 
      wait(mas_drv_vif.mas_drv_cb.pready == 1);
      wait(mas_drv_vif.mas_drv_cb.pslverr == 1);
    join_any
    disable fork;
		@(mas_drv_vif.mas_drv_cb);
    mas_drv_vif.mas_drv_cb.penable <= 0;
  endtask

endclass
`endif
