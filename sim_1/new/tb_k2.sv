`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 08:52:05 AM
// Design Name: 
// Module Name: tb_k2
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


module tb_k2;

logic clk = 0;
logic reset_n;
logic [3:0] regO, regA,regB;

core dut(
    .clk(clk),
    .resetn(reset_n),
    .regA(regA),
    .regB(regB),
    .regO(regO)
);

always #5 clk = ~clk;

initial begin
#5
reset_n = 1'b1;
#5
reset_n = 1'b0;
#5
reset_n = 1'b1;

#400
$finish;
end
endmodule


