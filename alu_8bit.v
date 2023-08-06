`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:25 08/06/2023 
// Design Name: 
// Module Name:    alu_8bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_8bit(output reg [7:0]out,
						output sign,
						output zero,
						output reg carry,
						output parity,
						output overflow,
						input [7:0]a,
						input [7:0]b,
						input [2:0]opcode
    );
always @*
begin
case(opcode)
3'b000:{carry,out}=a+b;
3'b001:{carry,out}=a-b;
3'b010:{carry,out}=a&b;
3'b011:{carry,out}=a|b;
3'b100:{carry,out}=a^b;
3'b101:{carry,out}=a+1;
3'b110:{carry,out}=a-1;
3'b111:{carry,out}=~a;
default:{carry,out}=0;
endcase
end

assign sign=out[7];
assign zero=~|out;
assign parity=~^out;// odd parity
assign overflow=(a[7]&b[7]&~out[7])|(~a[7]&~b[7]&out[7]);


endmodule
