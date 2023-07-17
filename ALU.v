module alu(
           input [15:0] a,b,  // ALU 8-bit Inputs                 
           input [2:0] ALU_Sel,// ALU Selection
           output [15:0] ALU_Out, // ALU 8-bit Output
           output CarryOut, // Carry Out Flag
	   output Zero_flag  // zero flag
    );
    reg [15:0] result;
    wire [15:0] tmp;
    assign ALU_Out = result; // ALU out
    assign tmp = {1'b0,a} + {1'b0,b};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        3'b000: result = a + b; // add
 	3'b001: result = a - b; // sub
 	3'b010: result = ~a;
 	3'b011: result = a<<b;
 	3'b100: result = a>>b;
 	3'b101: result = a & b; // and
 	3'b110: result = a | b; // or
 	3'b111: begin 
		if (a<b) result = 16'd1;
    		else result = 16'd0;
    		end
	default: result = a + b;
        endcase
	
    end
    assign Zero_flag = (result==16'd0) ? 1'b1: 1'b0;
endmodule

