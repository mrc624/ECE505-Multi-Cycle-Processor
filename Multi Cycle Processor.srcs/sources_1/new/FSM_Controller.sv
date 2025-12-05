`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2025 12:49:39 PM
// Design Name: 
// Module Name: FSM_Controller
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

module FSM_Controller(
    input logic clk,
    input logic reset,
    output logic [2:0] state
    );
    
    always_ff @(posedge clk) begin
        if (reset) begin
            state <= FSM_IDLE;
        end else if (state == FSM_IDLE) begin
            state <= FSM_IF;
        end else if (state == FSM_IF) begin
            state <= FSM_ID;
        end else if (state == FSM_ID) begin
            state <= FSM_EX;
        end else if (state == FSM_EX) begin
            state <= FSM_MEM;
        end else if (state == FSM_MEM) begin
            state <= FSM_WB;
        end else if (state == FSM_WB) begin
            state <= FSM_IF;
        end else begin
            FSM_IDLE;
        end
    end
endmodule
