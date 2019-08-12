module counter
  #(   parameter N = 2)   ( input               clk,
    input               reset,
     output   reg [N-1:0] out);
initial
out=0;
// up counter
always @(posedge clk or posedge reset)
begin
if(reset)
 out <= 0;
else
 out <= out + 1;
end 

endmodule
 