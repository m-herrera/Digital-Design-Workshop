module Cshift#(parameter N=8)(input logic [N-1:0] a ,
input logic [2:0] b,
output logic [N-1:0] z);
always_comb begin

case (b)
  0 : z=a;
  1 : z={a[0:0],a[N-1:1]};
  2 : z={a[1:0],a[N-1:2]};
  3 : z={a[2:0],a[N-1:3]};
  4 : z={a[3:0],a[N-1:4]};
  5 : z={a[4:0],a[N-1:5]};
  6 : z={a[5:0],a[N-1:6]};
  7 : z={a[6:0],a[N-1:7]};
endcase
end
endmodule 