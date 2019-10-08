module sync #(parameter N=7)(input logic clk, rst,
										input logic[N:0] sync_pos, end_size,
										output logic[N:0] count,
										output logic sync);

										
logic reset, in_sync, endline;
										
counter #(N) Counter(clk, reset, count);

comparator #(N) HSync(.a(count), .b(sync_pos), .equal(), .agtb(), .altb(in_sync));

comparator #(N) EndLine(.a(count), .b(end_size), .equal(endline), .agtb(), .altb());

assign reset = rst || endline;

assign sync = !in_sync;

endmodule
