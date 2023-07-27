///////////////////////////////
//Name:-Rajvi Padaria
//Company:- Scaledge
//Project name:- APB_SLV
//Last upadted on:- 21/07/2023
///////////////////////////////

`ifndef APB_SLV_TRANS
`define APB_SLV_TRANS

class apb_slv_trans extends uvm_sequence_item;

   //declaring signals needed to be randomized
   bit psel,penable;
   logic [(`DATA_WIDTH-1):0]        pwdata;          //to drive write data
       bit [(`DATA_WIDTH-1):0]     prdata;          //to drive read data
   logic [(`ADDR_WIDTH-1):0]        paddr;           //to drive address
   bit                              pwrite;          //to control transcation of read/write
   bit                              pready;          //to ack master

/*   integer delay;
   min_delay  = `SLV_MIN_DELAY;
   max_delay  = `SLV_MAX_DELAY;

   SEL seen
   delay_d = $urandom_range(MIN,MAX);
   #(delay) pready <=1;
*/

   //field macros to utilize uvm built-in methods
   `uvm_object_utils_begin(apb_slv_trans)
    `uvm_field_int(pwdata,UVM_ALL_ON)
    `uvm_field_int(prdata,UVM_ALL_ON)
    `uvm_field_int(paddr ,UVM_ALL_ON)
    `uvm_field_int(pwrite,UVM_ALL_ON)
    //`uvm_field_int(pready,UVM_ALL_ON)
   `uvm_object_utils_end

   //create the object
   function new(string name="");
    super.new(name);    
   endfunction : new

endclass
`endif
