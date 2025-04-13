module mult_4x4_tb;
    reg [3:0] m, q;  // 4-bit inputs
    reg mult_on;  // Multiplication enable signal
    wire [7:0] S;  // 8-bit multiplication output
    wire mult_done;  // Done signal

    // Instantiate the module under test (MUT)
    mult_4x4 uut (
        .m(m),
        .q(q),
        .mult_on(mult_on),
        .S(S),
        .mult_done(mult_done)
    );

    initial begin
        // Initialize inputs
        m = 4'b0000;
        q = 4'b0000;
        mult_on = 0;
        
        // Apply test cases
        #10 m = 4'b0011; q = 4'b0010; mult_on = 1;  // 3 * 2 = 6
        #10 m = 4'b0101; q = 4'b0011; mult_on = 1;  // 5 * 3 = 15
        #10 m = 4'b0110; q = 4'b0110; mult_on = 1;  // 6 * 6 = 36
        #10 m = 4'b1111; q = 4'b1111; mult_on = 1;  // 15 * 15 = 225
        #10 mult_on = 0;  // Disable multiplication

        #10 $finish;  // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | m=%b, q=%b, mult_on=%b | S=%b, mult_done=%b", $time, m, q, mult_on, S, mult_done);
    end
endmodule
