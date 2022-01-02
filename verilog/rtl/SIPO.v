`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2021 11:09:59 PM
// Design Name: 
// Module Name: SIPO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIPO #(parameter SIZE = 35)
 (
    input data_in,
    input clk,
    input rst,
    //input DataType,
    input Start_data,
    output reg [SIZE-1:0] Data_out_Config,
    output reg load_data
    
    );
 //   parameter ConfigData = 1'b1, UserData = 1'b0;
    reg [SIZE:0] temp_data;
    reg [5:0] counter;
    reg FirsEntryCheck = 1'b1;
always@(posedge clk)
begin
     if(rst)
     begin
            Data_out_Config <=35'd0;
            counter <= 6'd0;
            load_data<=1'b0;
            FirsEntryCheck <= 1'b1;
            temp_data <= 35'd0;
     end
     else
        begin
        if(FirsEntryCheck)
         begin
           FirsEntryCheck <= 1'b0;
          counter <= 6'd0;
        end
         else;
         if(Start_data)
         begin
         temp_data[counter] <= data_in;
         counter <= counter+1;
          load_data <=1'b0;           
         end        
         else;       
         if(counter == 35)
         begin
            Data_out_Config <= temp_data[34:0];
            counter <= 6'd0;
            load_data <=1'b1;
            FirsEntryCheck <= 1'b1;
        end
        else
        begin
            Data_out_Config <= Data_out_Config;
        end   
end
    end         
endmodule
