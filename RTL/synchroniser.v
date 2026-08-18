`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 16:20:27
// Design Name: 
// Module Name: synchroniser
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


module synchroniser( input [3:0] A,
                      input reset,
                      output reg [3:0] pointer,
                      input clk
    );
 reg [3:0] intermediate;
 always @(posedge clk or negedge reset)
 if(!reset)
 begin
      intermediate<=0;
      pointer<=0;
   end   
        else
 begin
      intermediate<=A;
      pointer<=intermediate;
   end   
         
endmodule
