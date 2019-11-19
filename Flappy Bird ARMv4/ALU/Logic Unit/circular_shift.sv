module circular_shift(input logic [31:0] a,
					  input logic [3:0] b,
					  output logic [31:0] z);
	always_comb begin
		case (b)
		  0 : z=a;
		  1 : z={a[1:0],a[31:2]};
		  2 : z={a[3:0],a[31:4]};
		  3 : z={a[5:0],a[31:6]};
		  4 : z={a[7:0],a[31:8]};
		  5 : z={a[9:0],a[31:10]};
		  6 : z={a[11:0],a[31:12]};
		  7 : z={a[13:0],a[31:14]};
		  8 : z={a[15:0],a[31:16]};
		  9 : z={a[17:0],a[31:18]};
		  10 : z={a[19:0],a[31:20]};
		  11 : z={a[21:0],a[31:22]};
		  12 : z={a[23:0],a[31:24]};
		  13 : z={a[25:0],a[31:26]};
		  14 : z={a[27:0],a[31:28]};
		  15 : z={a[29:0],a[31:30]};
		  default z = a;
		endcase
	end
endmodule 
