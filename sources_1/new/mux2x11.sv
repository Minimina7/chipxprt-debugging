module mux2x11#(
    parameter n =4
)(
    input logic [n-1:0] in1,
    input logic [n-1:0] in2,
    input logic sel,
    output logic [n-1:0] out

);

    assign out = sel? in1 : in2;

endmodule : mux2x11