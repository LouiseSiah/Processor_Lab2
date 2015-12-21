module ProcessorHW
(
	input  CLOCK_50,
	input [3:0]KEY, 
	input [9:0]SW,
	output wire [9:0]LEDR,
	output wire [7:0]LEDG
);

oneSecClock myClock ( CLOCK_50, KEY[0],clock);   

Processor HW(clock, KEY[0], SW[9], SW[8], SW[7:0], 
			 LEDR[9], LEDR[7:0], LEDG[3:0]);
/*(
			CLOCK_50, reset, Enter, cheat,[7:0] Minput,
			Halt, [7:0] Moutput, [3:0] DisplayState,

);*/

endmodule
