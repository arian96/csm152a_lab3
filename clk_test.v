`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:48:09 02/27/2019
// Design Name:   clock_divider
// Module Name:   C:/Users/152/Desktop/lab3.4/clk_test.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_test;

	// Inputs
	reg clk;

	// Outputs
	wire one_hz_clock;
	wire two_hz_clock;
	wire blink_clock;
	wire hundred_hz_clock;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clk(clk), 
		.one_hz_clock(one_hz_clock), 
		.two_hz_clock(two_hz_clock), 
		.blink_clock(blink_clock), 
		.hundred_hz_clock(hundred_hz_clock)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
        
		// Add stimulus here
        

	end
    
    always @ (posedge clk)
    begin
    #5
    clk = 1000;
    
    end
      
endmodule

