module Processor
(
	input  CLOCK_50, reset, Enter, cheat,
	input  [7:0] Minput,
	output Halt,
	output [7:0] Moutput,
	output [3:0]DisplayState
	
);

	wire IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	wire [1:0]Asel;
	//wire [7:0]Minput,
	//wire [7:0]Moutput,
	wire [2:0]IR75;
	wire Aeq0, Apos;
	wire [7:0] RamToIR, OutAsel, A, ProdSub; // erasable
	wire [4:0] Address, IR40, OutIncre, OutJMP, PC40; // erasable

dataPath myDP( CLOCK_50, reset, IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, cheat, Asel, Minput,
				Moutput, IR75, Aeq0, Apos,
				RamToIR, OutAsel, A, ProdSub, // erasable
				Address, IR40, OutIncre, OutJMP, PC40  // erasable
			);
			
controlUnit myCU( CLOCK_50, reset, Enter,
				  IR75, Aeq0, Apos, //status signals
			      //control signals
				  IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Halt, Asel,
				  DisplayState //erasable
				);


endmodule
