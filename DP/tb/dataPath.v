module dataPath
(
	input clock, reset, IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub,
	input [1:0]Asel,
	input [7:0]Minput,
	output [7:0]Moutput,
	output [2:0]IR75,
	output Aeq0, Apos,
	output [7:0] RamToIR, OutAsel, A, ProdSub, // erasable
	output [4:0] Address, IR40, OutIncre, OutJMP, PC40  // erasable
);

wire [7:0] ramToIR, iRout; 
wire [4:0] address;

assign IR75 = iRout[7:5];
assign IR40 = iRout[4:0];
assign RamToIR = ramToIR;
assign Address = address;
//*************** part 1 - Instruction Cycle ***********************
dp1 #(.n(5), .m(8)) DP1 (clock, reset, IRload, JMPmux, PCload, Meminst, ramToIR,
						 address, OutIncre, OutJMP, PC40, iRout);
				
//************************ ram **************************************
ram RAM (clock, MemWr, address, Moutput, ramToIR);

//*************** part 3 - Instruction Set **************************
dp3 #(.n(8)) DP3 (clock, reset, Aload, Sub, Asel, ramToIR, Minput,
				   Apos, Aeq0, Moutput, OutAsel, A, ProdSub);
endmodule
