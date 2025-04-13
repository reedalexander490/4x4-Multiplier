module tb_top_module;
    reg clk;
    reg reset;
    reg start;
    reg in;
    wire done;
    wire out;

    top_module uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .in(in),
        .done(done),
        .out(out)
    );
    // Clock 
    always begin
        #5.61 clk = ~clk;  // 100 MHz clock with 10 ns period
    end
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        start = 0;
        in = 0;
        // Apply reset
        $display("Applying reset");
        reset = 1;
        #10;
        reset = 0;
     
        start = 1;
        #10;  // Wait for one clock cycle
        start = 0;
	//Serial In
        in = 1;  // Shift in data 1
        #10;
        in = 0;  // Shift in data 0
        #10;
        in = 1;  // Shift in data 1
        #10;
        in = 1;  // Shift in data 1
        #10;

        $display("Checking done signal");
        #10;
        $display("Done: %b", done);
        #100;
        $finish;
    end
endmodule

