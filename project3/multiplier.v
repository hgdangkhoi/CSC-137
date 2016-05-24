`include "controller.v"
`include "data_path.v"
module multiplier
(
	input clock, reset, start,
	input [6:0] a_value, b_value,
	output [13:0] result,
	output done
);

wire pf1, pf0, bf1, bf0, af1, af0, m;
wire ea, eb, ep, e_counter;
wire [2:0] counter;
wire [7:0] b;

controller c1(clock, reset, start, b, counter, pf1, pf0, bf1, bf0, af1, af0, m, ea, eb, ep, e_counter, done);
data_path d1(clock, reset, ea, eb, ep, a_value, b_value, pf1, pf0, bf1, bf0, af1, af0, m, e_counter, result, counter, b);

endmodule
