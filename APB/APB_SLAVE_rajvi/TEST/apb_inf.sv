`ifndef APB_INF
`define APB_INF

`include "apb_slv_define.sv"
interface apb_inf(input pclk,presetn);
  

  //signals for APB Master
  bit psel;
  bit penable;
  logic [(`ADDR_WIDTH-1):0]paddr;
  logic                    pwrite;
  logic [(`DATA_WIDTH-1):0]pwdata;
  
  //signals for APB Slave
  bit                      pready;
  bit                      pslverr;
  logic [(`DATA_WIDTH-1):0]prdata;
  
  //CLOCKING BLOCKS
  
  //MASTER MONITOR CLOCKING BLOCK
  clocking mas_mon_cb@(posedge pclk);
    default input #1 output #1;
    input presetn,penable,paddr,pwrite,pwdata,psel,pready,pslverr,prdata;
  endclocking 
  
  //MASTER DRIVER CLOCKING BLOCK
  clocking mas_drv_cb@(posedge pclk);
    default input #1 output #1;
    output psel,penable,paddr,pwrite,pwdata;
  endclocking

  //SLAVE MONITOR CLOCKING BLOCK
  clocking slv_mon_cb@(posedge pclk);
    default input #1 output #1;
    input psel,penable,paddr,pwrite,pwdata,prdata,presetn;
    output pready;
  endclocking
  
  //SLAVE DRIVER CLOCKING BLOCK
  clocking slv_drv_cb@(posedge pclk);
    default input #1 output #1;
    output pready,prdata,pslverr;
    input paddr,pwrite,psel,penable,pwdata,presetn;
  endclocking

  //Modports
  
  //MASTER driver modport
  modport MAS_DRV_MP(clocking mas_drv_cb);

  //MASTER monitor modport
  modport MAS_MON_MP(clocking mas_mon_cb);

  //SLAVE driver modport
  modport SLV_DRV_MP(input presetn,clocking slv_drv_cb);

  //SLAVE monitor modport
  modport SLV_MON_MP(input presetn,clocking slv_mon_cb);

// sequence seq(); 
endinterface
`endif


  



