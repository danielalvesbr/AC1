// -------------------------
// Guia_0801 - FULL ADDER
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// half adder
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
    xor XOR1 (s0, a, b);
    and AND1 (s1, a, b);
endmodule // halfAdder

// -------------------------
// full adder
// -------------------------
module fullAdder (output s1, output s0, input a, input b, input carryIn);
    wire sum1, carry1, carry2;
    
    halfAdder HA1 (carry1, sum1, a, b);
    halfAdder HA2 (carry2, s0, sum1, carryIn);
    or OR1 (s1, carry1, carry2);
endmodule // fullAdder

// -------------------------
// 6-bit Adder
// -------------------------
module sixBitAdder (output [5:0] soma, output carryOut, input [5:0] x, input [5:0] y);
    wire [5:0] carry;
    
    fullAdder FA0 (carry[0], soma[0], x[0], y[0], 1'b0);
    fullAdder FA1 (carry[1], soma[1], x[1], y[1], carry[0]);
    fullAdder FA2 (carry[2], soma[2], x[2], y[2], carry[1]);
    fullAdder FA3 (carry[3], soma[3], x[3], y[3], carry[2]);
    fullAdder FA4 (carry[4], soma[4], x[4], y[4], carry[3]);
    fullAdder FA5 (carryOut, soma[5], x[5], y[5], carry[4]);
endmodule // sixBitAdder

// -------------------------
// Teste do Somador Completo de 6 Bits
// -------------------------
module test_sixBitAdder;
    reg [5:0] x;
    reg [5:0] y;
    wire [5:0] soma;
    wire carryOut;
    
    sixBitAdder adder (soma, carryOut, x, y);
    
    initial begin
        $display("Guia_0801 - Daniel Alves Goncalves - 874770");
        $display("Test ALU’s full adder");
        $display(" x       +  y      =  soma   carryOut");
        
        x = 6'b000101; y = 6'b000011; #1;
        $display("%b + %b = %b   %b", x, y, soma, carryOut);
        
        x = 6'b101010; y = 6'b010101; #1;
        $display("%b + %b = %b   %b", x, y, soma, carryOut);
        
        x = 6'b111111; y = 6'b000001; #1;
        $display("%b + %b = %b   %b", x, y, soma, carryOut);
    end
endmodule // test_sixBitAdder
