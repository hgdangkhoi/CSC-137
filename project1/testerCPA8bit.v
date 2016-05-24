`include "cpa_8bit.v"
module testerCPA8bit();
reg [7:0] a, b;
reg ci;
wire [7:0] s;
wire c6, c7;

cpa_8bit cpa(a, b, ci, s, c6, c7);
initial begin
$display("%4s  %8s  %8s  %s   %s  %8s", "Time", "a", "b", "ci", "co", "s");
$monitor("%4d  %8b  %8b   %b   %b%b  %8b", $time, a, b, ci, c6, c7, s);

a = 8'h02; b = 8'h03; ci = 1'b0;
#10
a= 8'h00; b = 8'hFF; ci = 1'b1;
#10
a = 8'h55; b = 8'hAA; ci = 1'b0;
#10
a = 8'h55; b = 8'hAA; ci = 1'b1;
#10
a = 8'hFF; b = 8'hFF; ci = 1'b1;
#10

$finish;
end
endmodule
