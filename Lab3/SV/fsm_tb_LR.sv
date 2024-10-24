`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  l;
   logic  r;
   logic  reset;
   
   logic la;
   logic lb;
   logic lc;
   logic ra;
   logic rb;
   logic rc;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   FSMLR dut (clk, reset, l, r, la, lb, lc, ra, rb, rc);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b %b || %b %b %b %b %b %b", 
		     reset, l, r, la, lb, lc, ra, rb, rc);
     end   
   
   initial 
     begin      
	#0   reset = 1'b1;
	#20  reset = 1'b0;	
	#0   l = 1'b0;
    #0   r = 1'b0;
	#20   l = 1'b1;
    #20   r = 1'b0;
    #40   l = 1'b0;
    #40   r = 1'b1;
    #60   l = 1'b1;
    #60   r = 1'b1;
     end

endmodule // FSM_tb_LR

