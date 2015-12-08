module ram (clock, WE, address, Input, Output);

  parameter dataSize = 8;
  parameter memorySize = 5;
  
	input clock, WE;
	input [memorySize - 1:0]address;
	input [dataSize - 1:0]Input;
	output reg [dataSize - 1:0]Output;

reg [dataSize - 1:0]register[31:0];

always@(posedge clock)
begin
	if(WE) //write
		register[address] <= Input;
	else	//read
		Output <= register[address];
end

endmodule
