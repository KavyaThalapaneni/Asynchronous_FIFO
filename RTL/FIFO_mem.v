`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 10:57:27
// Design Name: 
// Module Name: FIFO_mem
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


module FIFO_mem(input[31:0] wdata,
                input wclken,
                input[2:0] waddr,
                input [2:0] raddr,
                output [31:0] rdata,
                input wclk

    );
reg [31:0] memory[7:0];
always @(posedge wclk )
      begin
      if(wclken)
        memory[waddr]<=wdata;
       end
assign rdata = memory[raddr]  ;     
endmodule
