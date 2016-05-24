module pgu_4bit
(
	input [3:0] a, b,
	output [3:0] p, g
);
assign p = a ^ b;
assign g = a & b;

endmodule
