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
