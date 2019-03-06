`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:13 02/25/2019 
// Design Name: 
// Module Name:    final_display 
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
module final_display(blink_hz, hundred_hz_clock, select, adj, vec0, vec1, vec2, vec3,
               cathode, anode);
    
    // Inputs
    input blink_hz, hundred_hz_clock, select, adj; 
    input [6:0]vec0; 
    input [6:0]vec1; 
    input [6:0]vec2; 
    input [6:0]vec3;
    
    // Outputs
    output [6:0] cathode; 
    output [3:0] anode;
    
    // Registers
    reg [1:0] seg_case = 2'b00;
    reg [6:0] cathode_temp;
    reg [3:0] anode_temp;
    
    always @ (posedge hundred_hz_clock)
    begin
        if(seg_case == 0)
        begin
            seg_case <= seg_case + 2'b01;
            anode_temp <= 4'b0111; 
            // min1
            if(adj)
            begin
                if(!select) 
                begin
                    if(blink_hz)
                        cathode_temp <= vec3;
                    else
                        cathode_temp <= 7'b1111111;
                end
                else
                    cathode_temp <= vec3;
            end // endif(adj sel)
            else
                cathode_temp <= vec3;
        end // end if case = 0
        
        else if (seg_case == 1)
        begin
            seg_case <= seg_case + 2'b01;
            anode_temp <= 4'b1011;
            // min0
            if(adj)
            begin
                if(!select) 
                begin
                    if(blink_hz)
                        cathode_temp <= vec2;
                    else
                        cathode_temp <= 7'b1111111;
                end
                else
                    cathode_temp <= vec2;
            end // endif(adj sel)
            else
                cathode_temp <= vec2;
        end // end if case = 1
       
       else if(seg_case == 2)
        begin
            seg_case <= seg_case + 2'b01;
            anode_temp <= 4'b1101;
            // sec1
            if(adj)
            begin
                if(select) 
                begin
                    if(blink_hz)
                        cathode_temp <= vec1;
                    else
                        cathode_temp <= 7'b1111111;
                end
                else
                    cathode_temp <= vec1;
            end // endif(adj sel)
            else
                cathode_temp <= vec1;
        end // end if case = 2
        
        
        else if (seg_case == 3)
        begin
            seg_case <= seg_case + 2'b01;
            anode_temp <= 4'b1110;
            // sec0
            if(adj)
            begin
                if(select) 
                begin
                    if(blink_hz)
                        cathode_temp <= vec0;
                    else
                        cathode_temp <= 7'b1111111;
                end
                else
                    cathode_temp <= vec0;
            end // endif(adj sel)
            else
                cathode_temp <= vec0;
        end // end if case =3
    end // end always

assign cathode = cathode_temp;
assign anode = anode_temp;

endmodule
