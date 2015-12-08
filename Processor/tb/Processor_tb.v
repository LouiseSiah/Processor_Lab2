module Processor_tb();

Processor mine
(
	input  clock, reset, Enter,
	input  [7:0] Minput,
	output Halt,
	output [7:0] Moutput,
	output [3:0]DisplayState
	
);

//input reg
	reg  clock, reset, Enter;
	reg  [7:0] Minput;

//output wire
	wire Halt;
	wire [7:0] Moutput;
	wire [3:0]DisplayState;