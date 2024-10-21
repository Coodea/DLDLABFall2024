module mux16x1(input logic[255:0]hashed, input logic[3:0]sel, output logic[15:0]);
    always_comb
    case(sel)
        4'b0000 : out = hashed[15:0];   
        4'b0001 : out = hashed[31:16];  
        4'b0010 : out = hashed[47:32];  
        4'b0011 : out = hashed[63:48];  
        4'b0100 : out = hashed[79:64];  
        4'b0101 : out = hashed[95:80];  
        4'b0110 : out = hashed[111:96]; 
        4'b0111 : out = hashed[127:112];
        4'b1000 : out = hashed[143:128];
        4'b1001 : out = hashed[159:144];
        4'b1010 : out = hashed[175:160];
        4'b1011 : out = hashed[191:176];
        4'b1100 : out = hashed[207:192];
        4'b1101 : out = hashed[223:208];
        4'b1110 : out = hashed[239:224];
        4'b1111 : out = hashed[255:240];
        default : out = 16'h0;
    endcase
/* Not sure on this
    mux16x1 m0(hashed, sw[3:0], out0);
    mux16x1 m1(hashed, sw[3:0], out1);
    mux16x1 m2(hashed, sw[3:0], out2);
    mux16x1 m3(hashed, sw[3:0], out3);
    mux16x1 m4(hashed, sw[3:0], out4);
    mux16x1 m5(hashed, sw[3:0], out5);
    mux16x1 m6(hashed, sw[3:0], out6);
    mux16x1 m7(hashed, sw[3:0], out7);
    mux16x1 m8(hashed, sw[3:0], out8);
    mux16x1 m9(hashed, sw[3:0], out9);
    mux16x1 m10(hashed, sw[3:0], out10);
    mux16x1 m11(hashed, sw[3:0], out11);
    mux16x1 m12(hashed, sw[3:0], out12);
    mux16x1 m13(hashed, sw[3:0], out13);
    mux16x1 m14(hashed, sw[3:0], out14);
    mux16x1 m15(hashed, sw[3:0], out15);
*/
endmodule

/* Goes in driver?
digit0(out[3:0])
digit1(out[7:4])
digit2(out[11:8])
digit3(out[15:12])
*/
