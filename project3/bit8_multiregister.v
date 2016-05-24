module bit8_multiregister
(
	input clock, reset, e,
	input f1, f0, linput,
	input [7:0] q,
	output reg [7:0] z
);

always@(posedge clock, posedge reset)
begin
	if (reset == 1)
		z <= 0;
	else if (e)
	begin
		case ({f1, f0})
		//2'b00: z <= 0;
		2'b01: z <= q;
		2'b10: z <= {linput, z[7:1]}; //right shift
		2'b11: z <= {z[7], z[7:1]}; //arithmetic right shift
		endcase
	end
end	
endmodule
		