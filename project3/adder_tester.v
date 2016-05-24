`include "add_sub.v"
module adder_tester;
reg [7:0] a, b;
reg ci, m;
wire [7:0] s;


add_sub a1(a, b, ci, m, s);
initial begin
$display("%4s  %8s  %8s  %8s", "Time", "a", "b", "s");
$monitor("%4d  %b  %b   %b  %8b", $time, a, b, ci, s);

a = 8'h00; b = 8'b11111000; ci = 1'b1;  m = 1;
#10
a= 8'h02; b = 8'h05; ci = 1'b1; m =1;
//assign b_sub = ~b;
#10 
/*a = 8'h55; b = 8'hAA; ci = 1'b0;
#10
a = 8'h55; b = 8'hAA; ci = 1'b1;
#10
a = 8'hFF; b = 8'hFF; ci = 1'b1;
#10
*/
$finish;
end
endmodule
