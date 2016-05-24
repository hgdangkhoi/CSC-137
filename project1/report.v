module pgu_4bit
(
	input [3:0] a, b,
	output [3:0] p, g
);
assign p = a ^ b;
assign g = a & b;

endmodule

/////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////

module su_4bit
(
	input [3:0] p, 
	input c2, c1, c0, ci,
	output [3:0] s,
	
);
assign s[0] = p[0] ^ ci;
assign s[1] = p[1] ^ c0;
assign s[2] = p[2] ^ c1;
assign s[3] = p[3] ^ c2;
//assign s = p ^ c;
endmodule

////////////////////////////////////////////////////////

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

/////////////////////////////////////////////////////////

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

/////////////////////////////////////////////////////////

Chronologic VCS simulator copyright 1991-2014
Contains Synopsys proprietary information.
Compiler version I-2014.03-2; Runtime version I-2014.03-2;  Mar  7 21:39 2016
Time         a         b  ci   co         s
   0  00000010  00000011   0   00  00000101
  10  00000000  11111111   1   11  00000000
  20  01010101  10101010   0   00  11111111
  30  01010101  10101010   1   11  00000000
  40  11111111  11111111   1   11  11111111
$finish called from file "testerCPA8bit.v", line 24.
$finish at simulation time                   50
           V C S   S i m u l a t i o n   R e p o r t 
Time: 50
CPU Time:      0.550 seconds;       Data structure size:   0.0Mb
Mon Mar  7 21:39:56 2016
