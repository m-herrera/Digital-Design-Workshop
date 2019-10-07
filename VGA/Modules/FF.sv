module FF #(parameter N=1)
(input logic clk,rst,enable,
input logic [N-1:0]D,
output logic [N-1:0] Q);

always_ff @(posedge clk,posedge rst)
if(rst) Q<='b0;
else 
begin
if(enable)
Q<=D;
else
Q<=Q;
end
endmodule 