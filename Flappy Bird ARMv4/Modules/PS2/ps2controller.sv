module ps2controller(input logic clk, rst, send,
							input logic[7:0] command,
							output logic received, start_enable, count_enable, count_rst,
							output logic [7:0] received_data, data,
							input logic PS2_CLK, PS2_DAT,
							output logic[3:0] count);
							

	//logic start_enable, count_enable, count_rst;							
	//logic[3:0] count;
	//logic[7:0] data;
	
	assign start_enable = !PS2_DAT && !count_enable;
								
	counter #(4) bitCounter(PS2_CLK, count_rst, count_enable, count);

	always_ff @(negedge PS2_CLK)
		begin
			if(rst)
				begin
				count_enable <= 0;
				count_rst = 1;
				received <= 0;
				data <= '0;
				
				end
			if(start_enable)
				count_enable <= 1;
			case(count)
				4'd0:count_rst <= 0; //First bit
				4'd1:data[0]<=PS2_DAT;
				4'd2:data[1]<=PS2_DAT;
				4'd3:data[2]<=PS2_DAT;
				4'd4:data[3]<=PS2_DAT;
				4'd5:data[4]<=PS2_DAT;
				4'd6:data[5]<=PS2_DAT;
				4'd7:data[6]<=PS2_DAT;
				4'd8:data[7]<=PS2_DAT;
				4'd9:received<=1'b1; //Parity bit
				4'd10:begin received <= 0; count_rst <= 1; count_enable <= 0; end //Ending bit
			endcase
		end
	always@(posedge received)
		received_data <= data;
endmodule