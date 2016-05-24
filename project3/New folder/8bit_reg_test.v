`include "8bit_reg.v"

module reg_8bit_test;

//inputs
reg clock = 0, reset = 0;
reg [1:0] f;
reg [7:0] d;
//outputs
wire [7:0] q;

//instantiate 8bit module
reg_8bit u1(clock, reset, d, f, q);

//test cases below
initial
begin

//$monitor("%4d Clock: %b, Reset: %b,  Output: %b", $time, clock, reset, q);
$display();
$display("Register Starts Empty");
#1 d = 8'b1010_1010;
$display("Input: %b, Register: %b", d, q);
$display();
#5 clock = 0; reset = 0;


$display("Storing Input->Register");
//store signal
#1 f = 2'b01;
//input
#1 d = 8'b1010_1010; 
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", d, q);
$display();


$display("ARS Register");
//store signal
#1 f = 2'b11;
//input
#1 d = 8'b1010_1010;
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", d, q);
$display();


$display("RHS Register");
//store signal
#1 f = 2'b10; 
//input
#1 d = 8'b1010_1010; 
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", d, q);
$display();


$display("Reset Register to Zero");
//reset register
#1 reset = 1;
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", d, q);
$display();

#10 $finish;
end
endmodule


