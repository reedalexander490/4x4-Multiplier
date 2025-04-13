module fsm_control (
    input wire clk,
    input wire reset,
    input wire start,          // External start signal
    input wire sipo_done,
    input wire mult_done,
    output reg sipo_enable,
    output reg mult_enable,
    output reg piso_enable 
);

    parameter IDLE    = 2'b00;
    parameter RECEIVE = 2'b01;
    parameter COMPUTE = 2'b10;
    parameter OUTPUT  = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // State Logic & Output Control
    always @(*) begin
        // Default outputs
        sipo_enable = 1'b0;
        mult_enable = 1'b0;
        piso_enable = 1'b0; 

        next_state  = state;

        case (state)
            IDLE: begin
                if (start) 
                    next_state = RECEIVE;
            end

            RECEIVE: begin
                sipo_enable = 1'b1;
                if (sipo_done)
                    next_state = COMPUTE;
            end

            COMPUTE: begin
                mult_enable = 1'b1; 
                if (mult_done)
                    next_state = OUTPUT;
            end

            OUTPUT: begin
                piso_enable = 1'b1;
            end

            default: next_state = IDLE;
        endcase
    end

endmodule
