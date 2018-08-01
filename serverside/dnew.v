`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:37 11/17/2017 
// Design Name: 
// Module Name:    dnew 
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
module dnew(input [7:0] p,
    input [7:0] q,
    input [7:0] e1,
    input clk,
	 input start,
	 output reg [15:0] n,
    output [15:0] d,
	 output finished
    );
	reg [47:0] A,B,C;
	reg [15:0] G;
	reg [15:0]e;
	
	wire [15:0]outResult,Q;
	Divider d2(A[15:0],B[15:0],outResult,remainder);
	assign Q=outResult;
	always@(posedge clk)
	begin
		if(start)
			begin
			e={8'b00000000,e1};
			n=p*q;
			G=(p-1)*(q-1);
			A={16'h001,16'h000,G};
			B={16'h000,16'h001,e};
			end
		else if(B[15:0]!=1)
	 //for(i=0;B[9:0]!=1;i=i+1)
	 begin
	 //Q=A[9:0]/B[9:0];
	 C[47:32]=A[47:32]-Q*B[47:32];
	 C[31:16]=A[31:16]-Q*B[31:16];
	 C[15:0]=A[15:0]-Q*B[15:0];
	 A=B;
	 B=C;
	 end
	 
	 end
assign d=B[31:16];

assign finished=B[15:0]==1;
endmodule
