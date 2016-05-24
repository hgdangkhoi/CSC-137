module controller
(
	input clock, reset, start,
	input [7:0] b,
	input [2:0] counter,
	output reg pf1, pf0, bf1, bf0, af1, af0, m, 
	output reg ea, eb, ep,
	output reg e_counter,
	output reg done 
);
reg [1:0] current_state, next_state;
parameter	Idle = 2'b00,
			Check = 2'b01,
			Add = 2'b10;

//////////////////OG////////////////////
always@(b or counter or start or current_state)
begin
	case (current_state)
		Idle: begin
			if(start == 1'b1) begin	
				af1 <= 0; //LOAD
				af0 <= 1;
				bf1 <= 0; // LOAD
				bf0 <= 1;
				//{ea, eb, ep} = 3'b110;
				ea <= 1;
				eb <= 1;
				ep <= 0;
				done <= 1'b0;
			end
			else begin
				//{ea, eb, ep} = 3'b000;
				ea <= 0;
				eb <= 0;
				ep <= 0;
			end
		end		
		
		Check: begin
			if (counter == 7) begin
				done <= 1'b1;
				e_counter <= 1'b0;
				//{ea, eb, ep} = 3'b000;
				ea <= 0;
				eb <= 0;
				ep <= 0;
			end
			else begin
				if (b[1] ^ b[0] == 1'b0) begin
					//{ea, eb, ep} <= 3'b011;
					ea <= 0;
					eb <= 1;
					ep <= 1;
					pf1 <= 1; //ARS
					pf0 <= 1; 
					bf1 <= 1; //RS
					bf0 <= 0;
					e_counter <= 1'b1;
				end
				else begin
					//{ea, eb, ep} <= 3'b001;
					ea <= 0;
					eb <= 0;
					ep <= 1;
					pf1 = 0; //LOAD
					pf0 = 1;
					e_counter <= 1'b0;
					if ({b[1], b[0]} == 2'b01)
						m <= 1'b0; //ADD
					else 
						m <= 1'b1; //SUB
				end
			end
		end
		
		Add: begin
			//{ea, eb, ep} <= 3'b011;
			ea <= 0;
			eb <= 1;
			ep <= 1;
			pf1 <= 1;  //ARS
			pf0 <= 1; 
			bf1 <= 1;  //RS
			bf0 <= 0;
			e_counter <= 1'b1;
		end
	endcase
end

//NSG//
always@(current_state or counter or start or b)
begin
	case(current_state)
		Idle: 	begin
					if (start == 1'b1)
						next_state <= Check;
					else
						next_state <= Idle;
				end

		Check:	if (counter == 7)
					next_state <= Idle;
				else begin
					if (b[1] ^ b[0] == 1'b0)
						next_state <= Check;
					else
						next_state <= Add;
				end
				
		Add:	
				next_state <= Check;
	endcase
end

//flip-flop
always@(posedge clock or posedge reset)
begin
	if (reset == 1)
		current_state <= 0;
	else
		current_state <= next_state;
end
endmodule	
				
			