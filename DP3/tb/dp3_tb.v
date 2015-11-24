module dp3_tb();

//input reg
	reg clock, reset, Aload, Sub;
	reg [1:0]Asel;
	reg [7:0]dp1In, mInput;
//output wire
	wire Apos, Aeq0;
	wire [7:0] mOutput;
	wire [7:0]OutAsel, A, ProdSub;  //erasable

dp3 #(.n(8)) DP3 ( clock, reset, Aload, Sub, Asel, dp1In, mInput,
                Apos, Aeq0, mOutput, OutAsel, A, ProdSub);
                
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
    $display("clock| reset | dp1In    | mInput   | ProdSub  |Asel| OutAsel  |Aload| A       | dp1In    |Sub| ProdSub  |Apos|Aeq0| mOutput   ");
    $monitor("%b    | %b    | %b | %b | %b | %b | %b | %b  | %b | %b | %b | %b | %b | %b | %b", clock, reset, dp1In, mInput, ProdSub, Asel, OutAsel, Aload, A, dp1In, Sub, ProdSub, Apos, Aeq0, mOutput);
  end 
  
initial 
  begin   
    Aload = 0; Sub = 0; Asel = 0; dp1In = 20; mInput = 10;
    #2 Aload = 0; Sub = 0; Asel = 3; dp1In = 20; mInput = 10;
    #2 Aload = 0; Sub = 0; Asel = 2; dp1In = 20; mInput = 10;
    #2 Aload = 0; Sub = 0; Asel = 1; dp1In = 20; mInput = 10;
    #2 Aload = 1; Sub = 1; Asel = 1; dp1In = 20; mInput = 10;
    #2 Aload = 1; Sub = 0; Asel = 0; dp1In = 20; mInput = 10;
    #2 Aload = 1; Sub = 1; Asel = 0; dp1In = 20; mInput = 10;
  end
  
endmodule