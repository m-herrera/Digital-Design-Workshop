module Game_logic( input clk,rst,timeout,seleccion,inicio,ocupado,ganado, output logic [2:0] estados);
logic [2:0] state,next;

always_ff @(posedge clk,posedge rst)
if(rst) state<= 'b0;
else begin 
state<=next;
estados<=next;
end

always_comb
case (state)
3'b000: begin if(~inicio) begin next = 3'b000; end else next = 3'b001;  end
3'b001 :begin if(seleccion) next = 3'b011; else next = 3'b010;   end
3'b010: begin if(timeout) next = 3'b100; else next = 3'b001;   end
3'b011:begin  if(ocupado) next = 3'b001; else next = 3'b101;   end
3'b100:begin   next = 3'b011;   end
3'b101:begin  next = 3'b110;    end
3'b110:begin  if(~ganado) next = 3'b001; else next = 3'b111;   end
3'b111:begin  next = 2'b000;   end
default:begin next = 2'b00; end
endcase
endmodule 