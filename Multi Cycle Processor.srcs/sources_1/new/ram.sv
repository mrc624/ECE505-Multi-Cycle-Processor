`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2025 02:26:08 PM
// Design Name: 
// Module Name: ram
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


module ram(
    input clka,
    input wea,
    input [7:0] addra,
    input [31:0] dina,
    output [31:0] douta
    );
    
    logic[31:0] regs[0:255];
    
    integer i;
    
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            regs[i] = 32'b0;
        end
    end
    
    
    assign douta = regs[addra];
    
    always_ff @(posedge clka) begin
        if (wea) begin
            regs[addra] <= dina;
        end
    end
    
endmodule
