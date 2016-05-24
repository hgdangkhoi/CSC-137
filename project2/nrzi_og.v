module nrzi_og
(
	input x, q,
	output z
);
assign z = q ^ x;
//assign z = ~q & x | q & ~x;
//assign z = ~x & ~q | x & q;
endmodule