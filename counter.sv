module counter
  #(   parameter N = 2)   ( input               clk,
    input               reset,
     output   reg [N-1:0] out);
reg [3:0] counter_up;

// up counter
always @(posedge clk or posedge reset)
begin
if(reset)
 counter_up <= 4'd0;
else
 counter_up <= counter_up + 4'd1;
end 
assign out = counter_up;
endmodule
 