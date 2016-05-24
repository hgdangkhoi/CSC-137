module flip_flop
(
	input clock, reset, d,
	output reg q
);
always@(posedge clock, posedge reset)
begin
	if (reset == 1)
		q <= 0;
	else 
		q <= d;
end
endmodule