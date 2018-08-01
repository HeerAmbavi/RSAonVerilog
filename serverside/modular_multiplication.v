`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:33 11/17/2017 
// Design Name: 
// Module Name:    modularmult 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module modularmult(input [15:0]M,
input [15:0]e,
input [15:0]n,
//input [7:0]A,
//input [2:0]B,
input start,
input clk,
output finished,
output reg[31:0]Mpower,
output [15:0] remainder
    );
//clkdivider c1(clk,reset,slowclk);
//reg [15:0] n;
//reg [7:0] e;
reg [15:0] ncount;
reg [31:0]x,n1;

Divider32 d1(x,n1,outResult,remainder);
//always@B
//	begin
//		if(B==3'b001)
//			e=A;
//		else if(B==3'b010)
//			n[7:0]=A;
//		else if(B==3'b100)
//			n[15:8]=A;
//	end
always @(posedge clk)
begin
		  if(start) begin
                ncount = e-1;
					 Mpower = M;
					 x=0;
					 n1={16'b0000000000000000,n};
        end
        else if(!finished) 
		  begin
					 Mpower = remainder * M;
                //Mpower = Mpower * M;
					 ncount = ncount - 1;
        end
		  x=Mpower;
end


//Division d(Mpower,n,finished,clk,remainder);
assign finished = (ncount == 0)?1:0;

endmodule

