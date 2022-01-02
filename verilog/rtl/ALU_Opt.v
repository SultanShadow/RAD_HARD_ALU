`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 02:53:47 PM
// Design Name: 
// Module Name: ALU_Opt
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


module ALU_Opt(
 input  [15:0] IN_A,  //src1
    input  [15:0] IN_B,  //src2
    input  [2:0] OPCODE, //function sel
    input  DataReady_1,
    output reg [15:0] OUT_ALU,  //result 
    output reg [14:0] OUT_ALU_MUL,  //result 
    output reg COUT
    );
    
    wire MODE;
    wire [15:0] OUT_SUM,OUT_SUB;
    wire [30:0] OUT_MUL;
    wire OUT_COUT,OUT_COUT1;
 
 RPA_16bit Rp_add(.IN_A(IN_A), .IN_B(IN_B), .MODE(1'b0),.OUT_SUM(OUT_SUM),.OUT_COUT(OUT_COUT));
 RPA_16bit Rp_sub(.IN_A(IN_A), .IN_B(IN_B), .MODE(1'b1),.OUT_SUM(OUT_SUB),.OUT_COUT(OUT_COUT1));
 BOOTH_16BIT_SIGN Mul(.multiplier(IN_A),.multiplicand(IN_B),.product(OUT_MUL));
 always @(*)
begin
if(DataReady_1)
begin 
 case(OPCODE)
 3'b000: begin    
            OUT_ALU = OUT_SUM; // add
            COUT = OUT_COUT;
            OUT_ALU_MUL =15'bz;
         end
 3'b001: begin
            OUT_ALU = OUT_SUB; // sub
            COUT = OUT_COUT1;
            OUT_ALU_MUL =15'bz;
         end
 3'b010: begin
            OUT_ALU = OUT_MUL[15:0]; //mul
            COUT = 1'b0;
            OUT_ALU_MUL = OUT_MUL[30:16];
         end
 3'b011: begin
            OUT_ALU = ~IN_A;
            COUT = 1'b0;
            OUT_ALU_MUL =15'bz;
         end
 3'b100: begin
            OUT_ALU = IN_A<<IN_B; // LeftShif A by B
            COUT = 1'b0;
            OUT_ALU_MUL =15'bz;
         end
 3'b101: begin
            OUT_ALU = IN_A>>IN_B; // RightShift A by B
            COUT = 1'b0;
            OUT_ALU_MUL =15'bz;
         end
 3'b110: begin
            OUT_ALU = IN_A & IN_B; // and
            COUT = 1'b0;
            OUT_ALU_MUL =15'bz;
         end
 3'b111: begin
            OUT_ALU = IN_A | IN_B; // or
            COUT = 1'b0;
            OUT_ALU_MUL =15'bz;
         end
 default:
        begin
        OUT_ALU = OUT_SUM; // add
        COUT = OUT_COUT;
        OUT_ALU_MUL =15'bz;
        end
 endcase
end
else
begin
    OUT_ALU = 16'bZ;
    COUT = 1'bz;
    OUT_ALU_MUL = 15'bz;
end
end

endmodule
