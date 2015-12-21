module addSub ( Sub, x, y, Output);

parameter n = 8;
input Sub;
input [n-1:0]x, y;
output [n-1:0]Output;

wire [n-1:0]X, Y, product;

assign product = Sub? (X-Y):(X+Y);
assign Output = product;
assign X = x;
assign Y = y;

endmodule

//module addSub(
//	input 	[7:0] A, B,
//	input	Sub,
//	output	reg	[7:0] RESULT
//);
//
//	always @ (Sub, A, B)
//	begin
//		if(Sub)	RESULT = A - B;
//		else	RESULT = A + B;
//	end
//	
//endmodule
