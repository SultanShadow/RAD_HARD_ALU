//*********************************************************************************************//
//    Project      : 16-Bit Modified Booth Multiplier
//    File         : booth_16bit.v
//    Author       : Fasih-ud-Din Farrukh
//    Company      : Tsinghua University, Beijing, China
//    Start Date   : 
//    Last Updated : 
//    Version      : 0.1
//    Abstract     : This module implements ....
//
// 
//    Modification History:
//==============================================================================================
//    Date                       By                  Version                Change Description
//==============================================================================================
//    09th May, 2019           Rai Fasih              0.1                    Original Version
//*********************************************************************************************//

	`timescale 1ps/1ps                             

//------------------------------------------------------------------------------------------------------*/  
// TOP Module of 16-Bit Modified Booth Multiplier                                                                      
//------------------------------------------------------------------------------------------------------*/  

	module BOOTH_16BIT_SIGN(//Inputs
										 multiplier,
										 multiplicand,
										 
										 //Outputs
										 product
										);

	parameter WIDTH = 16;
	
//------------------------------------------------------------------------------------------------------// 
// Input & Output Declarations                                                                  
//------------------------------------------------------------------------------------------------------// 

	input  [15:0] multiplier;
	input  [15:0] multiplicand;

	output [30:0] product;

//------------------------------------------------------------------------------------------------------// 
// Internal reg and wires declaration                                                                       
//------------------------------------------------------------------------------------------------------// 

	//reg [6:0] pps [0:2];
	//reg [10:0] correctionVector;
	//reg [2:0] recoderOut[2:0];
	//wire [6:0] pps [0:2];
	wire [16:0]  pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7;
	wire [30:0]  correctionVector;
	//wire [2:0] recoderOut[2:0];
	wire [2:0] 	 recoderOut0,recoderOut1,recoderOut2,recoderOut3,
							 recoderOut4,recoderOut5,recoderOut6,recoderOut7;
	wire [16:0]  a, a_n;
	wire [16:0]  aa, aa_n;
	
	wire [16:0]  twos_multiplicand;
	//wire [31:0]  pp0_0,pp1_1,pp2_2,pp3_3,pp4_4,pp5_5,pp6_6,pp7_7;
	
	//wire [2:0] 	RECODERfn_0,RECODERfn_1,RECODERfn_2;

//------------------------------------------------------------------------------------------------------// 
// Main Logic                                                                     
//------------------------------------------------------------------------------------------------------// 

	/*
	 1 x multiplicand, sign extend the multiplicand, and flip the sign bit
	 2 x multiplicand, shift a by 1 and flip the sign bit
	-1 x multiplicand, sign extend multiplicand and then flip all bits except the sign bit
	-2 x multiplicand, shift a by 1, flip all the bits except the sign bit
	*/
	
	//assign a 		=  {~multiplicand[WIDTH-1],  multiplicand};
	//assign aa 	=  {~multiplicand[WIDTH-1],  multiplicand[WIDTH-2:0], 1'b0};
	//assign a_n 	=  { multiplicand[WIDTH-1], ~multiplicand};
	//assign aa_n =  { multiplicand[WIDTH-1], ~multiplicand[WIDTH-2:0], 1'b0};

	/*
	 1 x multiplicand, Copy the multiplicand
	 2 x multiplicand, Shift a by 1 and copy the multiplicand
	-1 x multiplicand, Two's complement of the multiplicand is copied
	-2 x multiplicand, Shift a by 1, Two's complement of the multiplicand is copied
	*/
	
	assign twos_multiplicand = ~multiplicand + 1'b1;
		
	assign a 		=  { multiplicand[WIDTH-1],  multiplicand};                 
	assign aa 	=  { multiplicand, 1'b0};
	assign a_n 	=  	 twos_multiplicand;                 
	assign aa_n =  { twos_multiplicand, 1'b0};
	

	booth_recoder inst0 ({multiplier[1:0],1'b0},recoderOut0);
	booth_recoder inst1 ( multiplier[3:1],			recoderOut1);       
	booth_recoder inst2 ( multiplier[5:3],			recoderOut2); 
	booth_recoder inst3 ( multiplier[7:5],			recoderOut3);
	booth_recoder inst4 ( multiplier[9:7],			recoderOut4);
	booth_recoder inst5 ( multiplier[11:9],			recoderOut5);
	booth_recoder inst6 ( multiplier[13:11],		recoderOut6);
	booth_recoder inst7 ( multiplier[15:13],		recoderOut7);
		
	// generate pps and correction vector
	generate_pp_cv inst8  ( recoderOut0, a, aa, a_n, aa_n, pp0 );
	generate_pp_cv inst9  ( recoderOut1, a, aa, a_n, aa_n, pp1 );
	generate_pp_cv inst10 ( recoderOut2, a, aa, a_n, aa_n, pp2 );
	generate_pp_cv inst11 ( recoderOut3, a, aa, a_n, aa_n, pp3 );
	generate_pp_cv inst12 ( recoderOut4, a, aa, a_n, aa_n, pp4 );
	generate_pp_cv inst13 ( recoderOut5, a, aa, a_n, aa_n, pp5 );
	generate_pp_cv inst14 ( recoderOut6, a, aa, a_n, aa_n, pp6 );
	generate_pp_cv inst15 ( recoderOut7, a, aa, a_n, aa_n, pp7 );
	
	// pre-computed CV for sign extension elimination
	//assign correctionVector[30:16] = 15'b010_1010_1010_1011;	
	
	//Sign extension
	
	//assign pp0_0 =  { 15{pp0[16]}, pp0 };
	//assign pp1_1 =  { 15{pp1[16]}, pp1 }
	//assign pp2_2 =  { 15{pp2[16]}, pp2 }
	//assign pp3_3 =  { 15{pp3[16]}, pp3 }
	//assign pp4_4 =  { 15{pp4[16]}, pp4 }
	//assign pp5_5 =  { 15{pp5[16]}, pp5 }
	//assign pp6_6 =  { 15{pp6[16]}, pp6 }
	//assign pp7_7 =  { 15{pp7[16]}, pp7 }
	

	// simply add all the PPs and CV, to complete the functionality of the multiplier,
	// for optimized implementation, a reduction tree should be used for compression
	//assign product = pp0 + {pp1,2'b00} + {pp2,4'b0000} + {pp3,6'b0000_00} + {pp4,8'b0000_0000} + {pp5,10'b0000_0000_00} 
	//							+ {pp6,12'b0000_0000_0000} + {pp7,14'b0000_0000_0000_00} + correctionVector;
	
	assign product = {{15{pp0[16]}}, pp0} + {{13{pp1[16]}},pp1,2'b00} + {{11{pp2[16]}},pp2,4'b0000} + {{9{pp3[16]}},pp3,6'b0000_00} 
								 + {{7{pp4[16]}},pp4,8'b0000_0000} + {{5{pp5[16]}},pp5,10'b0000_0000_00} + {{3{pp6[16]}},pp6,12'b0000_0000_0000} 
								 + {{1{pp7[16]}},pp7,14'b0000_0000_0000_00} ;                         
	
//------------------------------------------------------------------------------------------------------// 
// End Module                                                                                      
//------------------------------------------------------------------------------------------------------// 
		
	endmodule
