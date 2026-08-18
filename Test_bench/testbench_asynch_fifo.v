`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 17:14:58
// Design Name: 
// Module Name: testbench_asynch_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_asynch_fifo(

    );
    asynch_fifo dut ( .wdata(wdata),
                    .winc(winc),
                    .rinc(rinc),
                     .wclk(wclk),
                    .wrst_n(wrst_n),
                    .rst_n(rst_n),
                    .rclk(rclk),
                    .rdata(rdata),
                    .rempty(rempty),
                    .wfull(wfull)

    );
    reg [31:0] wdata;
reg winc;
reg rinc;
reg wclk;
reg rclk;
reg wrst_n;
reg rst_n;

wire [31:0] rdata;
wire rempty;
wire wfull;
   integer i;
  initial
      begin
      wclk=0;
   forever #5 wclk=~wclk;
    end
   initial
      begin
      rclk=0;
    forever #7 rclk=~rclk;
    end 
     initial
     begin
     
     wrst_n=0;
     rst_n=0;
     rinc=0;
     winc=0;
     #20;
     wrst_n=1;
     rst_n=1;
    
      winc=1;
   for(i=0;i<30;i=i+1)
     begin  
    #10; wdata=i+1;
     end
     #200;
     $finish;
     end
  initial
    begin
  #100;  rinc=1;
    end   
    
endmodule
