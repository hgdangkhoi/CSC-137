`include "nrzi_nsg.v"
`include "nrzi_og.v"
`include "flip_flop.v"
module nrzi
(
	input clock, reset, x,
	output z
);
wire z;
wire q;
wire d;

nrzi_nsg nsg(x, q, d);
nrzi_og og(x, q, z);
flip_flop ff(clock, reset, d, q);

/*always@(posedge clock, posedge reset)
begin
	if (reset == 1)
		q <= 1'b0;
	else 
		q <= d;
end
*/
endmodule