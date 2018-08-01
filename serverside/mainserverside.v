`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:56:20 11/17/2017 
// Design Name: 
// Module Name:    Main 
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
module Main(
    input [15:0] M,
    //input [7:0] A,
	 input [7:0]p,
	 input [7:0]q,
	 input clk,
    input start,
	 input start1,
	 input start2,
	 output [7:0]e,
	 output [15:0]n,
//    input [2:0] outsel,
//    input [1:0] insel,
//	 output [7:0] B
	 output [15:0]remainder,
	 output [15:0] d,
	 output finish,
	 output fin1
    );
	 //p(8) and q(8) take through A by insel
	 //first n(16) and e(16) has to be generated to be transferred to client
	 //then C will be taken as input from the server
//	 reg [7:0] p,q,e;
		
	 		 //reg [15:0] n,d;
//	 reg [15:0]d1;
	 keygen k1 (p,q,start,clk,e,finish);
	 dnew kd1 (p,q,e,clk,start1,n,d,fin1);
	 modularmult m1 (M,d,n,start2,clk,finished,Mpower,remainder);

//	 always @ insel
//		case(insel)
//		2'b01:p=a;
//		2'b10:q=a;
//		endcase
//	 always @ outsel	
//		case(outsel)
//		3'b001:b=e;
//		3'b010:b=n[7:0];
//		3'b100:b=n[15:8];
//		endcase
	 
	 
endmodule
