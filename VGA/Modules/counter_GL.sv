module counter_GL #(parameter bits=4)(input logic reset, 
												input logic clk,enable, 
												output logic[bits-1:0] count);
reg [bits-1:0] registro = 0;												
	always@ (posedge clk or posedge reset)
    if (reset)
	 begin
	 registro = 0;
      count <= registro;
		end
    else
      if (enable)
		begin
		registro = registro+1;
        count<=registro;
		  end
endmodule 