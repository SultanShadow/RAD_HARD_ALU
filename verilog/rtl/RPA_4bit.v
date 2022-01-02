`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 11:14:11 AM
// Design Name: 
// Module Name: RPA_4bit
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


module RPA_4bit( IN_A,IN_B,IN_CIN, OUT_SUM,OUT_COUT );
input  [3:0]IN_A,IN_B;
input IN_CIN;
output  [3:0] OUT_SUM;
output OUT_COUT;

wire C1,C2,C3;

F_Adder fa0(.IN_A(IN_A[0]), .IN_B(IN_B[0]), .IN_CIN(IN_CIN),.OUT_SUM(OUT_SUM[0]),.OUT_COUT(C1));
F_Adder fa1(.IN_A(IN_A[1]), .IN_B(IN_B[1]), .IN_CIN(C1),    .OUT_SUM(OUT_SUM[1]),.OUT_COUT(C2));
F_Adder fa2(.IN_A(IN_A[2]), .IN_B(IN_B[2]), .IN_CIN(C2),    .OUT_SUM(OUT_SUM[2]),.OUT_COUT(C3));
F_Adder fa3(.IN_A(IN_A[3]), .IN_B(IN_B[3]), .IN_CIN(C3),    .OUT_SUM(OUT_SUM[3]),.OUT_COUT(OUT_COUT));

endmodule
