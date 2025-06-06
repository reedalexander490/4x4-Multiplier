module and2(	input a,b,
		output y);
	
	assign y = a & b;
	
endmodule


// full_adder.v Hugo Korte
// half adder module

module full_adder( input a, b, cin,
	 output cout, sum);

	wire cout1, cout2, sum_ha0;
	
	half_adder ha_0(a,b,sum_ha0,cout1); //makes a copy of the half_adder mod as ha_0
	// inputs are a, b
	// outputs are s = sum (HA0); c = cout(HA0)
	
	
	half_adder ha_1(cin, sum_ha0, sum, cout2);
	// inputs are cin, s = (sum_HA0)
	// outputs are sum (total sum) and cout 
 	
	assign cout = cout1 | cout2; 

endmodule

// half_adder.v Hugo Korte
// half adder module

module half_adder (    input a,b,
		       output sum, cout);
		       
	assign sum = a ^ b;
	assign cout = a & b;

endmodule

module mult_4x4 (
    input [3:0] m,  // Declare 4-bit input m
    input [3:0] q,  // Declare 4-bit input q
    input mult_on,
    output reg [7:0] S,  // Declare 8-bit output S
    output reg mult_done
);

wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15;
reg ground = 1'b0;

// AND gates for the first row of multiplication
and2 AND0(m[0], q[0], A0);
and2 AND1(m[1], q[0], A1);
and2 AND2(m[2], q[0], A2);
and2 AND3(m[3], q[0], A3);

// AND gates for the second row of multiplication
and2 AND4(m[0], q[1], A4);
and2 AND5(m[1], q[1], A5);
and2 AND6(m[2], q[1], A6);
and2 AND7(m[3], q[1], A7);

// FULL ADDER 0
wire cout0, sum0;
full_adder fa0(A1, A4, ground, cout0, sum0);

// FULL ADDER 1
wire cout1, sum1;
full_adder fa1(A2, A5, cout0, cout1, sum1);

// FULL ADDER 2
wire cout2, sum2;
full_adder fa2(A3, A6, cout1, cout2, sum2);

// FULL ADDER 3
wire cout3, sum3;
full_adder fa3(ground, A7, cout2, cout3, sum3);

// AND gates for the third row of multiplication
and2 AND8(m[0], q[2], A8);
and2 AND9(m[1], q[2], A9);
and2 AND10(m[2], q[2], A10);
and2 AND11(m[3], q[2], A11);

// FULL ADDER 4
wire cout4, sum4;
full_adder fa4(sum1, A8, ground, cout4, sum4);

// FULL ADDER 5
wire cout5, sum5;
full_adder fa5(sum2, A9, cout4, cout5, sum5);

// FULL ADDER 6
wire cout6, sum6;
full_adder fa6(sum3, A10, cout5, cout6, sum6);

// FULL ADDER 7
wire cout7, sum7;
full_adder fa7(cout3, A11, cout6, cout7, sum7);

// AND gates for the fourth row of multiplication
and2 AND12(m[0], q[3], A12);
and2 AND13(m[1], q[3], A13);
and2 AND14(m[2], q[3], A14);
and2 AND15(m[3], q[3], A15);

// FULL ADDER 8
wire cout8, sum8;
full_adder fa8(sum5, A12, ground, cout8, sum8);

// FULL ADDER 9
wire cout9, sum9;
full_adder fa9(sum6, A13, cout8, cout9, sum9);

// FULL ADDER 10
wire cout10, sum10;
full_adder fa10(sum7, A14, cout9, cout10, sum10);

// FULL ADDER 11
wire cout11, sum11;
full_adder fa11(cout7, A15, cout10, cout11, sum11);

// Assign final outputs

always @(*) begin
    if (mult_on) begin
	 S[0] = A0;
	 S[1] = sum0;
	 S[2] = sum4;
	 S[3] = sum8;
	 S[4] = sum9;
	 S[5] = sum10;
	 S[6] = sum11;
	 S[7] = cout11;
        mult_done = 1;
    end else begin
        S = 8'b00000000;  // If mult_on is 0, output 0
        mult_done = 0;
    end
end

endmodule

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

module top_multiplier(
	input clk, reset, start, in,
	output done, out
);

wire flag;
wire piso_on;
wire mult_on;
wire sipo_on;
wire sipo_done;
wire mult_done;

wire [3:0] A, B;
wire [7:0] mult_out;

fsm_control fsm (
	.clk(clk),
	.reset(reset),
	.start(start),
	.sipo_done(sipo_done),
	.mult_done(mult_done),
	.sipo_enable(sipo_on),
	.mult_enable(mult_on),
	.piso_enable(piso_on)
);

sipo sipo_mod(
	.clk(clk),
	.reset(reset),
	.serial_in(in),
	.shift_enable(sipo_on),
	.A(A),
	.B(B),	
	.sipo_done(sipo_done)
);

mult_4x4 mult(
	.m(A),
	.q(B),
	.mult_on(mult_on),
	.S(mult_out),
	.mult_done(mult_done)
);

piso piso_mod(
	.clk(clk),
	.reset(reset),
	.piso_enable(sipo_on),
	.piso_on(piso_on),
	.data_in(mult_out),
	.serial_out(out),
	.done(done)
);

assign mult_db = mult_out; 
assign A_db = A;
assign B_db = B; 

endmodule

