`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 11:23:57 AM
// Design Name: 
// Module Name: imm_gen
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

module imm_gen(
    input  logic [31:0] instr,   // 32-bit instruction
    output logic [31:0] imm_out  // sign-extended immediate
    );
    
    logic [6:0] opcode;
    assign opcode = instr[6:0];
    
    assign imm_out = (opcode == OPC_ITYPE) ? {{20{instr[31]}}, instr[31:20]} :
                 (opcode == OPC_LTYPE) ? {{20{instr[31]}}, instr[31:20]} :
                 (opcode == OPC_STYPE) ? {{20{instr[31]}}, instr[31:25], instr[11:7]} :
                 (opcode == OPC_BTYPE) ? {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0} :
                 (opcode == OPC_JAL) ? {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0} :
                 (opcode == OPC_JALR) ? {{20{instr[31]}}, instr[31:20]} :
                 0;
endmodule