module top_module(
	input clk, reset, start, in,
	output done, out
);

wire flag;
wire piso_on;
wire mult_on;
wire sipo_on;
wire sipo_done;
wire mult_done;
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
endmodule
