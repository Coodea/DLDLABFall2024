module FSMLR (clk, reset, l, r, la, lb, lc, ra, rb, rc);

   input logic  clk;
   input logic  reset;
   input logic 	l;
   input logic 	r;
   
   output logic la;
   output logic lb;
   output logic lc;
   output logic ra;
   output logic rb;
   output logic rc;
   
   //Designed for the when LR then both lights will activate
   typedef enum 	logic [3:0] {OFF, LC1, LC2, LC3, RC1, RC2, RC3, BC1, BC2, BC3} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= OFF;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       OFF: begin
	  la <= 1'b0;	
    lb <= 1'b0;	
    lc <= 1'b0;	
    ra <= 1'b0;	
    rb <= 1'b0;	
    rc <= 1'b0;	  
	  if (~l & ~r) nextstate <= OFF;
	  else if (l & ~r)   nextstate <= LC1;
    else if (~l & r)   nextstate <= RC1;
    else if (l & r)   nextstate <= BC1;
       end

    //Cycle for Left light
       LC1: begin
	  la <= 1'b1;	
    lb <= 1'b0;	
    lc <= 1'b0;	
    ra <= 1'b0;	
    rb <= 1'b0;	
    rc <= 1'b0;	
	  nextstate <= LC2;
       end
       LC2: begin
	  la <= 1'b1;	
    lb <= 1'b1;	
    lc <= 1'b0;	
    ra <= 1'b0;	
    rb <= 1'b0;	
    rc <= 1'b0;	  	  
	  nextstate <= LC3;
       end
       LC3: begin
	  la <= 1'b1;	
    lb <= 1'b1;	
    lc <= 1'b1;	
    ra <= 1'b0;	
    rb <= 1'b0;	
    rc <= 1'b0;	  	  
	  nextstate <= OFF;
       end

    //Cycle for Right light
           RC1: begin
	  la <= 1'b0;	
    lb <= 1'b0;	
    lc <= 1'b0;	
    ra <= 1'b1;	
    rb <= 1'b0;	
    rc <= 1'b0;	
	  nextstate <= RC2;
       end
       RC2: begin
	  la <= 1'b0;	
    lb <= 1'b0;	
    lc <= 1'b0;	
    ra <= 1'b1;	
    rb <= 1'b1;	
    rc <= 1'b0;	  	  
	  nextstate <= RC3;
       end
       RC3: begin
	  la <= 1'b0;	
    lb <= 1'b0;	
    lc <= 1'b0;	
    ra <= 1'b1;	
    rb <= 1'b1;	
    rc <= 1'b1;	  	  
	  nextstate <= OFF;
       end

    //Cycle for Both lights
           BC1: begin
	  la <= 1'b1;	
    lb <= 1'b0;	
    lc <= 1'b0;	
    ra <= 1'b1;	
    rb <= 1'b0;	
    rc <= 1'b0;	
	  nextstate <= BC2;
       end
       BC2: begin
	  la <= 1'b1;	
    lb <= 1'b1;	
    lc <= 1'b0;	
    ra <= 1'b1;	
    rb <= 1'b1;	
    rc <= 1'b0;	  	  
	  nextstate <= BC3;
       end
       BC3: begin
	  la <= 1'b1;	
    lb <= 1'b1;	
    lc <= 1'b1;	
    ra <= 1'b1;	
    rb <= 1'b1;	
    rc <= 1'b1;	  	  
	  nextstate <= OFF;
       end
     endcase
   
endmodule
