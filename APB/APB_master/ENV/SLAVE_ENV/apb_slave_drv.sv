///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//File name=:apb_slave_drv
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_DRV
`define APB_SLV_DRV

//typedef vif.slv_drv_cb DRV_CB;

class apb_slave_drv extends uvm_driver #(apb_slave_trans);
   

   //factory registration
   `uvm_component_utils(apb_slave_drv)

   //instance of virtual instance
   virtual apb_inf vif;

    bit pready;          //to ack master
    int delay;         //delay for asserting pready

   //slave memory
   bit[`ADDR_WIDTH-1:0] mem [(`DEPTH-1):0];

   //trans class handle
   apb_slave_trans trans_h;

   //constructor
   function new(string name="",uvm_component parent=null);
     super.new(name,parent);
   endfunction : new

   function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(),"APB_DRV:build_phase",UVM_MEDIUM)
   endfunction

   function void connect_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_DRV:connect_phase",UVM_MEDIUM)
   endfunction

   function void end_of_elaboration_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_DRV:end of elaboration phase",UVM_MEDIUM)
   endfunction

   function void start_of_simulation_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_DRV::start of simulation phase",UVM_MEDIUM)
   endfunction

   task run_phase(uvm_phase phase);
    forever begin
    // fork
      //begin
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE waiting for reset assert",UVM_MEDIUM)
     if(!vif.presetn) begin
	     rst_initialize();
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE after initialize",UVM_MEDIUM)
     end
    // end
    // forever begin
     else begin
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE Inside forever ",UVM_MEDIUM) 
	wait(vif.presetn);
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE Before get next item ",UVM_MEDIUM) 
	seq_item_port.get_next_item(trans_h);
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE After get next item  ",UVM_MEDIUM) 
	trans_h.print();
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE Before drive  apb data  ",UVM_MEDIUM) 
	drive_apb_data(trans_h);
     `uvm_info(get_name(),"SLV_DRV:RUN PHASE Before item done",UVM_MEDIUM) 
	seq_item_port.item_done();
	end
    // end
      //join_any
      //disable fork;
      @(vif.slv_drv_cb) wait(vif.presetn);
     end
   endtask

   function void extract_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_DRV:extract phase",UVM_MEDIUM)
   endfunction
  
   function void check_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_DRV:check_phase",UVM_MEDIUM)
   endfunction

   function void report_phase(uvm_phase phase);
     `uvm_info(get_full_name(),"APB_DRV:check_phase",UVM_MEDIUM)
   endfunction

   function void final_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"APB_DRV:check_phase",UVM_MEDIUM)
   endfunction

   virtual task drive_apb_data(apb_slave_trans trans_h);
    
     `uvm_info(get_name(),"SLV_DRV: DRIVING SIG Inside drive_apb_data ",UVM_HIGH) 

	wait(vif.presetn);
        wait(vif.slv_drv_cb.psel);
     `uvm_info(get_name(),$sformatf("SLV_DRV: DRIVING SIG after wait paddr=%h pwrite=%b psel=%b",`DRV_CB.paddr,vif.slv_drv_cb.pwrite,vif.slv_drv_cb.psel),UVM_HIGH) 

      delay=$urandom_range(`MIN_DELAY,`MAX_DELAY);
     `uvm_info(get_name(),"SLV_DRV: DRIVE SIG  PREADY to be driven ",UVM_HIGH) 
      #delay vif.slv_drv_cb.pready <=1'b1;
      // vif.slv_drv_cb.pready <= trans_h.pready;

     `uvm_info(get_name(),"SLV_DRV: DRIVE SIG PREADY driven  ",UVM_HIGH) 
        @(vif.slv_drv_cb)
     if(vif.slv_drv_cb.penable==1 && vif.slv_drv_cb.pwrite==1) begin  
        mem[vif.slv_drv_cb.paddr] <= vif.slv_drv_cb.pwdata;
	
	@(posedge vif.slv_drv_cb)
	vif.slv_drv_cb.pready <=1'b0;
	//vif.psel <=1'b0;
	vif.pwrite <=1'b0;
	vif.paddr <=1'b0;
	vif.pwdata <=1'b0;

     end

     if(vif.slv_drv_cb.penable==1 && vif.slv_drv_cb.pwrite==0) begin
       `uvm_info(get_name(),"SLV_DRV: For read condition READY TO BE DRIVEN ",UVM_HIGH) 
       `uvm_info(get_name(),"SLV_DRV:AFTER PREADY assert ",UVM_HIGH) 
        vif.slv_drv_cb.prdata <= mem[vif.slv_drv_cb.paddr];  
         vif.slv_drv_cb.prdata <= trans_h.prdata;

	@(posedge vif.slv_drv_cb)
	vif.slv_drv_cb.pready <= 1'b0;
       // vif.penable <= 1'b0;

        @(posedge vif.slv_drv_cb)
        `uvm_info(get_name(),"SLV_DRV: Before PREADY deassert ",UVM_HIGH) 
        vif.slv_drv_cb.pready <= 1'b0;
       // vif.pwrite <= 1'b0;
        vif.paddr <= 1'b0;
        vif.pwdata <= 1'b0;
     //   vif.psel <= 1'b0;
        `uvm_info(get_name(),"SLV_DRV:AFTER PREADY deassert ",UVM_HIGH) 
        end
   endtask

   task rst_initialize();
    begin
     vif.penable = 1'b0;
     vif.paddr   = 1'b0;
     vif.pwrite  = 1'b0;
     vif.pwdata  = 1'b0;
  //   vif.penable = 1'b0;
     end
   endtask
endclass
`endif
