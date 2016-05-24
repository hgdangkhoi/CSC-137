// Khoi Hoang
// Project 2 - CSC 137

/////// NSG ///////
module nrzi_nsg
(
	input x, q,
	output d
);
//assign d = x ^~ q;
assign d = ~x & ~q | x & q;
endmodule

/////// OG ///////
module nrzi_og
(
	input x, q,
	output z
);
assign z = q ^ x;
//assign z = ~q & x | q & ~x;
//assign z = ~x & ~q | x & q;
endmodule

/////// FF ///////
module flip_flop
(
	input clock, reset, d,
	output reg q
);
always@(posedge clock, posedge reset)
begin
	if (reset == 1)
		q <= 0;
	else 
		q <= d;
end
endmodule

/////// NRZI Mealy ///////
`include "nrzi_nsg.v"
`include "nrzi_og.v"
`include "flip_flop.v"
module nrzi
(
	input clock, reset, x,
	output z
);
wire z;
wire q;
wire d;

nrzi_nsg nsg(x, q, d);
nrzi_og og(x, q, z);
flip_flop ff(clock, reset, d, q);

endmodule

/////// Testbench ///////
`include "nrzi.v"
module nrzi_testbench();
reg clock, reset, x;
wire z;
nrzi u1(clock, reset, x, z);
initial begin
//$monitor ("%4d: 	       z = %b", $time, z);
clock = 0;
reset = 1; //reset flip-flops
x = 0;
//z = 1;
#10 reset = 0; //end reset
end
always
begin
#5clock = ~clock; //clock signal with period 10
end
initial begin
//test case 1: X = F163
$display("	X = F161");
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
//end test case 1
#20 reset = 1; x = 0; clock =0; $display("%4d: x = %b reset = %b clock = %b", $time, x, reset, clock); //reset clock
//test case 2: X = CF0C
$display("	X = CF0C");
#5 x = 0; reset = 0;$display("%4d: x = %b", $time, x); //end reset and start test case 2
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);

#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);

#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);

#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

//end test case 2
#20 reset = 1; x = 0; clock =0; $display("%4d: x = %b reset = %b clock = %b", $time, x, reset, clock); //reset clock
//test case 3: X = 8C00
$display("	X = 8C00");
#5 x = 0; reset = 0;$display("%4d: x = %b", $time, x); //end reset and start test case 3
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 0; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);
#5 x = 1; $display("%4d: x = %b", $time, x);
#5 $display("%4d: 	       z = %b", $time, z);

//test case 3: X = 8C00
#10 $finish;
end
endmodule

