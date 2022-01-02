`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 11:04:43 AM
// Design Name: 
// Module Name: F_Adder
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


module F_Adder( IN_A,IN_B,IN_CIN, OUT_SUM,OUT_COUT );
input  IN_A,IN_B,IN_CIN;
output  OUT_SUM, OUT_COUT;

wire X,Y,Z;
H_Adder h1(.IN_A(IN_A), .IN_B(IN_B), .OUT_SUM(X), .OUT_COUT(Y));
H_Adder h2(.IN_A(X), .IN_B(IN_CIN), .OUT_SUM(OUT_SUM), .OUT_COUT(Z));
or or_1(OUT_COUT,Z,Y);


endmodule
