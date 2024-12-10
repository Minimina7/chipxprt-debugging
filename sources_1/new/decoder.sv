module decoder#(
    parameter n = 2
)(
    input logic [n-1:0]in,
    output logic [(1 << n) - 1: 0]out
);

    always @(*)
    begin 
        case(in)
        0: out = 4'b0001;
        1: out = 4'b0010;
        2: out = 4'b0100;
        default: out = 4'b1000;
        endcase
    end

endmodule 