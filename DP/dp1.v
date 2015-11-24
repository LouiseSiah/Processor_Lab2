module dp1 #(parameter n = 5, m = 8)
(
	input clock, reset, IRload, JMPmux, PCload, Meminst,
	input [m-1:0]IRin,
	output [n-1:0]Address, //OutIncre, OutJMP, PC40, //erasable from outInre
	output [m-1:0]IRout
);


wire [n-1:0]address, outIncre, outJMP, pC40;
wire [m-1:0]iRout;
//wire clock;
//assign clock = CLOCK_50;

//eraseable
assign IRout = iRout;
assign Address = address;
//assign OutIncre = outIncre;
//assign OutJMP = outJMP;
//assign PC40 = pC40;

register #(.n(8)) IR (clock, reset, IRload, IRin, iRout); 
register #(.n(5)) PC (clock, reset, PCload, outJMP, pC40);
increment #(.n(5)) inc (pC40, outIncre);
assign outJMP = JMPmux? (iRout[4:0]): outIncre;
assign address = Meminst? (iRout[4:0]): pC40;

endmodule
