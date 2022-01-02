`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 11:21:25 AM
// Design Name: 
// Module Name: RPA_16bit
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


module RPA_16bit( IN_A,IN_B,MODE, OUT_SUM,OUT_COUT );
input  [15:0]IN_A,IN_B;
input MODE;
output  [15:0] OUT_SUM;
output OUT_COUT;

wire C1,C2,C3;

RP_Add_Sub_4bit rp1(.IN_A(IN_A[3:0]), .IN_B(IN_B[3:0]), .MODE(MODE),.OUT_SUM(OUT_SUM[3:0]),.OUT_COUT(C1));
RP_Add_Sub_4bit rp2(.IN_A(IN_A[7:4]), .IN_B(IN_B[7:4]), .MODE(C1),    .OUT_SUM(OUT_SUM[7:4]),.OUT_COUT(C2));
RP_Add_Sub_4bit rp3(.IN_A(IN_A[11:8]), .IN_B(IN_B[11:8]), .MODE(C2),    .OUT_SUM(OUT_SUM[11:8]),.OUT_COUT(C3));
RP_Add_Sub_4bit rp4(.IN_A(IN_A[15:12]), .IN_B(IN_B[15:12]), .MODE(C3),    .OUT_SUM(OUT_SUM[15:12]),.OUT_COUT(OUT_COUT));
endmodule
