`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:54 03/04/2019
// Design Name:   sim_top
// Module Name:   C:/Users/152/Desktop/lab3.6/top_tb.v
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

module top_tb;

	// Inputs
	reg clk;
	reg one_hz_clock;
	reg two_hz_clock;
	reg blink_clock;
	reg hundred_hz_clock;
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
		.one_hz_clock(one_hz_clock), 
		.two_hz_clock(two_hz_clock), 
		.blink_clock(blink_clock), 
		.hundred_hz_clock(hundred_hz_clock), 
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
		one_hz_clock = 0;
		two_hz_clock = 0;
		blink_clock = 0;
		hundred_hz_clock = 0;
		pause = 0;
		rst = 0;
		adj = 1;
		select = 1;

		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
    always #1 clk = ~clk;
    always #100 one_hz_clock = ~one_hz_clock;
    always #50 two_hz_clock = ~two_hz_clock;
	always #25 blink_clock = ~blink_clock;
	always #5 hundred_hz_clock = ~hundred_hz_clock;
      
endmodule

