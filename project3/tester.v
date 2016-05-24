`include "data_path.v"
module tester();
reg clock, reset, e;
reg [6:0] a_value, b_value;
wire [7:0] a, b, p, sum_diff;
wire [2:0 ]counter;
wire [13:0] result;
wire flag, x;
reg pf1, pf0, bf1, bf0, af1, af0, m, ci;

data_path d1(clock, reset, e, a_value, b_value, pf1, pf0, bf1, bf0, af1, af0, m, ci, flag, x, result, a, b, p, sum_diff, counter);


initial begin
clock = 1;
reset = 1;
e = 1;
$display("%4s  %8s  %8s", "Time", "a", "b");
$monitor("result = %b", result);
end

initial begin
$display();
#5 clock = 0; reset = 0;

$display("Storing A->Register");
//store signal
//input
#1 a_value = 7'b1111000; af1 = 0; af0 = 1;//b_value = 7'b1111011; 
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", a_value, a);
$display("Input: %b, Register: %h", a_value, a);
$display();

$display("Storing B->Register");
//store signal
#1 bf1 = 0; bf0 = 1;
//input
#1 b_value = 7'b1111011; 
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", b_value, b);
$display("Input: %b, Register: %h", b_value, b);
$display();

/*$display("Storing P+A");
//store signal
#1 reset = 1;
#1 reset = 0;
#1 pf1 = 0; pf0 = 1; m=0; ci = 0; 
//input 
#5 clock = 1;
#5 clock = 0;
$display("P <= P + A: P = %b sum_diff = %b a = %b", p, sum_diff, a); 
$display();*/
//$monitor("Time= %4d P = %b sum = %b", $time, p, sum_diff);

$display("Storing P-A");
//store signal
#1 pf1 = 0; pf0 = 1; m=1; ci = 1;
//input
#5 clock = 1;
#5 clock = 0;
$display("P <= P - A: P = %b", p); 
$display();

$display("Storing P+A");
//store signal
#1 pf1 = 0; pf0 = 1; m=0; ci = 0; 
//input 
#5 clock = 1;
#5 clock = 0;
$display("P <= P + A: P = %b", p); 
$display();

$display("Shift P//B");
//store signal
#1 pf1 = 1; pf0 = 1; bf1 = 1; bf0 = 0;

//input
#5 clock = 1;
#5 clock = 0;
$display("ARS P//B = %b//%b", p,b); 
$display();

#5 $display("counter = %b", counter);
#5 clock = 1;
#5 clock = 0;
#5 e =0 ;
#5 $display("counter = %b, e = %b", counter, e);
#5 clock = 1;
#5 clock = 0;
#5 e = 1; 
#5 clock = 1;
#5 clock = 0;
#5 $display("counter = %b, e = %b", counter, e);
#5 reset = 1;
#5 reset = 0; $display("A = %b, B = %b, P = %b, Counter = %b", a,b,p,counter);



$finish;
end
endmodule 