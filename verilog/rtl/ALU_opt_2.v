`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2021 02:12:36 PM
// Design Name: 
// Module Name: ALU_opt_2
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


module ALU_opt_2(
 input  [15:0] IN_A_2,  //src1
    input  [15:0] IN_B_2,  //src2
    input  [2:0] OPCODE_2, //function sel
    input  DataReady_2,
    output reg [15:0] OUT_ALU_2,  //result 
    output reg [14:0] OUT_ALU_MUL_2,  //result 
    output reg COUT_2
    
    );
    
    wire MODE;
    wire [15:0] OUT_SUM,OUT_SUB;
    wire [30:0] OUT_MUL;
    wire OUT_COUT,OUT_COUT1;
 
 RPA_16bit Rp_add(.IN_A(IN_A_2), .IN_B(IN_B_2), .MODE(1'b0),.OUT_SUM(OUT_SUM),.OUT_COUT(OUT_COUT));
 RPA_16bit Rp_sub(.IN_A(IN_A_2), .IN_B(IN_B_2), .MODE(1'b1),.OUT_SUM(OUT_SUB),.OUT_COUT(OUT_COUT1));
 BOOTH_16BIT_SIGN Mul(.multiplier(IN_A_2),.multiplicand(IN_B_2),.product(OUT_MUL));
 always @(*)
begin
if(DataReady_2)
begin 
 case(OPCODE_2)
 3'b000: begin    
            OUT_ALU_2 = OUT_SUM; // add
            COUT_2 = OUT_COUT;
            OUT_ALU_MUL_2 = 15'bz;
         end
 3'b001: begin
            OUT_ALU_2 = OUT_SUB; // sub
            COUT_2 = OUT_COUT1;
            OUT_ALU_MUL_2 = 15'bz;
         end
 3'b010: begin
            OUT_ALU_2 = OUT_MUL[15:0]; //mul
            COUT_2 = 1'b0;
            OUT_ALU_MUL_2 = OUT_MUL[30:16];
         end
 3'b011: begin
            OUT_ALU_2 = ~IN_A_2;
            COUT_2 = 1'b0;
            OUT_ALU_MUL_2 = 31'bz;
         end
 3'b100: begin
            OUT_ALU_2 = IN_A_2<<IN_B_2; // LeftShif A by B
            COUT_2 = 1'b0;
            OUT_ALU_MUL_2 = 15'bz;
         end
 3'b101: begin
            OUT_ALU_2 = IN_A_2>>IN_B_2; // RightShift A by B
            COUT_2 = 1'b0;
            OUT_ALU_MUL_2 = 15'bz;
         end
 3'b110: begin
            OUT_ALU_2 = IN_A_2 & IN_B_2; // and
            COUT_2 = 1'b0;
            OUT_ALU_MUL_2 = 15'bz;
         end
 3'b111: begin
            OUT_ALU_2 = IN_A_2 | IN_B_2; // or
            COUT_2 = 1'b0;
            OUT_ALU_MUL_2 = 15'bz;
         end
 default:
        begin
        OUT_ALU_2 = OUT_SUM; // add
        COUT_2 = OUT_COUT;
        OUT_ALU_MUL_2 = 15'bz;
        end
 endcase
end
else
begin
    OUT_ALU_2 = 16'bZ;
    COUT_2 = 1'bz;
    OUT_ALU_MUL_2 = 15'bz;
end
end

endmodule
