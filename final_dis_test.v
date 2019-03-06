`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:35 02/27/2019
// Design Name:   final_display
// Module Name:   C:/Users/152/Desktop/lab3.4/final_dis_test.v
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

module final_dis_test;

	// Inputs
	reg blink_hz;
	reg hundred_hz_clock;
	reg select;
	reg adj;

    reg [6:0]vec0; 
    reg [6:0]vec1; 
    reg [6:0]vec2; 
    reg [6:0]vec3;

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
		select = 0;
		adj = 0;
		vec0 = 0;
		vec1 = 0;
		vec2 = 0;
		vec3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        blink_hz = 4;
        hundred_hz_clock = 400;
        select=0;
        adj=0;
        vec0 = 7'b1111001;
        vec1 = 7'b0011001;
        vec2 = 7'b1111001;
        vec3 = 7'b1111001;
        
		// Add stimulus here

	end
    always 
    begin
        #0.1 hundred_hz_clock = ~hundred_hz_clock;
    end    
    
endmodule

