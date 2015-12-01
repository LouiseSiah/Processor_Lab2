module dataPath_tb();

//input reg
	reg clock, reset, IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	reg [1:0]Asel;
	reg [7:0]Minput;

//output wire
	wire [7:0]Moutput;
	wire [2:0]IR75;
	wire Aeq0, Apos;
  wire [7:0] RamToIR, OutAsel, A, ProdSub;
  wire [4:0] Address, IR40, OutIncre, OutJMP, PC40;
  
  integer i, j;
dataPath DP ( clock, reset, IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Asel, Minput,
              Moutput, IR75, Aeq0, Apos, RamToIR, OutAsel, A, ProdSub, Address, IR40, OutIncre, OutJMP, PC40 );
              
  
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
  $display("clk|rst|Jmux|PCload|IR40 |Meminst|MemWr|Sub|Asel|Aload|Minput  |Moutput |IRload|IR75|Aeq0|Apos|RamToIR | OutIncre| OutJMP  | PC40  | Address | OutAsel, ProdSub");
  $monitor("%b  |%b  | %b  |  %b   |%b|  %b    |  %b   | %b | %b|%b |%b |%b|   %b  | %b | %b | %b  | %b   | %b | %b | %b | %b | %b | %b ", clock, reset, JMPmux, PCload, IR40, Meminst, MemWr, Sub, Asel, Aload, Minput, Moutput, IRload, IR75, Aeq0, Apos, RamToIR, OutIncre, OutJMP, PC40, Address, OutAsel,   ProdSub);
  end

initial
  begin
  #3 IRload = 0; JMPmux = 1; PCload = 0; Meminst = 0; MemWr = 1; Aload = 0; Sub = 0; Asel = 1; Minput = 1;
  #2 IRload = 0; JMPmux = 1; PCload = 1; Meminst = 0; MemWr = 1; Aload = 1; Sub = 0; Asel = 1; Minput = 10;
  // #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Aload = 1; Sub = 0; Asel = 1; Minput = 1;
  #2 store();
  #32 IRload = 1; JMPmux = 1; PCload = 0; Meminst = 0; MemWr = 0; Aload = 1; Sub = 0; Asel = 1; Minput = 1;
  #2 IRload = 1; JMPmux = 1; PCload = 0; Meminst = 0; MemWr = 0; Aload = 1; Sub = 0; Asel = 2; Minput = 1;
  // #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Aload = 1; Sub = 0; Asel = 1; Minput = 1;
  end

task store;
begin
  for( i = 0; i < 2; i = i + 1) begin
    if(!i) MemWr = 1;
    else   MemWr = 0;
    for( j = 0; j < 32; j = j + 1)
        begin
        @(negedge clock); IRload = 0; JMPmux = 0; PCload = 1; Meminst = 0; Aload = 1; Asel = 1; Minput = j + 2;
        end
  end
end
endtask  

endmodule
