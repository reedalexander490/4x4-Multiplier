// half_adder.v Hugo Korte
// half adder module

module half_adder (    input a,b,
		       output sum, cout);
		       
	assign sum = a ^ b;
	assign cout = a & b;

endmodule
