import uvm_pkg::*;
`include "uvm_macros.svh"
`include "fifo_interface.sv"
`include "fifo_test.sv"

module tb;
  bit clk=0;
  bit rstn;
  
  always #5 clk = ~clk;
  
  initial begin
    @(posedge clk)
    rstn = 0;
    #5;
    rstn = 1;
  end
  
  fifo_interface tif(clk, rstn);
  
   SYN_FIFO dut(.clk(tif.clk),
               .reset(tif.rstn),
               .data_in(tif.i_wrdata),
               .wr(tif.i_wren),
               .rd(tif.i_rden),
               .full(tif.o_full),
               .empty(tif.o_empty),
//                .almost_full(tif.o_alm_full),
//                .almost_empty(tif.o_alm_empty),
               .data_out(tif.o_rddata));
  
  initial begin
    uvm_config_db#(virtual fifo_interface)::set(null, "", "vif", tif);
   
    run_test("fifo_test");
  
  end
  initial begin
     $dumpfile("dump.vcd"); 
    $dumpvars;
 
  end
  
endmodule