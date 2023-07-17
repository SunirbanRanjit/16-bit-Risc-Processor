`include "Arguments.v"

module Data_Memory (
    input clk,write_en,read_en,
    input [15:0] mem_access,
    input [15:0] write_data,
    
    output [15:0] read_data
);
    reg [`col-1:0] memory [`row_d-1:0];
    wire [15:0] ram_address = mem_access[2:0];
    integer f;
    initial begin
        $readmemb("./test/datamem.data", memory);
        
        f = $fopen(`filename);
        $fmonitor(f, "time = %d\n", $time, 
        "\tmemory[0] = %b\n", memory[0],   
        "\tmemory[1] = %b\n", memory[1],
        "\tmemory[2] = %b\n", memory[2],
        "\tmemory[3] = %b\n", memory[3],
        "\tmemory[4] = %b\n", memory[4],
        "\tmemory[5] = %b\n", memory[5],
        "\tmemory[6] = %b\n", memory[6],
        "\tmemory[7] = %b\n", memory[7]);
        `simulation_time;
        $fclose(f);
    end
    always @(posedge clk ) begin
        if ( write_en == 1'b1) begin
            memory[ram_address] <= write_data;    
        end
        
    end
    assign read_data = (read_en==1'b1)?memory[ram_address]:1'b0;
endmodule
