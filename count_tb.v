`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:38:32 03/04/2019
// Design Name:   counter
// Module Name:   C:/Users/152/Desktop/lab3.6/count_tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module count_tb;

	// Inputs
	reg deb_pause;
	reg deb_rst;
	reg one_hz_clock;
	reg two_hz_clock;
	reg select;
	reg adj;

	// Outputs
	wire [5:0] seconds;
	wire [5:0] minutes;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.deb_pause(deb_pause), 
		.deb_rst(deb_rst), 
		.one_hz_clock(one_hz_clock), 
		.two_hz_clock(two_hz_clock), 
		.select(select), 
		.adj(adj), 
		.seconds(seconds), 
		.minutes(minutes)
	);

	initial begin
		// Initialize Inputs
		deb_pause = 0;
		deb_rst = 0;
		one_hz_clock = 0;
		two_hz_clock = 0;
		select = 1;
		adj = 1;

        
		// Add stimulus here

	end
    always #5 one_hz_clock = ~one_hz_clock;
    
    always #10 two_hz_clock = ~two_hz_clock;
      
endmodule

