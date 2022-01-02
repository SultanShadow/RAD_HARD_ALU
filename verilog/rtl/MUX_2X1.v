`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 11:44:04 AM
// Design Name: 
// Module Name: MUX_2X1
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


module MUX_2X1(

input IN_A,
input IN_B,
input S,
output reg OUT);

    always@(S,IN_A,IN_B)
    begin
        if(S)
            OUT <= IN_A;
        else
            OUT <= IN_B;
    end
    
endmodule

