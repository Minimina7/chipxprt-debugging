module core(
    input logic clk, 
    input logic resetn,
    output logic [3:0] regA,
    output logic [3:0] regB,
    output logic [3:0] regO
);

// Instruction Fetching
logic [2:0] imm;
logic [3:0] pc;

// jump logic 
logic pc_load;
assign  pc_load = J | (C & carryout);

counter_n_bit pc_inst(
    .clk(clk),
    .resetn(resetn),
    .load_data({'b0,imm}),
    .load(pc_load),
    .en(1'b1),   
    .count(pc)
);


// Instruction memory
logic [7:0] inst;
imem imem_inst(
    .addr(pc),
    .inst(inst)
);

// Decoding instruction 
logic J;
logic C;
logic [1:0] D;
logic Sreg;
logic S;

assign J = inst[7];
assign C = inst[6];
//assign D[1] = inst[5];
assign D = inst[5:4];
assign Sreg = inst[3];
//assign S = inst[2];
assign imm = inst[2:0];


// Generating enables for register O, A and B
logic [3:0] enABo; //, enB, enO;
decoder decoder_inst(
    .in(D),
    .out(enABo)
    //.out({enA,enB,enO})
);

// registers 
logic [3:0] regIn;
//logic [3:0] regA, regB;

logic [3:0] AluOut;

// Mux for selecting inputs for register (regIn)
mux2x11 mux1(
    .in1(AluOut),
    .in2({1'b0,imm}),
    .sel(~Sreg),
    .out(regIn)
);

// Register RA (regA)
register reg_A(
    .clk(clk),
    .resetn(resetn),
    .wen(enABo[0]),
    .D(regIn),
    .Q(regA)
);

// Register RB (regB)
register reg_B(
    .clk(clk),
    .resetn(resetn),
    .wen(enABo[1]),
    .D(regIn),
    .Q(regB)
);

// Register RO (regO)
register reg_O(
    .clk(clk),
    .resetn(resetn),
    .wen(enABo[2]),
    .D(regA),
    .Q(regO)
);

// ALU
logic carry, carryout;

alu alu_inst(
    .opcode(imm[2]),
    .a(regA),
    .b(regB),
    .out(AluOut),
    .carry(carry)
);

register #(.n(1)) carry1(
    .clk(clk),
    .resetn(resetn),
    .wen(C),
    .D(carry),
    .Q(carryout)
);


endmodule : core