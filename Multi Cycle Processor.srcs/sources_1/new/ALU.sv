`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 04:03:46 PM
// Design Name: 
// Module Name: ALU
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

`include "Defines.sv"

module ALU(
    output logic [31:0] Y,
    output logic zero,
    input logic [31:0] A,
    input logic [31:0] B,
    input logic [4:0] opcode
    );
    
   always_comb begin
        case(opcode)
            ALU_AND:    Y = A & B;
            ALU_OR:     Y = A | B;
            ALU_ADD:    Y = A + B;
            ALU_SUB:    Y = A - B;
            ALU_MULT:   Y = A * B;
            ALU_SHIFT:  Y = A << B;
            default:    Y = 32'd0;
        endcase
   end
   
   assign zero = (Y == 32'd0);
   
endmodule
