// -------------------------
// Guia_0803 - Comparador de Igualdade (6 bits)
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// Comparador de igualdade para 6 bits
// -------------------------
module comparadorIgualdade (output s, input [5:0] a, input [5:0] b);
    wire [5:0] xnor_bits;
    
    // Comparação bit a bit
    xnor XNOR0 (xnor_bits[0], a[0], b[0]);
    xnor XNOR1 (xnor_bits[1], a[1], b[1]);
    xnor XNOR2 (xnor_bits[2], a[2], b[2]);
    xnor XNOR3 (xnor_bits[3], a[3], b[3]);
    xnor XNOR4 (xnor_bits[4], a[4], b[4]);
    xnor XNOR5 (xnor_bits[5], a[5], b[5]);
    
    // Saída será 1 apenas se todos os bits forem iguais
    and AND1 (s, xnor_bits[0], xnor_bits[1], xnor_bits[2], xnor_bits[3], xnor_bits[4], xnor_bits[5]);
endmodule // comparadorIgualdade

// -------------------------
// Teste do comparador de igualdade
// -------------------------
module test_comparador;
    reg [5:0] x, y;
    wire s;
    
    comparadorIgualdade comp (s, x, y);
    
    initial begin
        $display("Guia_0803 - Daniel Alves Goncalves - 874770");
        $display("Testando Comparador de Igualdade (6 bits)");
        $display(" x      y      | s ");
        $monitor(" %b  %b  | %b", x, y, s);
        
        // Testes
        x = 6'b000000; y = 6'b000000; #1;
        x = 6'b101010; y = 6'b101010; #1;
        x = 6'b111111; y = 6'b111111; #1;
        x = 6'b100110; y = 6'b100111; #1;
        x = 6'b000001; y = 6'b000000; #1;
    end
endmodule // test_comparador
