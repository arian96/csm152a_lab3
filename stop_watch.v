`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:23 02/25/2019 
// Design Name: 
// Module Name:    stop_watch 
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
module stop_watch(clk, pause, rst, adj, select, anode, cathode
    );

    // Inputs
    input clk, pause, rst, adj, select;
    
    // Outputs
    output [3:0] anode; 
    output [6:0] cathode;
    
    // Wires for clock_divider
    wire one_hz_clock;
    wire two_hz_clock;
    wire blink_clock;
    wire hundred_hz_clock;
    // Wires for deboucing
    wire deb_rst; // output
    wire deb_pause; // output
    // Wires for counting output
    wire [5:0] minutes_top;
    wire [5:0] seconds_top;
    // Wires for sev_seg
    wire [6:0] vec0;
    wire [6:0] vec1;
    wire [6:0] vec2;
    wire [6:0] vec3;
    
    clock_divider clk_div(.clk(clk), .rst(rst),
        .one_hz_clock(one_hz_clock), .two_hz_clock(two_hz_clock), 
        .blink_clock(blink_clock), .hundred_hz_clock(hundred_hz_clock));
    
    debouncing debouncer(.pause_btn(pause), .rst_btn(rst), 
        .debounced_pause(deb_pause), .debounced_rst(deb_rst), .hundred_clock(hundred_hz_clock));
    
    counter counting(.deb_pause(deb_pause), .deb_rst(deb_rst), 
        .one_hz_clock(one_hz_clock), .two_hz_clock(two_hz_clock),
        .select(select), .adj(adj), .seconds(seconds_top), .minutes(minutes_top));
    
    seven_segment_display seg_display(.minutes(minutes_top), .seconds(seconds_top), 
        .hundred_hz_clock(hundred_hz_clock), .v0(vec0), .v1(vec1), .v2(vec2), .v3(vec3));

    final_display f_dis (.blink_hz(blink_clock), .hundred_hz_clock(hundred_hz_clock), 
        .select(select), .adj(adj), .vec0(vec0), .vec1(vec1), .vec2(vec2), .vec3(vec3), 
        .cathode(cathode), .anode(anode)); 
endmodule
