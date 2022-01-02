`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 03:12:24 PM
// Design Name: 
// Module Name: KP_Voter
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


module KP_Voter(
    input IN_A,
    input IN_B,
    input IN_C,
    output Data_Out
    );
    wire N1,N2,N3,P;
    assign N1 =IN_A ^ IN_B;
    assign N2 =IN_B ^ IN_C;
    assign N3 =~ N2;
    assign P =N1 & N3;
    
    MUX_2X1 V1(.IN_A(IN_C),.IN_B(IN_A),.S(P),.OUT(Data_Out));
    
endmodule
