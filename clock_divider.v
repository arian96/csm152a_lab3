`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:29 02/20/2019 
// Design Name: 
// Module Name:    clock_divider 
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
module clock_divider( clk, rst, one_hz_clock, two_hz_clock, blink_clock, hundred_hz_clock
    );

	// Inputs
	input clk, rst;

	// Clock Outputs
	output one_hz_clock, two_hz_clock, blink_clock, hundred_hz_clock;
	
	// Temporary Registers for clock outputs
	reg one_hz_temp = 0;
	reg two_hz_temp = 0;
	reg blink_temp = 0;
	reg hundred_hz_temp = 0;

	// Clock counter registers
	reg [26:0] oneHz_counter = 27'd0;
	reg [25:0] twoHz_counter = 26'd0;
	reg [24:0] blinkHz_counter = 25'd0;
	reg [24:0] hundredHz_counter = 25'd0;


	 always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            oneHz_counter <= 32'b0;
            one_hz_temp <= 1'b0;
        end
        else if (oneHz_counter == 32'd50000000 - 32'b1) begin
            oneHz_counter <= 32'b0;
            one_hz_temp <= ~one_hz_clock;
        end
        else begin
            oneHz_counter <= oneHz_counter + 32'b1;
            one_hz_temp <= one_hz_clock;
        end
    end
    // 2 Hz Clock Implementation
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            twoHz_counter <= 32'b0;
            two_hz_temp <= 1'b0;
        end
        else if (twoHz_counter == 32'd25000000 - 32'b1) begin
            twoHz_counter <= 32'b0;
            two_hz_temp <= ~two_hz_clock;
        end
        else begin
            twoHz_counter <= twoHz_counter + 32'b1;
            two_hz_temp <= two_hz_clock;
        end
    end
    // Fast (400 Hz) Clock Implementation
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            hundredHz_counter <= 32'b0;
            hundred_hz_temp <= 1'b0;
        end
        else if (hundredHz_counter == 32'd125000 - 32'b1) begin
            hundredHz_counter <= 32'b0;
            hundred_hz_temp <= ~hundred_hz_clock;
        end
        else begin
            hundredHz_counter <= hundredHz_counter + 32'b1;
            hundred_hz_temp <= hundred_hz_clock;
        end
    end
    // Blink (4 Hz) Clock Implementation
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            blinkHz_counter <= 32'b0;
            blink_temp <= 1'b0;
        end
        else if (blinkHz_counter == 32'd12500000 - 32'b1) begin
            blinkHz_counter <= 32'b0;
            blink_temp <= ~blink_clock;
        end
        else begin
            blinkHz_counter <= blinkHz_counter + 32'b1;
            blink_temp <= blink_clock;
        end
    end

	
	assign one_hz_clock = one_hz_temp;
	assign two_hz_clock = two_hz_temp;
	assign blink_clock = blink_temp;
	assign hundred_hz_clock = hundred_hz_temp;

endmodule
