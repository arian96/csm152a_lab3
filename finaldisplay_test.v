`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:20:22 03/04/2019
// Design Name:   final_display
// Module Name:   C:/Users/152/Desktop/lab3.6/finaldisplay_test.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: final_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module finaldisplay_test;

	// Inputs
	reg blink_hz;
	reg hundred_hz_clock;
	reg select;
	reg adj;
	reg [6:0] vec0;
	reg [6:0] vec1;
	reg [6:0] vec2;
	reg [6:0] vec3;

	// Outputs
	wire [6:0] cathode;
	wire [3:0] anode;

	// Instantiate the Unit Under Test (UUT)
	final_display uut (
		.blink_hz(blink_hz), 
		.hundred_hz_clock(hundred_hz_clock), 
		.select(select), 
		.adj(adj), 
		.vec0(vec0), 
		.vec1(vec1), 
		.vec2(vec2), 
		.vec3(vec3), 
		.cathode(cathode), 
		.anode(anode)
	);

	initial begin
		// Initialize Inputs
		blink_hz = 0;
		hundred_hz_clock = 0;
		select = 1;
		adj = 1;
		vec0 = 0;
		vec1 = 0;
		vec2 = 0;
		vec3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        vec0 = 2;
		vec1 = 0;
		vec2 = 0;
		vec3 = 0;
        
        #100;
        vec0 = 4;
		vec1 = 0;
		vec2 = 0;
		vec3 = 0;
       
		// Add stimulus here

	end
    always #100 blink_hz = ~blink_hz;
    always #5 hundred_hz_clock = ~hundred_hz_clock;
endmodule

