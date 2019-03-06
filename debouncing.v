`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:37 02/20/2019 
// Design Name: 
// Module Name:    debouncing 
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
module debouncing( pause_btn, rst_btn, debounced_pause, debounced_rst, hundred_clock
    );

    // Inputs
    input hundred_clock, pause_btn, rst_btn;

    // Outputs
    output debounced_pause, debounced_rst;

    // Wires
    wire debounced_pause, debounced_rst;
    wire hundred_clock, pause_btn, rst_btn;

    // Registers
    reg [2:0] step_d_pause; 
    reg [2:0] step_d_rst;

    always @ (posedge hundred_clock) begin
    step_d_pause[2:0] <= {pause_btn, step_d_pause[2:1]};
    step_d_rst[2:0] <= {rst_btn, step_d_rst[2:1]};
    end
    
    assign debounced_pause = ~ step_d_pause[0] & step_d_pause[1];
    assign debounced_rst = ~ step_d_rst[0] & step_d_rst[1];

endmodule

