`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2025 12:53:33 PM
// Design Name: 
// Module Name: Defines
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


`ifndef DEFINES_SV
`define DEFINES_SV
    
typedef enum logic [4:0] {
    ALU_AND = 5'b00111,
    ALU_OR =  5'b00110,
    ALU_ADD = 5'b00000,
    ALU_SUB = 5'b10000,
    ALU_MULT =5'b01000,
    ALU_SHIFT=5'b00001
} ALU_OPCODE_T;

typedef enum logic [1:0] {
    ALU_OP_LOAD_STORE = 2'b00,
    ALU_OP_BRANCH = 2'b01,
    ALU_OP_R = 2'b10,
    ALU_OP_I = 2'b11
} ALU_OP_T;

typedef enum logic [6:0] {
    OPC_RTYPE = 7'b0110011, 
    OPC_ITYPE = 7'b0010011, 
    OPC_LTYPE = 7'b0000011, 
    OPC_STYPE = 7'b0100011,  
    OPC_BTYPE = 7'b1100011,
    OPC_JAL   = 7'b1101111,
    OPC_JALR  = 7'b1100111,
    OPC_DEFAULT=7'b0000000,
    OPC_HALT  = 7'b1111111  
} OPCODE_T;

typedef enum logic [2:0] {
    BTYPE_FUNCT3_BEQ = 3'b000,
    BTYPE_FUNCT3_BNE = 3'b001
} BTYPE_FUNCT3;

`endif