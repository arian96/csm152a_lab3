`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:23:32 02/27/2019
// Design Name:   seven_segment_display
// Module Name:   C:/Users/152/Desktop/lab3.4/seg_test.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_segment_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seg_test;

	// Inputs
	reg [5:0] minutes;
	reg [5:0] seconds;
	reg hundred_hz_clock;

	// Outputs
	wire [6:0] vec0;
	wire [6:0] vec1;
	wire [6:0] vec2;
	wire [6:0] vec3;

	// Instantiate the Unit Under Test (UUT)
	seven_segment_display uut (
		.minutes(minutes), 
		.seconds(seconds), 
		.hundred_hz_clock(hundred_hz_clock), 
		.vec0(vec0), 
		.vec1(vec1), 
		.vec2(vec2), 
		.vec3(vec3)
	);

	initial begin
		// Initialize Inputs
		minutes = 0;
		seconds = 0;
		hundred_hz_clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        minutes = 35;
        seconds = 24;
        
        
		// Add stimulus here

	end
      
endmodule

