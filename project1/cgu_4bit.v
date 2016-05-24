module cgu_4bit
(
	input [3:0] p, g,
	input ci,
	output c3, c2, c1, c0	
);

wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
//c0
assign w0 = p[0] & ci;
assign c0 = g[0] | w0;
//structure model for c1
nor n1(w1, g[1], g[0], ci);
nor n2(w2, g[1], g[0], p[0]);
nor n3(w3, g[1], p[1]);
nor n4(c1, w1, w2, w3);
//c2
assign w4 = p[2] & p[1] & p[0] & ci;
assign w5 = p[2] & p[1] & g[0];
assign w6 = p[2] & g[1];
assign c2 = g[2] | w6 | w5 | w4;
//c3
assign w7 = p[3] & p[2] & p[1] & p[0] & ci;
assign w8 = p[3] & p[2] & p[1] & g[0];
assign w9 = p[3] & p[2] & g[1];
assign w10 = p[3] & g[2];
assign c3 = g[3] | w10 | w9 | w8 | w7;

endmodule