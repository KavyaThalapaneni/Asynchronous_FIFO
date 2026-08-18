`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 15:57:40
// Design Name: 
// Module Name: rptr_empty
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


module rptr_empty( input rclk,
input rst_n,
input rinc,
input [3:0] rq2_wptr,
output reg [3:0] rptr,
output reg rempty,
output[2:0] raddr 

    );
reg [3:0] rbin;
wire [3:0] rbin_next,rptr_next;
wire rempty_next;
assign rempty_next=(rq2_wptr==rptr_next);
assign rptr_next=rbin_next ^(rbin_next>>1);
assign rbin_next=rbin+(rinc &(~rempty));
assign raddr=rbin[2:0];
always @(posedge rclk or negedge rst_n)
begin
if(!rst_n)
begin
   rempty<=1;
   rbin<=0;
   rptr<=0;
   end
else
begin
   rempty<=rempty_next;
   rbin<=rbin_next;
   rptr<=rptr_next;
   end
end










endmodule
