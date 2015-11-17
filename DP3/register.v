module register (clock, reset, load, Input, Output);  

parameter n = 8;
input clock, reset, load;
input [n-1:0]Input;
output reg [n-1:0]Output;

always@(posedge clock, negedge reset)
begin
	if(!reset)
		Output<= 0;
	else
	begin
		if(load)
			Output <= Input;
		else
			Output <= Output;
	end
end

endmodule
