module interface_unit
(
	input clock, reset, start_asyn, done,
	output reg start, done_moore
);

//flipflop
always@(posedge clock or posedge reset or posedge done)
begin
	if (reset == 1 || done == 1)
		start <= 1'b0;
	else
		start <= start_asyn;
end

//Moore output
always@(posedge clock or posedge reset or posedge start_asyn)
begin
	if(reset == 1 || start_asyn == 1)
		done_moore = 1'b0;
	else
	if (done == 1)
		done_moore <= done;
end
endmodule
