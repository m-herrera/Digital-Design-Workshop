module time_renderer(input [9:0] pixelx, pixely,
					 input [4:0] _time,
					 output logic is_visible);

	assign is_visible = (pixely >= 0 && pixely <= 3) && (pixelx <= 'd640 -'d27*_time);

endmodule 