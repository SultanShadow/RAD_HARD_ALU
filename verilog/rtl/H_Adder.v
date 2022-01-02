`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 11:08:29 AM
// Design Name: 
// Module Name: H_Adder
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


module H_Adder( IN_A,IN_B, OUT_SUM, OUT_COUT );
input  IN_A,IN_B;
output  OUT_SUM, OUT_COUT;

xor xor_1 (OUT_SUM,IN_A,IN_B);
and and_1 (OUT_COUT,IN_A,IN_B);

endmodule
