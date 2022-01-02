`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2021 02:10:30 PM
// Design Name: 
// Module Name: ALU_opt_3
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


module ALU_opt_3(
 input  [15:0] IN_A_3,  //src1
    input  [15:0] IN_B_3,  //src2
    input  [2:0] OPCODE_3, //function sel
    input  DataReady_3,
    output reg [15:0] OUT_ALU_3,  //result 
    output reg [14:0] OUT_ALU_MUL_3,
    output reg COUT_3
    
    );
    
    wire MODE;
    wire [15:0] OUT_SUM,OUT_SUB;
    wire [30:0] OUT_MUL;
    wire OUT_COUT,OUT_COUT1;
 
 RPA_16bit Rp_add(.IN_A(IN_A_3), .IN_B(IN_B_3), .MODE(1'b0),.OUT_SUM(OUT_SUM),.OUT_COUT(OUT_COUT));
 RPA_16bit Rp_sub(.IN_A(IN_A_3), .IN_B(IN_B_3), .MODE(1'b1),.OUT_SUM(OUT_SUB),.OUT_COUT(OUT_COUT1));
 BOOTH_16BIT_SIGN Mul(.multiplier(IN_A_3),.multiplicand(IN_B_3),.product(OUT_MUL));
 always @(*)
begin
if(DataReady_3)
begin 
 case(OPCODE_3)
 3'b000: begin    
            OUT_ALU_3 = OUT_SUM; // add
            COUT_3 = OUT_COUT;
            OUT_ALU_MUL_3 = 15'bz;
         end
 3'b001: begin
            OUT_ALU_3 = OUT_SUB; // sub
            COUT_3 = OUT_COUT1;
            OUT_ALU_MUL_3 = 15'bz;
         end
 3'b010: begin
            OUT_ALU_3 = OUT_MUL[15:0]; //mul
            COUT_3 = 1'b0;
            OUT_ALU_MUL_3 = OUT_MUL[30:16];
         end
 3'b011: begin
            OUT_ALU_3 = ~IN_A_3;
            COUT_3 = 1'b0;
            OUT_ALU_MUL_3 = 15'bz;
         end
 3'b100: begin
            OUT_ALU_3 = IN_A_3<<IN_B_3; // LeftShif A by B
            COUT_3 = 1'b0;
            OUT_ALU_MUL_3 = 15'bz;
         end
 3'b101: begin
            OUT_ALU_3 = IN_A_3>>IN_B_3; // RightShift A by B
            COUT_3 = 1'b0;
            OUT_ALU_MUL_3 = 15'bz;
         end
 3'b110: begin
            OUT_ALU_3 = IN_A_3 & IN_B_3; // and
            COUT_3 = 1'b0;
            OUT_ALU_MUL_3 = 15'bz;
         end
 3'b111: begin
            OUT_ALU_3 = IN_A_3 | IN_B_3; // or
            COUT_3 = 1'b0;
            OUT_ALU_MUL_3 = 15'bz;
         end
 default:
        begin
        OUT_ALU_3 = OUT_SUM; // add
        COUT_3 = OUT_COUT;
        OUT_ALU_MUL_3 = 15'bz;
        end
 endcase
end
else
begin
    OUT_ALU_3 = 16'bZ;
    COUT_3 = 1'bz;
    OUT_ALU_MUL_3 = 15'bz;
end
end

endmodule
