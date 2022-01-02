//*********************************************************************************************//
//    Project      : 16-Bit Booth Multiplier Partial Products and CV Generation
//    File         : generate_pp_cv.v
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
// Module of Partial Products and CV Generation                                                                   
//------------------------------------------------------------------------------------------------------*/  

	module generate_pp_cv(//Inputs
											  recoderOut,
											  a,
											  aa,
											  a_n,
											  aa_n,
										 
		 									 //Outputs
		 									  ppi
											  //correctionVector
											);

//------------------------------------------------------------------------------------------------------// 
// Input & Output Declarations                                                                  
//------------------------------------------------------------------------------------------------------// 

	input  [2:0]  recoderOut;
	input  [16:0] a;
	input  [16:0] aa;
	input  [16:0] a_n;
	input  [16:0] aa_n;

	output [16:0] ppi;
	//output [1:0]  correctionVector;

//------------------------------------------------------------------------------------------------------// 
// Internal reg and wires declaration                                                                       
//------------------------------------------------------------------------------------------------------// 
	
	reg  [16:0] ppi;
	//reg  [1:0]  correctionVector;
	
	wire [15:0] zeros;

//------------------------------------------------------------------------------------------------------// 
// Main Logic                                                                  
//------------------------------------------------------------------------------------------------------// 
	
	assign zeros = 17'b0000_0000_0000_0000;
	
	always @(recoderOut or a or aa or a_n or aa_n)
	begin
		case(recoderOut)
			3'b000:
			begin
				ppi = zeros;
				//ppi {1’b0,zeros};
				//correctionVector = 2'b00;
			end
			3'b001:
			begin
				ppi = a;
				//correctionVector = 2'b00;
			end
			3'b010:
			begin
				ppi = aa;
				//correctionVector = 2'b00;
			end
			3'b110:
			begin
				ppi = aa_n;
				//correctionVector = 2'b10;
				//correctionVector 2’b00;
			end
			3'b111:
			begin
				ppi = a_n;
				//correctionVector = 2'b01;
				//correctionVector 2’b00;
			end
		default:
			begin
				ppi = 17'bx;
				//correctionVector = 2'bx;
			end
		endcase
	end

//------------------------------------------------------------------------------------------------------// 
// End Module                                                                                      
//------------------------------------------------------------------------------------------------------// 
	
	endmodule
