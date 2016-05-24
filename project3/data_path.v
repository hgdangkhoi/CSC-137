`include "bit8_multiregister.v"
`include "mod8_counter.v"
`include "add_sub.v"
module data_path
(
	input clock, reset, 
	input ea, eb, ep,
	input [6:0] a_value, b_value,
	input pf1, pf0, bf1, bf0, af1, af0, m, 
	input e_counter,
	output [13:0] result,
	output [2:0] counter,
	output [7:0] b
);
wire [7:0] a, b, p, sum_diff;
assign result = {p[6:0], b[7:1]};

mod8_counter c1(clock, reset, e_counter, counter);

bit8_multiregister r1(clock, reset, ea, af1, af0, 0, {a_value[6], a_value}, a);
bit8_multiregister r2(clock, reset, eb, bf1, bf0, p[0], {b_value, 1'b0}, b);
bit8_multiregister r3(clock, reset, ep, pf1, pf0, p[7], sum_diff, p);

//calculate sum_diff
add_sub a1(p, a, m, sum_diff);
	
endmodule

