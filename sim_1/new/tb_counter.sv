`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 08:51:36 AM
// Design Name: 
// Module Name: tb_counter
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


module tb_counter;

logic clk = 0;
logic reset_n,load;
logic [3:0] load_data;
logic [3:0] count;

counter_4bit dut(
    .clk(clk),
    .reset_n(reset_n),
    .load(load),
    .load_data(load_data),
    .count(count)
);

always #5 clk = ~clk;

initial begin
load_data = 4'b0111;
#5
reset_n = 1'b1;
load = 1'b1;
#5
reset_n = 1'b0;
#5
reset_n = 1'b1;
load = 1'b1;
#23
load = 1'b0;

#10
load = 1'b1;


#40
$finish;
end
endmodule
