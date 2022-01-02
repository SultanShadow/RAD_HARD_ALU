`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 11:38:43 AM
// Design Name: 
// Module Name: RP_Add_Sub_4bit
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


module RP_Add_Sub_4bit( IN_A,IN_B,MODE, OUT_SUM,OUT_COUT );
input  [3:0]IN_A,IN_B;
input MODE;
output  [3:0] OUT_SUM;
output OUT_COUT;

wire [3:0] IN_B_INV,IN_B_Selected;
assign IN_B_INV[0] = ~IN_B[0];
assign IN_B_INV[1] = ~IN_B[1];
assign IN_B_INV[2] = ~IN_B[2];
assign IN_B_INV[3] = ~IN_B[3];

MUX_2X1 dataSel0(.IN_A(IN_B_INV[0]),.IN_B(IN_B[0]),.S(MODE),.OUT(IN_B_Selected[0]));
MUX_2X1 dataSel1(.IN_A(IN_B_INV[1]),.IN_B(IN_B[1]),.S(MODE),.OUT(IN_B_Selected[1]));
MUX_2X1 dataSel2(.IN_A(IN_B_INV[2]),.IN_B(IN_B[2]),.S(MODE),.OUT(IN_B_Selected[2]));
MUX_2X1 dataSel3(.IN_A(IN_B_INV[3]),.IN_B(IN_B[3]),.S(MODE),.OUT(IN_B_Selected[3]));

RPA_4bit rp1(.IN_A(IN_A), .IN_B(IN_B_Selected), .IN_CIN(MODE),.OUT_SUM(OUT_SUM),.OUT_COUT(OUT_COUT));

endmodule
