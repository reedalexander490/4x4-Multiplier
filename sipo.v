module sipo (
    input wire clk,
    input wire reset, 
    input wire serial_in,
    input wire shift_enable, 
    output reg [3:0] A,
    output reg [3:0] B,
    output reg sipo_done
);

    reg [2:0] bit_counter; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 4'b0000;
            B <= 4'b0000;
            bit_counter <= 3'b000;
            sipo_done <= 1'b0;
        end
        else if (shift_enable) begin
            if (bit_counter < 4) 
                A <= {A[2:0], serial_in}; 
            else if (bit_counter < 8) 
                B <= {B[2:0], serial_in}; 

            bit_counter <= bit_counter + 1;

            if (bit_counter == 7)
                sipo_done <= 1'b1;
        end
        else 
            sipo_done <= 1'b0;
    end

endmodule
