module Game_principal(input logic botonSel,clk,botonMov,bontonReset,botonInicio);

debouncer #(100,8) debouncerBoton1( clk,botonSel, outSeleccion) ;//Este modulo se encarga del boton de seleccion

debouncer #(100,8) debouncerBoton2(clk,botonMov, outMovimiento); //Este modulo se encarga del movimiento

debouncer #(100,8) debouncerBoton3( clk,bontonReset, outReset); //Este modulo se encarga del reset

debouncer #(100,8) debouncerBoton4( clk,botonInicio, inicio); //Este modulo se encarga del reset


or_gate #(1) gate(outReset,resetLogGame,reset);

movimientoJugador conteo_posicion (outMovimiento,posicion_jugador); //Este maneja el mivimiento del jugador

timer conteo_segundos (clk,resetTimer, timeout); //maneja el conteo de todo


game_state_memory memoriaJuego(clk, reset, escritura,
						 net, data,data,
						  turn_out,
						  data_out,data_out2, win);//la memoria con modificaciones para manejar ciertas condiciones
						  
counter_GL #(1) contadorTurno(reset,clk_turno,1, turno);//lleva el conteo de el turno, el clk del turno es generado
//por la maquina de estados
counter_GL #(4) random_unit(0,clk,1, random);	//Genera un numero random
				 
data_turn turnoUsuario(turno,turn_out);

Mux_2 multiplexor_random(posicion_jugador,random,selrandom,data);//unidad que selecciona la posicion entre random y usuario

											 
ocupado ocupadoDetect( data_out2, actualOcupado); //detecta si el actual posicion esta ocupada

Game_logic logic_game(clk,reset,timeout,outSeleccion,inicio,actualOcupado,win,estados);

uoutput_Gamelogic salidaGameLogic(estados, escritura,selrandom,resetTimer,resetLogGame,clk_turno);


endmodule

