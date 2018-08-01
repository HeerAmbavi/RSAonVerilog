`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:30 11/17/2017 
// Design Name: 
// Module Name:    divider32 
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
module Divider32(A,B,Res,remainder);

    //the size of input and output ports of the division module is generic.
    parameter WIDTH = 32;
    //input and output ports.
    input [WIDTH-1:0] A;
    input [WIDTH-1:0] B;
    output [WIDTH-1:0] Res;
	 output reg [WIDTH-1:0] remainder;
    //internal variables    
    reg [WIDTH-1:0] Res = 0;
    reg [WIDTH-1:0] a1,b1;
    reg [WIDTH:0] p1;      
	 reg [7:0]remainderL;	 //		oneBit= 0;
    integer i;

    always@ (A or B)
    begin
        //initialize the variables.
        a1 = A;		//operand1
        b1 = B;		//operand2
        p1= 0;			//oneBit
        for(i=0;i < WIDTH;i=i+1)    begin //start the for loop
            p1 = {p1[WIDTH-2:0],a1[WIDTH-1]};
            a1[WIDTH-1:1] = a1[WIDTH-2:0];
            p1 = p1-b1;
            if(p1[WIDTH-1] == 1)    begin
                a1[0] = 0;			//operand2
                p1 = p1 + b1;   end	//onebit=onebit+operand1
            else
                a1[0] = 1;
        end
        Res = a1;   
		  {remainderL,remainder} = p1;
	 
	 end 

endmodule
