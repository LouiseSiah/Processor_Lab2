module ram (clock, WE, address, Input, Output);
 
	input clock, WE;
	input [4:0]address;
	input [7:0]Input;
	output reg [7:0]Output;

reg [7:0]register[31:0];

always@(posedge clock)
begin
	if(WE) //write
		register[address] <= Input;
	else	//read
		Output <= register[address];
end

endmodule
