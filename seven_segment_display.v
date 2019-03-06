`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:26 02/25/2019 
// Design Name: 
// Module Name:    seven_segment_display 
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
module seven_segment_display(minutes, seconds, hundred_hz_clock, v0, v1, v2, v3
    );
    
    // Inputs
    input [5:0] minutes;
    input [5:0] seconds;
    input hundred_hz_clock;
  
    // Outputs
    output [6:0] v0;
    output [6:0] v1;
    output [6:0] v2;
    output [6:0] v3;
    // Registers
    wire [3:0] min0_temp;
    wire [3:0] min1_temp;
    wire [3:0] sec0_temp;
    wire [3:0] sec1_temp;

    reg [6:0] vec0;
    reg [6:0] vec1;
    reg [6:0] vec2;
    reg [6:0] vec3;
    reg clk;
    
    
    assign min1_temp = minutes / 10;
    assign min0_temp = minutes -  (10*min1_temp);
    
    assign sec1_temp = seconds / 10;
    assign sec0_temp = seconds - (10*sec1_temp);
    
    
    always @ (*)
    begin
        case (min0_temp)
            4'b0000: vec2 = 7'b1000000;
            4'b0001: vec2 = 7'b1111001;
            4'b0010: vec2 = 7'b0100100;
            4'b0011: vec2 = 7'b0110000;
            4'b0100: vec2 = 7'b0011001;
            4'b0101: vec2 = 7'b0010010;
            4'b0110: vec2 = 7'b0000010;
            4'b0111: vec2 = 7'b1111000;
            4'b1000: vec2 = 7'b0000000;
            4'b1001: vec2 = 7'b0010000;
            default: vec2 = 7'b1111111;
        endcase
        
        case (min1_temp)
            4'b0000: vec3 = 7'b1000000;
            4'b0001: vec3 = 7'b1111001;
            4'b0010: vec3 = 7'b0100100;
            4'b0011: vec3 = 7'b0110000;
            4'b0100: vec3 = 7'b0011001;
            4'b0101: vec3 = 7'b0010010;
            4'b0110: vec3 = 7'b0000010;
            4'b0111: vec3 = 7'b1111000;
            4'b1000: vec3 = 7'b0000000;
            4'b1001: vec3 = 7'b0010000;
            default: vec3 = 7'b1111111;
        endcase
        
        case (sec0_temp)
            4'b0000: vec0 = 7'b1000000;
            4'b0001: vec0 = 7'b1111001;
            4'b0010: vec0 = 7'b0100100;
            4'b0011: vec0 = 7'b0110000;
            4'b0100: vec0 = 7'b0011001;
            4'b0101: vec0 = 7'b0010010;
            4'b0110: vec0 = 7'b0000010;
            4'b0111: vec0 = 7'b1111000;
            4'b1000: vec0 = 7'b0000000;
            4'b1001: vec0 = 7'b0010000;
            default: vec0 = 7'b1111111;
        endcase
        
        case (sec1_temp)
            4'b0000: vec1 = 7'b1000000;
            4'b0001: vec1 = 7'b1111001;
            4'b0010: vec1 = 7'b0100100;
            4'b0011: vec1 = 7'b0110000;
            4'b0100: vec1 = 7'b0011001;
            4'b0101: vec1 = 7'b0010010;
            4'b0110: vec1 = 7'b0000010;
            4'b0111: vec1 = 7'b1111000;
            4'b1000: vec1 = 7'b0000000;
            4'b1001: vec1 = 7'b0010000;
            default: vec1 = 7'b1111111;
        endcase
    end
    assign v0 = vec0;
    assign v1 = vec1;
    assign v2 = vec2;
    assign v3 = vec3;
endmodule
