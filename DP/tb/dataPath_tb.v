module dataPath_tb();

//input reg
	reg clock, reset, IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	reg [1:0]Asel;
	reg [7:0]Minput;

//output wire
	wire [7:0]Moutput;
	wire [2:0]IR75;
	wire Aeq0, Apos;
  wire [7:0] RamToIR;
  wire [4:0] Address;
  
  integer j;
dataPath DP ( clock, reset, IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Asel, Minput,
              Moutput, IR75, Aeq0, Apos, RamToIR, Address );
              
  
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
  $display("clock| reset | JMPmux | PCload | Meminst |MemWr | Sub | Asel | Aload | Minput | Moutput | IRload | IR75 | Aeq0 | Apos | RamToIR  |  Address");
  $monitor("  %b  |   %b   |   %b    |   %b    | %b      |   %b    |   %b    |  %b   | %b  |  %b  | %b | %b | %b | %b | %b  | %b   | %b", clock, reset, JMPmux, PCload, Meminst, MemWr, Sub, Asel, Aload, Minput, Moutput, IRload, IR75, Aeq0, Apos, RamToIR, Address);
  end

initial
  begin
  #3 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Aload = 0; Sub = 0; Asel = 0; Minput = 0;
  // #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Aload = 0; Sub = 0; Asel = 1; Minput = 1;
  // #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Aload = 1; Sub = 0; Asel = 1; Minput = 1;
  #2 store();
  // #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 1; Aload = 1; Sub = 0; Asel = 1; Minput = 1;
  // #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Aload = 1; Sub = 0; Asel = 1; Minput = 1;
  end

task store;
begin
  for( j = 0; j < 32; j = j + 1)
      begin
       @(negedge clock); IRload = 0; Meminst = 0; MemWr = 1; Aload = 1; Asel = 1; Minput = j + 1;
       @(negedge clock); IRload = 1; Meminst = 1; MemWr = 0; Aload = 1; Asel = 1; Minput = j + 1;
      end
end
endtask  

endmodule
