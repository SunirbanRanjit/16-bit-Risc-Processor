module ALU_cu (
    input [1:0] ALUop,
    input [3:0] opcode,
    output reg [2:0] ALU_Sel
);
    wire [5:0] ALU_selection;
    assign ALU_selection = {ALUop,opcode};
    always @(ALU_selection) begin
        casex (ALU_selection)
            6'b10xxxx: ALU_Sel = 3'b000; //Lw
            6'b01xxxx: ALU_Sel = 3'b000; //Sw
            6'b000010: ALU_Sel = 3'b000; //Add 
            6'b000011: ALU_Sel = 3'b001; //Sub
            6'b000100: ALU_Sel = 3'b010; //Inv
            6'b000101: ALU_Sel = 3'b011; //Lsl
            6'b000110: ALU_Sel = 3'b100; //Lsr
            6'b000111: ALU_Sel = 3'b101; //AND
            6'b001000: ALU_Sel = 3'b110; //OR
            6'b001001: ALU_Sel = 3'b111; //SLT
            default: ALU_Sel = 3'b000;
        endcase
    end
endmodule
