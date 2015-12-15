module Processor_tb();

//input reg
	reg  clock, reset, Enter, cheat;
	reg  [7:0] Minput;

//output wire
	wire Halt;
	wire [7:0] Moutput;
	wire [3:0] DisplayState;
  wire [2:0] IR75;

integer error;

Processor mine ( clock, reset, Enter, cheat, Minput,
                 Halt, Moutput, DisplayState, IR75);

                 
/************************* GLOBAL INITIAL CLOCK and GLOBAL INITIAL RESET **********************/
initial
begin
  reset <= 0; cheat <= 1;
  @(posedge clock);
  @(negedge clock);
  reset <= 1;  cheat <= 0;
end

initial
begin
  clock = 0;
  forever #1 clock = ~clock;
end

initial 
begin 
  $display("clk | reset | Enter | cheat | Minput | Halt| Moutput| State| IR75");
  $monitor("%b   | %b     | %b     |  %b   |    %d  |  %b  |   %d   | %b | %b ", clock, reset, Enter, cheat, Minput, Halt, Moutput, DisplayState, IR75);
end 
  
initial 
begin
  initialise();
  #8  $display("CP1"); getInput(2);
  #14 $display("CP2"); getInput(8);
  #8  $display("CP3"); checkingOutput(5);
end

/*************************** TASKS **********************************/
task getInput;
input [7:0] dataIn;
begin
  Minput = dataIn; Enter = 1;
  #2 Enter = 0;
end
endtask

task initialise;
begin
	Minput <= 0; Enter <= 0; error <= 0;
end
endtask

task checkingOutput;
input [7:0] expectedValue;
begin
  while(!Halt) #1;  
  
    if(expectedValue != Moutput)
    begin
      error = error + 1;
      $display("ERROR");
    end
  
end
endtask

endmodule
