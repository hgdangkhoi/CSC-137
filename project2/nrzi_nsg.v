module nrzi_nsg
(
	input x, q,
	output d
);
assign d = x ^~ q;
//assign d = ~x & ~q | x & q;
endmodule