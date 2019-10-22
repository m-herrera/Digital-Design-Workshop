module busy(input [1:0] memory,
			output logic is_busy);
			   
	assign is_busy = (memory == 2'b10  || memory == 2'b01);

	
endmodule
