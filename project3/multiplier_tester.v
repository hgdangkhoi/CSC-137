`include "multiplier.v"
module multiplier_tester();

reg clock, reset, start;
reg [6:0] A, B;
wire [13:0] product;
wire done;

multiplier smult(clock, reset, start, A, B, product, done);

always
begin
    #5clock = ~clock;
end

initial begin
    start = 0;
    clock = 0;
    A = -8;
    B = -5;
    $display("time A       B        done");
    $display("===================================================");
    $monitor("%4d                   %b", $time, done);
    
    // reset the circuit
    $display("Reset circuit");
    reset = 1'b1;
    #10
    reset = 1'b0;
    
    
    $display("%4d %b %b", $time, A, B);
	$display("%4d -8      -5", $time);
    start = 1;
    #10
    start = 0;
    #150
    $display("%4d                   Result = %b", $time, product);
	
	//reset
    $display("Reset circuit");
    reset = 1;
    #10
    reset = 0;
    
	//testcase 2
    A = -5;
    B = -8;
    $display("%4d %b %b", $time, A, B);
	$display("%4d -5      -8", $time);
    start = 1;
    #10
    start = 0;
    #150
    $display("%4d                   Result = %b", $time, product);
    
	//reset
    $display("Reset circuit");
    reset = 1;
    #10
    reset = 0;
    
	//testcase 3
    A = 5;
    B = -2;
    $display("%4d %b %b", $time, A, B);
	$display("%4d 5       -2", $time);
    start = 1;
    #10
    start = 0;
    #150
    $display("%4d                   Result = %b", $time, product);

	//reset 
    $display("Reset circuit");
    reset = 1;
    #10
    reset = 0;
    
	//testcase 4
    A = -1;
    B = -1;
    $display("%4d %b %b", $time, A, B);
	$display("%4d -1      -1", $time);
    start = 1;
    #10
    start = 0;
    #150
    $display("%4d                   Result = %b", $time, product);
    
	//reset
    $display("Reset circuit");
    reset = 1;
    #10
    reset = 0;
    
	//testcase 5
    A = 1;
    B = 1;
    $display("%4d %b %b", $time, A, B);
	$display("%4d 1       1", $time);
    start = 1;
    #10
    start = 0;
    #150
    $display("%4d                   Result = %b", $time, product);
    
	//reset 
    $display("Reset circuit");
    reset = 1;
    #10
    reset = 0;
    
	//testcase 6
    A = 5;
    B = -11;
    $display("%4d %b %b", $time, A, B);
	$display("%4d 5       -11", $time);
    start = 1;
    #10
    start = 0;
    #150
    $display("%4d                   Result = %b", $time, product);
    $finish;
end

endmodule