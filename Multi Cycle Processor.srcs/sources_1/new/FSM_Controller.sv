`timescale 1ns / 1ps
`include "Defines.sv"

module FSM_Controller(
    input  logic        clk,
    input  logic        reset,
    input  logic [6:0]  opcode,
    input  logic        zero,          // ALU zero flag for branches

    output logic        PCWrite,
    output logic        Jump,
    output logic        Branch,
    output logic        MemRead,
    output logic        MemWrite,
    output logic        RegWrite
);

    // FSM States
    typedef enum logic [2:0] {
        S_IF      = 3'd0,   // Instruction Fetch
        S_ID      = 3'd1,   // Instruction Decode
        S_EX      = 3'd2,   // Execute / ALU ops
        S_MEM     = 3'd3,   // Memory access
        S_WB      = 3'd4,   // Writeback
        S_BRANCH  = 3'd5,   // Branch
        S_JUMP    = 3'd6    // Jump
    } state_t;

    state_t state, next_state;

    // -----------------------------
    // State register
    // -----------------------------
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S_IF;
        else
            state <= next_state;
    end

    // -----------------------------
    // Next state logic
    // -----------------------------
    always_comb begin
        next_state = state;

        case(state)
            S_IF: next_state = S_ID;

            S_ID: begin
                case(opcode)
                    OPC_RTYPE,
                    OPC_ITYPE: next_state = S_EX;

                    OPC_LTYPE,
                    OPC_STYPE: next_state = S_EX;

                    OPC_BTYPE: next_state = S_BRANCH;

                    OPC_JAL,
                    OPC_JALR: next_state = S_JUMP;

                    default: next_state = S_IF;
                endcase
            end

            S_EX: begin
                if(opcode == OPC_RTYPE || opcode == OPC_ITYPE)
                    next_state = S_WB;
                else if(opcode == OPC_LTYPE)
                    next_state = S_MEM;
                else if(opcode == OPC_STYPE)
                    next_state = S_MEM;
                else
                    next_state = S_IF;
            end

            S_MEM: begin
                if(opcode == OPC_LTYPE)
                    next_state = S_WB;
                else
                    next_state = S_IF;
            end

            S_WB: next_state = S_IF;

            S_BRANCH,
            S_JUMP: next_state = S_IF;

            default: next_state = S_IF;
        endcase
    end

    // -----------------------------
    // Output logic
    // -----------------------------
    always_comb begin
        // Defaults
        PCWrite   = 0;
        Jump      = 0;
        Branch    = 0;
        MemRead   = 0;
        MemWrite  = 0;
        RegWrite  = 0;

        case(state)
            // -------------------------
            // Instruction Fetch
            // -------------------------
            S_IF: begin
                PCWrite = 1;   // increment PC
                MemRead = 1;   // fetch instruction
            end

            // -------------------------
            // Execute / ALU ops
            // -------------------------
            S_EX: begin
                if(opcode == OPC_RTYPE || opcode == OPC_ITYPE)
                    ; // nothing extra needed, ALU handled by alu_control
                else if(opcode == OPC_LTYPE)
                    ; // address calculated in top module ALU
                else if(opcode == OPC_STYPE)
                    ; // address calculated in top module ALU
            end

            // -------------------------
            // Memory Access
            // -------------------------
            S_MEM: begin
                if(opcode == OPC_LTYPE)
                    MemRead = 1;
                else if(opcode == OPC_STYPE)
                    MemWrite = 1;
            end

            // -------------------------
            // Writeback
            // -------------------------
            S_WB: RegWrite = 1;

            // -------------------------
            // Branch
            // -------------------------
            S_BRANCH: begin
                Branch  = 1;   // PC update handled by top module PC logic
            end

            // -------------------------
            // Jump
            // -------------------------
            S_JUMP: begin
                Jump    = 1;   // PC update handled by top module PC logic
            end
        endcase
    end

endmodule
