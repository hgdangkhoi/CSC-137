module mod8_counter
(
	input clk, reset, e,
	output reg [2:0] cntr
);
//reg [2:0] cntr;
always@(posedge clk, posedge reset)
begin
	if (reset)
		cntr <= 3'b000;
	else if (e)
		cntr <= cntr + 1;
end
endmodule