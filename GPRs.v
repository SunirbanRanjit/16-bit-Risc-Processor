module GPRs (
    input clk, write_en,
    input [2:0] data_read_address_1,data_read_address_2,data_write_address,
    input [15:0] data_write,

    output [15:0] data_read_1,data_read_2
);
    reg [15:0] reg_arr [7:0];
    integer i;
    initial begin
        for (i=0 ;i<8 ;i=i+1 ) begin
            reg_arr[i] <= 16'd0;
        end        
    end

    always @(posedge clk ) begin
        if(write_en==1'b1) begin
            reg_arr[data_write_address] <= data_write;
        end
    end

    assign data_read_1 = reg_arr[data_read_address_1];
    assign data_read_2 = reg_arr[data_read_address_2];

endmodule
