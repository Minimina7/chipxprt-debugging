module addsub #(
    parameter n = 4
)(
    input logic M,
    input logic [n -1:0] A,
    input logic [n -1:0] B,
    output logic [n-1:0] S,
    output logic Cout
);

    logic [n-1:0] Bin;

    assign Bin = M ? ~B : B;

    assign {Cout, S} = A + Bin + M;
endmodule : addsub