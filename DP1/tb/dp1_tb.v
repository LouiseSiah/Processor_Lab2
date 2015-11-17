module dp1_tb();


//input reg
	reg clock, reset, IRload, JMPmux, PCload, Meminst;
	reg [7:0]IRin;

//output wire
	wire [4:0]Address, OutIncre, OutJMP, PC40;
	wire [7:0]IRout;

dp1 #(.n(5), .m(8)) DP1 (clock, reset, IRload, JMPmux, PCload, Meminst, IRin, 
                      Address, OutIncre, OutJMP, PC40, IRout);
  
initial 
 begin 
   reset <= 0;
   @(posedge clock);
   @(negedge clock);
   reset <= 1;
 end 

initial
  begin
    clock = 0;
    forever #1 clock = ~clock;
  end
  
initial 
  begin 
    $display(" clock| reset | IRin     | IRload |  IRout   | OutIncre  | JMPmux | OutJMP |  PCload | PC40  | OutIncre | Meminst | Address   \n");
    $monitor("  %b   |   %b   | %b |   %b    | %b |   %b  |   %b    |   %b    |   %b    |  %b  |  %b |     %b  |   %b    |\n", clock, reset, IRin, IRload, IRout, OutIncre, JMPmux, OutJMP, PCload, PC40, OutIncre, Meminst, Address);
  end 
  
initial
  begin
    #3 IRin = 0 ; IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; 
    #4 IRin = 8'b00001111; IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; 
    #2 IRin = 8'b00001111; IRload = 1; JMPmux = 0; PCload = 0; Meminst = 0; 
    #2 IRin = 8'b11110000; IRload = 1; JMPmux = 1; PCload = 0; Meminst = 0; 
    #2 IRin = 8'b00001100; IRload = 1; JMPmux = 1; PCload = 1; Meminst = 0; 
    #2 IRin = 8'b10101010; IRload = 1; JMPmux = 0; PCload = 1; Meminst = 0; 
    #2 IRin = 8'b00000000; IRload = 1; JMPmux = 0; PCload = 1; Meminst = 1; 
    #2 IRin = 8'b00000000; IRload = 1; JMPmux = 0; PCload = 1; Meminst = 0; 
  end
  
endmodule 