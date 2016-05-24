module su_4bit
(
	input [3:0] p, 
	input c2, c1, c0, ci,
	output [3:0] s	
);
assign s[0] = p[0] ^ ci;
assign s[1] = p[1] ^ c0;
assign s[2] = p[2] ^ c1;
assign s[3] = p[3] ^ c2;
//assign s = p ^ c;
endmodule