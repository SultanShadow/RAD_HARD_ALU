`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2021 02:22:47 PM
// Design Name: 
// Module Name: to_ALU_opt_TMR_KP_Voter
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


module to_ALU_opt_TMR_KP_Voter(
    //input  [15:0] INA,  //src1
    //input  [15:0] INB,  //src2
    //input  [2:0] OP, //function sel
    input DATA_IN,
    input CLK,
    input RST,
    input Ready,
    output [15:0] OUT,  //result 
     output [14:0] OUT_2,  //result
    //output ZERO_FLAG,
    output COUT
    );
    
    wire [15:0] ALU1_result,ALU2_result,ALU3_result;
    wire [14:0] ALU1_MUL_RES,ALU2_MUL_RES,ALU3_MUL_RES;
    wire Z_Flag1,Z_Flag2,Z_Flag3;
    wire COUT_1,COUT_2,COUT_3;
    wire QueuFull_w;
    wire [34:0] SIPO_OUT_w;
    
    SIPO sipo1(.data_in(DATA_IN),.clk(CLK),.rst(RST),.Start_data(Ready),.Data_out_Config(SIPO_OUT_w),.load_data(QueuFull_w));


    ALU_Opt Ins1(.IN_A(SIPO_OUT_w[15:0]),.IN_B(SIPO_OUT_w[31:16]),.OPCODE(SIPO_OUT_w[34:32]),.OUT_ALU(ALU1_result),.OUT_ALU_MUL(ALU1_MUL_RES),.COUT(COUT_1),.DataReady_1(QueuFull_w));
    ALU_opt_2 ins2(.IN_A_2(SIPO_OUT_w[15:0]),.IN_B_2(SIPO_OUT_w[31:16]),.OPCODE_2(SIPO_OUT_w[34:32]),.OUT_ALU_2(ALU2_result),.OUT_ALU_MUL_2(ALU2_MUL_RES),.COUT_2(COUT_2),.DataReady_2(QueuFull_w));
    ALU_opt_3 ins3(.IN_A_3(SIPO_OUT_w[15:0]),.IN_B_3(SIPO_OUT_w[31:16]),.OPCODE_3(SIPO_OUT_w[34:32]),.OUT_ALU_3(ALU3_result),.OUT_ALU_MUL_3(ALU3_MUL_RES),.COUT_3(COUT_3),.DataReady_3(QueuFull_w));
    
    
     	 KP_Voter Voter1(.IN_A(ALU1_result[0]),.IN_B(ALU2_result[0]),.IN_C(ALU3_result[0]), .Data_Out(OUT[0]));
	 KP_Voter Voter2(.IN_A(ALU1_result[1]),.IN_B(ALU2_result[1]),.IN_C(ALU3_result[1]), .Data_Out(OUT[1]));
	 KP_Voter Voter3(.IN_A(ALU1_result[2]),.IN_B(ALU2_result[2]),.IN_C(ALU3_result[2]), .Data_Out(OUT[2]));
	 KP_Voter Voter4(.IN_A(ALU1_result[3]),.IN_B(ALU2_result[3]),.IN_C(ALU3_result[3]), .Data_Out(OUT[3]));
	 KP_Voter Voter5(.IN_A(ALU1_result[4]),.IN_B(ALU2_result[4]),.IN_C(ALU3_result[4]), .Data_Out(OUT[4]));
	 KP_Voter Voter6(.IN_A(ALU1_result[5]),.IN_B(ALU2_result[5]),.IN_C(ALU3_result[5]), .Data_Out(OUT[5]));
	 KP_Voter Voter7(.IN_A(ALU1_result[6]),.IN_B(ALU2_result[6]),.IN_C(ALU3_result[6]), .Data_Out(OUT[6]));
	 KP_Voter Voter8(.IN_A(ALU1_result[7]),.IN_B(ALU2_result[7]),.IN_C(ALU3_result[7]), .Data_Out(OUT[7]));
         KP_Voter Voter9(.IN_A(ALU1_result[8]),.IN_B(ALU2_result[8]),.IN_C(ALU3_result[8]), .Data_Out(OUT[8]));
	 KP_Voter Voter10(.IN_A(ALU1_result[9]),.IN_B(ALU2_result[9]),.IN_C(ALU3_result[9]), .Data_Out(OUT[9]));
         KP_Voter Voter11(.IN_A(ALU1_result[10]),.IN_B(ALU2_result[10]),.IN_C(ALU3_result[10]), .Data_Out(OUT[10]));
	 KP_Voter Voter12(.IN_A(ALU1_result[11]),.IN_B(ALU2_result[11]),.IN_C(ALU3_result[11]), .Data_Out(OUT[11]));
	 KP_Voter Voter13(.IN_A(ALU1_result[12]),.IN_B(ALU2_result[12]),.IN_C(ALU3_result[12]), .Data_Out(OUT[12]));
	 KP_Voter Voter14(.IN_A(ALU1_result[13]),.IN_B(ALU2_result[13]),.IN_C(ALU3_result[13]), .Data_Out(OUT[13]));
	 KP_Voter Voter15(.IN_A(ALU1_result[14]),.IN_B(ALU2_result[14]),.IN_C(ALU3_result[14]), .Data_Out(OUT[14]));
	 KP_Voter Voter16(.IN_A(ALU1_result[15]),.IN_B(ALU2_result[15]),.IN_C(ALU3_result[15]), .Data_Out(OUT[15])); 
    
    // For Multiplier
   
	 KP_Voter Voter121(.IN_A(ALU1_MUL_RES[0]),.IN_B(ALU2_MUL_RES[0]),.IN_C(ALU3_MUL_RES[0]), .Data_Out(OUT_2[0]));
	 KP_Voter Voter31(.IN_A(ALU1_MUL_RES[1]),.IN_B(ALU2_MUL_RES[1]),.IN_C(ALU3_MUL_RES[1]), .Data_Out(OUT_2[1]));
	 KP_Voter Voter41(.IN_A(ALU1_MUL_RES[2]),.IN_B(ALU2_MUL_RES[2]),.IN_C(ALU3_MUL_RES[2]), .Data_Out(OUT_2[2]));
	 KP_Voter Voter51(.IN_A(ALU1_MUL_RES[3]),.IN_B(ALU2_MUL_RES[3]),.IN_C(ALU3_MUL_RES[3]), .Data_Out(OUT_2[3]));
	 KP_Voter Voter61(.IN_A(ALU1_MUL_RES[4]),.IN_B(ALU2_MUL_RES[4]),.IN_C(ALU3_MUL_RES[4]), .Data_Out(OUT_2[4]));
	 KP_Voter Voter71(.IN_A(ALU1_MUL_RES[5]),.IN_B(ALU2_MUL_RES[5]),.IN_C(ALU3_MUL_RES[5]), .Data_Out(OUT_2[5]));
	 KP_Voter Voter81(.IN_A(ALU1_MUL_RES[6]),.IN_B(ALU2_MUL_RES[6]),.IN_C(ALU3_MUL_RES[6]), .Data_Out(OUT_2[6]));
         KP_Voter Voter91(.IN_A(ALU1_MUL_RES[7]),.IN_B(ALU2_MUL_RES[7]),.IN_C(ALU3_MUL_RES[7]), .Data_Out(OUT_2[7]));
	 KP_Voter Voter181(.IN_A(ALU1_MUL_RES[8]),.IN_B(ALU2_MUL_RES[8]),.IN_C(ALU3_MUL_RES[8]), .Data_Out(OUT_2[8]));
         KP_Voter Voter101(.IN_A(ALU1_MUL_RES[9]),.IN_B(ALU2_MUL_RES[9]),.IN_C(ALU3_MUL_RES[9]), .Data_Out(OUT_2[9]));
	 KP_Voter Voter67(.IN_A(ALU1_MUL_RES[10]),.IN_B(ALU2_MUL_RES[10]),.IN_C(ALU3_MUL_RES[10]), .Data_Out(OUT_2[10]));
	 KP_Voter Voter131(.IN_A(ALU1_MUL_RES[11]),.IN_B(ALU2_MUL_RES[11]),.IN_C(ALU3_MUL_RES[11]), .Data_Out(OUT_2[11]));
	 KP_Voter Voter141(.IN_A(ALU1_MUL_RES[12]),.IN_B(ALU2_MUL_RES[12]),.IN_C(ALU3_MUL_RES[12]), .Data_Out(OUT_2[12]));
	 KP_Voter Voter151(.IN_A(ALU1_MUL_RES[13]),.IN_B(ALU2_MUL_RES[13]),.IN_C(ALU3_MUL_RES[13]), .Data_Out(OUT_2[13]));
	 KP_Voter Voter161(.IN_A(ALU1_MUL_RES[14]),.IN_B(ALU2_MUL_RES[14]),.IN_C(ALU3_MUL_RES[14]), .Data_Out(OUT_2[14]));
    
	//assign ZERO_FLAG = Z_Flag1 & Z_Flag2 & Z_Flag3;
	assign COUT = COUT_1 & COUT_2 & COUT_3;


endmodule
