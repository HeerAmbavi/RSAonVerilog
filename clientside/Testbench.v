`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:10:29 11/18/2017
// Design Name:   Modularmult
// Module Name:   F:/ISE/Modularmult/t22.v
// Project Name:  Modularmult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Modularmult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t22;

	// Inputs
	reg [7:0] M;
	reg [7:0] A;
	reg [2:0] B;
	reg start;
	reg clk;

	// Outputs
	wire finished;
	wire [15:0] Mpower;
	wire [15:0] remainder;

	// Instantiate the Unit Under Test (UUT)
	Modularmult uut (
		.M(M), 
		.A(A), 
		.B(B), 
		.start(start), 
		.clk(clk), 
		.finished(finished), 
		.Mpower(Mpower), 
		.remainder(remainder)
	);

	initial begin
		// Initialize Inputs
		M = 0;
		A = 0;
		B = 0;
		start = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      M = 11;
		A = 5;			//A=e;
		B = 3'b001;
		start = 0;
		#100;
		A = 8'b11011111;				//A=n;
		B = 3'b010;
		start = 0;
		#100;
		A = 8'b00001101;				//A=n;
		B = 3'b100;
		start = 1;
		#100;
		start = 0;
        
		// Add stimulus here

	end
       always #20 clk=!clk;
      
endmodule

