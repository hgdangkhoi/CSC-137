`include "pgu_4bit.v"
`include "cgu_4bit.v"
`include "su_4bit.v"
module cla_4bit
(
	input [3:0] a, b,
	input ci,
	output [3:0] s,
	output c3, c2, c1, c0
);
wire [3:0] c, g, p;
assign c0 = c[0];
assign c1 = c[1];
assign c2 = c[2];
assign c3 = c[3];

pgu_4bit pgu(a, b, p, g);
cgu_4bit cgu(p, g, ci, c3, c2, c1, c0);
su_4bit su(p, c2, c1, c0, ci, s);

endmodule