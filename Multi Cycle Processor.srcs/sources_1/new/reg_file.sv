`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 12:49:22 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
  input logic clk,
  input logic write, 
  input logic [4:0] rr1, //5 bit register address inputs
  input logic [4:0] rr2,
  input logic [4:0] wr,
  input logic [31:0] wd, //data to write
  output logic [31:0] rd1, //read data outputs
  output logic [31:0] rd2
);

    logic [31:0] file [31:0];
    
    integer i;
    
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            file[i] = 32'b0;
        end
            file[2] = 32'h7ffffff0;
    end
    
    assign rd1 = (rr1 == 5'b0) ? 32'b0 : file[rr1];
    assign rd2 = (rr2 == 5'b0) ? 32'b0 : file[rr2];


    always_ff @(posedge clk) begin
        if (write && (wr != 5'b0)) begin
            file[wr] <= wd;
        end
    end
endmodule
