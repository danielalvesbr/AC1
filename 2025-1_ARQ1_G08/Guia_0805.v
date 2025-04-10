// -------------------------
// Guia_0805 - Complemento de 2
// 874770 - Daniel Alves Goncalves
// -------------------------

// -------------------------
// Módulo Complemento de 1
// -------------------------
module complemento1 (output [5:0] s, input [5:0] a);
    not NOT0 (s[0], a[0]);
    not NOT1 (s[1], a[1]);
    not NOT2 (s[2], a[2]);
    not NOT3 (s[3], a[3]);
    not NOT4 (s[4], a[4]);
    not NOT5 (s[5], a[5]);
endmodule // complemento1

// -------------------------
// Módulo Half Adder
// -------------------------
module halfAdder (output carry, output sum, input a, input b);
    xor XOR1 (sum, a, b);
    and AND1 (carry, a, b);
endmodule // halfAdder

// -------------------------
// Módulo Full Adder
// -------------------------
module fullAdder (output carryOut, output sum, input a, input b, input carryIn);
    wire s1, c1, c2;
    halfAdder HA1 (c1, s1, a, b);
    halfAdder HA2 (c2, sum, s1, carryIn);
    or OR1 (carryOut, c1, c2);
endmodule // fullAdder

// -------------------------
// Somador de 6 bits
// -------------------------
module somador6bits (output [5:0] soma, input [5:0] a, input [5:0] b);
    wire c1, c2, c3, c4, c5;
    fullAdder FA0 (c1, soma[0], a[0], b[0], 1'b0);
    fullAdder FA1 (c2, soma[1], a[1], b[1], c1);
    fullAdder FA2 (c3, soma[2], a[2], b[2], c2);
    fullAdder FA3 (c4, soma[3], a[3], b[3], c3);
    fullAdder FA4 (c5, soma[4], a[4], b[4], c4);
    fullAdder FA5 ( , soma[5], a[5], b[5], c5);
endmodule // somador6bits

// -------------------------
// Módulo Complemento de 2
// -------------------------
module complemento2 (output [5:0] s, input [5:0] a);
    wire [5:0] comp1;
    complemento1 C1 (comp1, a);
    somador6bits S6 (s, comp1, 6'b000001);
endmodule // complemento2

// -------------------------
// Teste do Complemento de 2
// -------------------------
module test_complemento2;
    reg [5:0] x;
    wire [5:0] s;
    complemento2 C2 (s, x);
    
    initial begin
        $display("Guia_0805 - Complemento de 2 - 874770 - Daniel Alves Goncalves");
        $display(" Teste do Complemento de 2");
        x = 6'b000000; #1;
        $display("%b -> %b", x, s);
        x = 6'b000001; #1;
        $display("%b -> %b", x, s);
        x = 6'b000010; #1;
        $display("%b -> %b", x, s);
        x = 6'b111111; #1;
        $display("%b -> %b", x, s);
        x = 6'b100000; #1;
        $display("%b -> %b", x, s);
    end
endmodule // test_complemento2