`include "Arguments.v"
module Program_Memory(
    input [15:0] pc,
    output [15:0] instruction
); 

    reg [`col-1:0] instruction_memory [`row_i:0] ;
    wire [15:0] mem_addr = pc[4:1];
    initial begin
        $readmemb("./test/instruction.prog",instruction_memory);
    end
    assign instruction = instruction_memory[mem_addr]; 

    
endmodule
