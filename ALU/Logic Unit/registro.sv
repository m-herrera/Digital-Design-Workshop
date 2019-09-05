module registro #(parameter N=8)(input  logic [N-1:0] a,b,input  logic [3:0] sel,input  logic clk,output logic [N + N + 1:0] c);
always@ (posedge clk)
begin
c = { a,b,sel};
end
endmodule 