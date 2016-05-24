`include "bit8_multiregister.v"
`include "multiregister.v"
module register_tester;

//inputs
reg clock = 0, reset = 0, e=1;
reg f1, f0;
reg [7:0] d;
//outputs
wire [7:0] q;

//instantiate 8bit module
//multiregister r1(clock, reset, f1, f0, 0, e, d, q);
bit8_multiregister r1(clock, reset, e, f1, f0, 0, d, q);

//test cases below
initial
begin

//$monitor("%4d Clock: %b, Input: %b,  Register: %b", $time, clock, d, q);
$display();
#5 reset = 1; reset = 0;
$display("Register Starts Empty");
#1 d = 8'b1010_1010; e =1;
#5 clock =1;
#5 clock =0;
$display("Input: %b, Register: %b", d, q);
$display();
//#5 clock = 0; reset = 0;


$display("Storing Input->Register");
//store signal
#1 f1 = 0; f0 = 1;
//input
#1 d = 8'b1010_1010; 
#5 clock = 1;
//$display("Input: %b, Register: %b", d, q);
#5 clock = 0;
$display("Input: %b, Register: %b", d, q);
$display();


$display("ARS Register");
//store signal
#1 f1 = 1; f0 = 1;
//input
#1 d = 8'b1010_1010;
#5 clock = 1;
#5 clock = 0;
$display("Input: %b, Register: %b", d, q);
$display();


$display("RHS Register");
//store signal
#1 f1 = 1; f0 = 0; 
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


