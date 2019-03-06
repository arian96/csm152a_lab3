`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:30 02/25/2019 
// Design Name: 
// Module Name:    counter 
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
module counter(deb_pause, deb_rst, one_hz_clock, two_hz_clock,
   select, adj, seconds, minutes);
   
   // Inputs
   input one_hz_clock, two_hz_clock;
   input deb_pause, deb_rst, select, adj;
   
   // Outputs
   output [5:0] seconds, minutes;
     
   // Registers
   reg [5:0] minutes_temp = 6'b000000;
   reg [5:0] seconds_temp = 6'b000000;
   reg is_pause = 0;
   reg adj_clk;
   
   always @ (posedge deb_pause)
   begin
    is_pause <= ~is_pause;
   end
   
   always @ (*)
   begin
       if (adj)
        adj_clk = two_hz_clock;
       else
        adj_clk = one_hz_clock;
    end
   
   
   always @ (posedge adj_clk or posedge deb_rst)
   begin
      if (deb_rst)
        begin
        seconds_temp <= 6'b000000;
        minutes_temp <= 6'b000000;
        end
      else
        begin
        if (~is_pause)
            begin
            if (adj)
                begin
                if (select)
                    begin
                    if (seconds_temp >= 59)
                        seconds_temp <= 6'b000000;
                    else
                        seconds_temp <= seconds_temp + 2;
                    end
                 else
                    begin
                    if (minutes_temp >= 59)
                        minutes_temp <= 6'b000000;
                    else
                        minutes_temp <= minutes_temp + 2;
                    end
                 end
             else
                begin
                if(seconds_temp >= 59)
                begin
                    if(minutes_temp >= 59)
                    begin
                        seconds_temp <= 59;
                        minutes_temp <= 59;
                    end
                    else
                    begin
                        seconds_temp <= 0;
                        minutes_temp <= minutes_temp + 1;
                    end 
                end
                else
                    seconds_temp <= seconds_temp + 1;
                
                /*if (seconds_temp == 59 && seconds_temp == 59)
                    begin
                    seconds_temp <= 6'b0;
                    minutes_temp <= 6'b0;
                    end
                else if (minutes_temp != 59 && seconds_temp == 59)
                    begin
                    minutes_temp <= minutes_temp + 6'b1;
                    seconds_temp <= 6'b000000;
                    
                    end
                else
                    seconds_temp <= seconds_temp + 6'b1;
                */
                end
           end
           else
           begin
                seconds_temp <= seconds_temp;
                minutes_temp <= minutes_temp;
           end
       end   
   end
assign seconds = seconds_temp;
assign minutes = minutes_temp;
   
endmodule
