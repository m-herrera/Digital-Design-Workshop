module output_game_logic(input [2:0] estado,output escritura,selrandom,resetTimer,resetLogGame,turno);

always_comb
begin
case(estado)
3'b000:begin escritura =0;selrandom=0;resetTimer =0;resetLogGame=0;turno =0;  end
3'b001:begin escritura =0;selrandom=0;resetTimer =0;resetLogGame=0;turno =0;   end
3'b010:begin escritura =0;selrandom=0;resetTimer =0;resetLogGame=0;turno =0;   end
3'b011:begin escritura =0;resetTimer =0;resetLogGame=0;turno =0;   end
3'b100:begin escritura =0;selrandom=1;resetTimer =0;resetLogGame=0;turno =0;   end
3'b101:begin escritura =1;resetTimer =0;resetLogGame=0;turno =0;   end
3'b110:begin escritura =0;selrandom=0;resetTimer =1;resetLogGame=0;turno =1;  end
3'b111:begin escritura =0;selrandom=0;resetTimer =1;resetLogGame=1;turno =0;  end
endcase
end
endmodule
