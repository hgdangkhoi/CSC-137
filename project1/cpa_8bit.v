`include "cla_4bit.v"
module cpa_8bit
(
	input [7:0] a, b,
	input ci,
	output [7:0] s,
	output c6, c7
);


cla_4bit cla1(a[3:0], b[3:0], ci, s[3:0], c3, c2, c1, c0);
cla_4bit cla2(a[7:4], b[7:4], ci, s[7:4], c7, c6, c5, c4);

endmodule