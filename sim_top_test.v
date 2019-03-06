`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:29 03/04/2019
// Design Name:   sim_top
// Module Name:   C:/Users/152/Desktop/lab3.6/sim_top_test.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sim_top_test;

	// Inputs
	reg clk;
	reg pause;
	reg rst;
	reg adj;
	reg select;

	// Outputs
	wire [3:0] anode;
	wire [6:0] cathode;

	// Instantiate the Unit Under Test (UUT)
	sim_top uut (
		.clk(clk), 
		.pause(pause), 
		.rst(rst), 
		.adj(adj), 
		.select(select), 
		.anode(anode), 
		.cathode(cathode)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		pause = 0;
		rst = 0;
		adj = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

