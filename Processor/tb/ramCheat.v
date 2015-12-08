module ram (clock, WE, cheat, address, Input, Output);
 
	input clock, WE, cheat;
	input [4:0]address;
	input [7:0]Input;
	output reg [7:0]Output;

reg [7:0]register[31:0];

always@(posedge clock, posedge cheat)
begin
if(cheat)
begin
  register[0] <= 170;
  register[1] <= 1;
  register[2] <= 2;
  register[3] <= 3;
  register[4] <= 4;
  register[5] <= 5;
  register[6] <= 6;
  register[7] <= 7;
  register[8] <= 8;
  register[9] <= 9;
  register[10] <= 10;
  register[11] <= 11;
  register[12] <= 12;
  register[13] <= 13;
  register[14] <= 14;
  register[15] <= 15;
  register[16] <= 16;
  register[17] <= 17;
  register[18] <= 18;
  register[19] <= 19;
  register[20] <= 20;
  register[21] <= 21;
  register[22] <= 22;
  register[23] <= 23;
  register[24] <= 24;
  register[25] <= 25;
  register[26] <= 26;
  register[27] <= 27;
  register[28] <= 28;
  register[29] <= 29;
  register[30] <= 30;
  register[31] <= 31;
end
else
	if(WE) //write
		register[address] <= Input;
	else	//read
		Output <= register[address];

end

endmodule
