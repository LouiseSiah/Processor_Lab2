module ram (clock, WE, cheat, address, Input, Output);
 
	input clock, WE, cheat;
	input [4:0]address;
	input [7:0]Input;
	output reg [7:0]Output;

reg [7:0]register[31:0];

always@(posedge clock)
begin
if(cheat)
begin
  register[5'b00000] <= 8'b10000000;
  register[5'b00001] <= 8'b00111110;
  register[5'b00010] <= 8'b10000000;
  register[5'b00011] <= 8'b00111111;
  register[5'b00100] <= 8'b00011110;
  register[5'b00101] <= 8'b01111111;
  register[5'b00110] <= 8'b10110000;
  register[5'b00111] <= 8'b11001100;
  register[5'b01000] <= 8'b00011111;
  register[5'b01001] <= 8'b01111110;
  register[5'b01010] <= 8'b00111111;
  register[5'b01011] <= 8'b11000100;
  register[5'b01100] <= 8'b00011110;
  register[5'b01101] <= 8'b01111111;
  register[5'b01110] <= 8'b00111110;
  register[5'b01111] <= 8'b11000100;
  register[5'b10000] <= 8'b00011110;
  register[5'b10001] <= 8'b11111111;
  register[5'b11110] <= 8'b00000000;
  register[5'b11111] <= 8'b00000000;
end
else
	if(WE) //write
		register[address] <= Input;
	else	//read
		Output <= register[address];

end

endmodule
