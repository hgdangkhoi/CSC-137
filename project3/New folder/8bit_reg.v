module reg_8bit (clock, reset, d, f, q);
input clock;	//clock
input reset;	//reset register
input [7:0] d;	//8bit input
input [1:0] f;	//control signal
output reg [7:0] q; //8bit output

always@ (posedge clock)

begin
  //reset
  if (reset) begin
	q <= 8'b0000_0000;
  end

  else begin
    case (f)
	//load
 	2'b01: q <= d;
	//shr
  	2'b10: q <= {1'b0, q[7:1]};
	//ars
	2'b11: q <= {q[7], q[7:1]};
    endcase 
  end		
end
endmodule
