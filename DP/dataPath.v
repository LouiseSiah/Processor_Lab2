module dataPath
(
	input IRload, JMPmux, PCload, Meminst, MemWr, 
	input [1:0]Asel
	input [7:0]data1, data2, data3, data0,
	output wire [7:0]muxOP
);

assign muxOP = ({8{select[1]}} & {8{select[0]}} & data3)
			  |({8{select[1]}} & {8{!select[0]}} & data2)
			  |({8{!select[1]}} & {8{select[0]}} & data1)
			  |({8{!select[1]}} & {8{!select[0]}} & data0);
			  
endmodule
