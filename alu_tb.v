`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:57 08/06/2023
// Design Name:   alu_8bit
// Module Name:   E:/GitHub Repositories/Verilog-Projects/ALU_8_bit/ALU_8_bit/alu_tb.v
// Project Name:  ALU_8_bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [2:0] opcode;
	integer i;

	// Outputs
	wire [7:0] out;
	wire sign;
	wire zero;
	wire carry;
	wire parity;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	alu_8bit uut (
		.out(out), 
		.sign(sign), 
		.zero(zero), 
		.carry(carry), 
		.parity(parity), 
		.overflow(overflow), 
		.a(a), 
		.b(b), 
		.opcode(opcode)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		opcode = 0;

		// Wait 5 ns for global reset to finish
		#5;
        
		// Add stimulus here
		a=8'd5; b=8'd11;
		for(i=0;i<8;i=i+1)
		begin
		{opcode}=i;#5;
		$display("T=2%d,a=%b,b=%b,out=%b,carry=%b,sign=%b,zero=%b,parity=%b,overflow=%b",$time,a,b,out,carry,
		sign,zero,parity,overflow);
		end
		#5 $finish;
		

	end
      
endmodule

