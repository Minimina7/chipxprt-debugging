module alu(
    input logic opcode,
    input logic [3:0]a,
    input logic [3:0]b,
    output logic [3:0] out,
    output logic carry
);

    addsub addsub_inst0 (
            .M(opcode),
            .A(a),
            .B(b),
            .S(out),
            .Cout(carry)
    );

    
endmodule 


