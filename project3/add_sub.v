module add_sub
	(
	input [7:0] A,B,
	input m,
	output [7:0] S
	//output Cout
	);
	
	//Wire Set
	wire [7:0] G,P,C;
	reg Cin;
	reg [7:0] b_sub;
	//PG Unit

	always@(*)
	begin
		if (m == 1)
		begin
			assign b_sub = ~B;
			Cin = 1;
		end
		else
		begin
			assign b_sub = B;
			Cin = 0;
		end
	end
	
	assign G = A & b_sub; //Generate
	assign P = A ^ b_sub; //Propagate
	
	//Carry-generate Unit 1
	assign C[0] = G[0] | P[0] & Cin;
	assign C[1] = G[1] | P[1] & G[0] | P[1] & P[0] & Cin;
	assign C[2] = G[2] | P[2] & G[1] | P[2] & P[1] & G[0] | P[2] & P[1] & P[0] & Cin;
	assign C[3] = G[3] | P[3] & G[2] | P[3] & P[2] & G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & Cin;
	
	//Carry-generate Unit 2
	assign C[4] = G[4] | P[4] & C[3];
	assign C[5] = G[5] | P[5] & G[4] | P[5] & P[4] & C[3];
	assign C[6] = G[6] | P[6] & G[5] | P[6] & P[5] & G[4] | P[6] & P[5] & P[4] & C[3];
	assign C[7] = G[7] | P[7] & G[6] | P[7] & P[6] & G[5] | P[7] & P[2] & P[5] & G[4] | P[7] & P[6] & P[5] & P[4] & C[3];
	
	//assign Cout = C[7];

	//Sum Unit
	assign S[0] = P[0] ^ Cin;
	assign S[1] = P[1] ^ C[0];
	assign S[2] = P[2] ^ C[1];
	assign S[3] = P[3] ^ C[2];
	assign S[4] = P[4] ^ C[3];
	assign S[5] = P[5] ^ C[4];
	assign S[6] = P[6] ^ C[5];
	assign S[7] = P[7] ^ C[6];
	
endmodule
