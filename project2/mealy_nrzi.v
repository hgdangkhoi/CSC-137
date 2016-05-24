module mealy_nrzi
(
	input clock, reset, x,
	output reg z
);

parameter 	A = 1'b0,
			B = 1'b1;
reg current_state, next_state;
//wire d, q;
always@(*)
begin
assign next_state = current_state ^~ x; //Next state generator (NSG)
assign z = current_state ^ x; //output generator (OG)
//assign z = current_state ^~ x;
//$monitor ("%4d: CS = %b x = %b NS = %b clock = %b z = %b", $time, current_state, x, next_state, clock, z);
//assign z = current_state;
//assign z = current_state ^~ x;
end



/*
always@(*)
begin	
	casex (current_state)
	A:	if (x == 1) begin
			next_state = A;
			z = 1;
		end
		else begin
			next_state = B;
			z = 0;
		end
	B:	if (x == 1) begin
			next_state = B;
			z = 0;
		end
		else begin
			next_state = A;
			z = 1;
		end
	default: begin
		next_state = 2'bxx;
		z = 1'bx;
		end
	endcase
	//$monitor ("%4d: CS = %b x = %b NS = %b clock = %b z = %b", $time, current_state, x, next_state, clock, z);
end
*/
//flip-flops
always@(posedge clock, posedge reset)
begin
	if (reset)
		current_state <= A;
	else
		current_state <= next_state;
	//$monitor ("%4d: CS = %b x = %b NS = %b clock = %b z = %b", $time, current_state, x, next_state, clock, z);
end
endmodule

