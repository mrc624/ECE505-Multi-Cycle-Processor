`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 01:04:09 PM
// Design Name: 
// Module Name: reg_rom
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


module reg_rom(
    input logic [4:0] addr,
    output logic [31:0] q
    );
    
    always_comb begin
        case(addr)
            // Program 1
            5'd0:  q = 32'h00000093;
            5'd1:  q = 32'h01000113;
            5'd2:  q = 32'h06400193;
            5'd3:  q = 32'h00800213;
            5'd4:  q = 32'h002082b3;
            5'd5:  q = 32'h00418333;
            5'd6:  q = 32'h0050a023;
            5'd7:  q = 32'h00612223;
            5'd8:  q = 32'hFFFFFFFF;

            // Program 2
            /*5'd0:  q = 32'h00800293;
            5'd1:  q = 32'h00f00313;
            5'd2:  q = 32'h0062a023;
            5'd3:  q = 32'h005303b3;
            5'd4:  q = 32'h40530e33;
            5'd5:  q = 32'h03c384b3;
            5'd6:  q = 32'h00428293;
            5'd7:  q = 32'hffc2a903;
            5'd8:  q = 32'h41248933;
            5'd9:  q = 32'h00291913;
            5'd10: q = 32'h0122a023;
            5'd11: q = 32'hFFFFFFFF;*/

            // Factorial Program
            /*5'd0:  q = 32'h00c00513;
            5'd1:  q = 32'h00c000ef;
            5'd2:  q = 32'h00a02023;
            5'd3:  q = 32'hFFFFFFFF;
            5'd4:  q = 32'hff810113;
            5'd5:  q = 32'h00112223;
            5'd6:  q = 32'h00a12023;
            5'd7:  q = 32'hfff50513;
            5'd8:  q = 32'h00051863;
            5'd9:  q = 32'h00100513;
            5'd10: q = 32'h00810113;
            5'd11: q = 32'h00008067;
            5'd12: q = 32'hfe1ff0ef;
            5'd13: q = 32'h00050293;
            5'd14: q = 32'h00012503;
            5'd15: q = 32'h00412083;
            5'd16: q = 32'h00810113;
            5'd17: q = 32'h02550533;
            5'd18: q = 32'h00008067;
            5'd19: q = 32'hFFFFFFFF;*/

            // Custom program to test BEQ
            /*5'd0:  q = 32'h00c00513;
            5'd1:  q = 32'h00100593;
            5'd2:  q = 32'h40b50533;
            5'd3:  q = 32'h00050463;
            5'd4:  q = 32'hff9ff0ef;
            5'd5:  q = 32'hFFFFFFFF;*/

            default: q = 32'b0;
        endcase
    end
    
endmodule
