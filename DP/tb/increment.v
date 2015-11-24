module increment #(parameter n = 5)
(
	input [n-1:0]Input,
	output [n-1:0]Output
);

wire [n-1:0]product;

assign product = Input + 1;
assign Output = product;

endmodule

