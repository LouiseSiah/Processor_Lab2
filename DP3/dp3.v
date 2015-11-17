module dp3
(  //n = 8
	input clock, reset, Aload, Sub,
	input [1:0]Asel,
	input [n-1:0]dp1In, mInput,
	output Apos,
	output wire [n-1:0]Aeq0, mOutput,
	output wire [n-1:0]OutAsel, A, ProdSub  //erasable
);

parameter n = 8;

wire [n-1:0]outAsel, a, prodSub;
wire [n-1:0]data2, data1, data0;

//wiring //erasable
assign A = a;
assign OutAsel = outAsel;
assign ProdSub = prodSub;

//4to1 mux
assign outAsel = ({n{Asel[1]}} & {n{Asel[0]}} & 0)
			  |({n{Asel[1]}} & {n{!Asel[0]}} & data2)
			  |({n{!Asel[1]}} & {n{Asel[0]}} & data1)
			  |({n{!Asel[1]}} & {n{!Asel[0]}} & data0);

assign data2 = dp1In;
assign data1 = mInput;
assign data0 = prodSub;

//register 
register #(.n(8)) regA (clock, reset, Aload, outAsel, a); 

//subtractor
addSub #(.n(8)) addSubtractor (Sub, a, dp1In, prodSub);

//wiring real output
assign Aeq0 = ~(a);
assign Apos = !(a[n-1:n-1]);

endmodule



