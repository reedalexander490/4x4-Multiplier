module piso (
    input clk,
    input reset, 
    input piso_enable,
    input piso_on,  // Removed incorrect semicolon
    input wire [7:0] data_in,
    output reg serial_out, // Removed extra comma
    output done
);

    reg [7:0] shift_reg;
    reg load;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'b0;
            load <= 1'b0;
            serial_out <= 1'b0; // Reset serial_out
        end else begin
            if (piso_on) begin
                shift_reg <= data_in;  // Load new data
                load <= 1'b1;
            end else if (piso_enable && load) begin
                serial_out <= shift_reg[0]; // Output LSB first
                shift_reg <= shift_reg >> 1; // Shift right
            end
        end
    end
	
    assign done = 1'b1;
	
endmodule

