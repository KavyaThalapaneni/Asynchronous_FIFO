`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 11:21:42
// Design Name: 
// Module Name: wptr_full
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


module wptr_full(input wclk,
                 input wrst_n,
                 input winc,
                 input [3:0]wq2_rptr,
                 output [2:0] waddr,
                 output reg wfull,
                 output reg [3:0] wptr

    );
  wire [3:0] wbin_next;
  wire wfull_next;
  wire [3:0] wptr_next;
  reg [3:0] wbin;
assign wfull_next =((wptr_next[3:2]==(~wq2_rptr[3:2])) & wptr_next[1:0]==(wq2_rptr[1:0]));
assign wbin_next =wbin+(winc&(~wfull));
assign waddr=wbin[2:0];
assign wptr_next=(wbin_next) ^(wbin_next>>1);
always @(posedge wclk or negedge wrst_n)
 begin
if(!wrst_n)
  begin
  wbin<=0;
  wfull<=0;
  wptr<=0;
  end
  else
  
  begin
      wfull <=wfull_next;
      
      wptr <=wptr_next;
      wbin <= wbin_next;
   end      
  end    
        
        
endmodule
