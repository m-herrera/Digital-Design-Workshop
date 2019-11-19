module ps2controller_top(input logic rst, read_ack, PS2_CLK, PS2_DAT,
								output logic[7:0] received_data,
								output logic received);


ps2controller DUT(rst, read_ack, PS2_CLK, PS2_DAT, received, received_data);


endmodule