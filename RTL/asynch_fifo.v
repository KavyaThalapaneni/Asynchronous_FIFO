`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 10:56:52
// Design Name: 
// Module Name: asynch_fifo
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


module asynch_fifo( input [31:0] wdata,
                    input winc,rinc,
                    input wclk,
                    input wrst_n,rst_n,
                    input rclk,
                    output [31:0] rdata,
                    output rempty,
                    output wfull

    );
 
  wire wclken;
  assign wclken=winc &(~wfull);
  FIFO_mem F1(.wdata(wdata),
               .wclken(wclken),
                .waddr(waddr),
                .raddr(raddr),
                .rdata(rdata),
                .wclk(wclk)

    );  
    wire [2:0] waddr;

    wire [3:0] wptr;
    wptr_full W1(.wclk(wclk),
                 .wrst_n(wrst_n),
                 .winc(winc),
                 .wq2_rptr(wq2_rptr),
                 .waddr(waddr),
                 .wfull(wfull),
                  .wptr(wptr)

    );
    wire [2:0] raddr;

    wire [3:0] rptr;
    rptr_empty R1(.rclk(rclk),
                 .rst_n(rst_n),
                 .rinc(rinc),
                 .rq2_wptr(rq2_wptr),
                 .raddr(raddr),
                 .rempty(rempty),
                  .rptr(rptr)

    );
    
 synchroniser sync_w2r(  .A(wptr),
                      .reset(rst_n),
                       .pointer(rq2_wptr),
                      .clk(rclk)
    );   
   wire [3:0]wq2_rptr; 
   wire [3:0] rq2_wptr;
  synchroniser sync_r2w(  .A(rptr),
                      .reset(wrst_n),
                       .pointer(wq2_rptr),
                      .clk(wclk)
    );   
      
    
    
    
endmodule
