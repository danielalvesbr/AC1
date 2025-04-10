// -------------------------
// Guia_0802 - FULL SUBTRACTOR
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// half subtractor (Meia-Diferença)
// -------------------------
module halfSubtractor (output diff, output borrow, input a, input b);
    xor XOR1 (diff, a, b); // Diferença
    and AND1 (borrow, ~a, b); // Empréstimo
endmodule // halfSubtractor

// -------------------------
// full subtractor (Subtrator Completo)
// -------------------------
module fullSubtractor (output diff, output borrowOut, input a, input b, input borrowIn);
    wire d1, b1, b2;
    halfSubtractor HS1 (d1, b1, a, b);
    halfSubtractor HS2 (diff, b2, d1, borrowIn);
    or OR1 (borrowOut, b1, b2);
endmodule // fullSubtractor

// -------------------------
// Subtrator de 6 bits
// -------------------------
module subtractor6Bits (output [5:0] diff, output borrowOut, input [5:0] x, input [5:0] y);
    wire [5:0] borrow;
    
    halfSubtractor HS (diff[0], borrow[0], x[0], y[0]);
    fullSubtractor FS1 (diff[1], borrow[1], x[1], y[1], borrow[0]);
    fullSubtractor FS2 (diff[2], borrow[2], x[2], y[2], borrow[1]);
    fullSubtractor FS3 (diff[3], borrow[3], x[3], y[3], borrow[2]);
    fullSubtractor FS4 (diff[4], borrow[4], x[4], y[4], borrow[3]);
    fullSubtractor FS5 (diff[5], borrowOut, x[5], y[5], borrow[4]);
endmodule // subtractor6Bits

// -------------------------
// Teste do Subtrator Completo
// -------------------------
module test_subtractor;
    reg [5:0] x;
    reg [5:0] y;
    wire [5:0] diff;
    wire borrowOut;
    
    subtractor6Bits SUB (diff, borrowOut, x, y);
    
    initial begin
        $display("Guia_0802 - Daniel Alves Goncalves - 874770");
        $display("Test ALU’s full subtractor");
        $display("  x      -    y     =  diff   borrowOut");
        
        x = 6'b101010; y = 6'b001001; #1;
        $display("%b - %b = %b   %b", x, y, diff, borrowOut);
        
        x = 6'b110011; y = 6'b010101; #1;
        $display("%b - %b = %b   %b", x, y, diff, borrowOut);
        
        x = 6'b000011; y = 6'b000100; #1;
        $display("%b - %b = %b   %b", x, y, diff, borrowOut);
        
        x = 6'b111111; y = 6'b000001; #1;
        $display("%b - %b = %b   %b", x, y, diff, borrowOut);
    end
endmodule