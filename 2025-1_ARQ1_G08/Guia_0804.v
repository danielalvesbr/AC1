// -------------------------
// Guia_0804 - Comparador de Desigualdade
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// Comparador de desigualdade (6 bits)
// -------------------------
module comparador_desigualdade (
    output s,
    input [5:0] a,
    input [5:0] b
);
    wire [5:0] dif_bits;
    
    // XOR bit a bit para detectar diferenças
    xor XOR0(dif_bits[0], a[0], b[0]);
    xor XOR1(dif_bits[1], a[1], b[1]);
    xor XOR2(dif_bits[2], a[2], b[2]);
    xor XOR3(dif_bits[3], a[3], b[3]);
    xor XOR4(dif_bits[4], a[4], b[4]);
    xor XOR5(dif_bits[5], a[5], b[5]);
    
    // OR para verificar se pelo menos um bit é diferente
    or OR_FINAL(s, dif_bits[0], dif_bits[1], dif_bits[2], dif_bits[3], dif_bits[4], dif_bits[5]);
    
endmodule // comparador_desigualdade

// -------------------------
// Teste do comparador de desigualdade
// -------------------------
module test_comparador;
    reg [5:0] x;
    reg [5:0] y;
    wire s;
    
    comparador_desigualdade comp (s, x, y);
    
    initial begin
        $display("Guia_0804 - Daniel Alves Goncalves - 874770");
        $display("Testando comparador de desigualdade de 6 bits");
        $display(" x       | y       | s (desigualdade)");
        $monitor(" %b | %b | %b", x, y, s);
        
        // Casos de teste
        x = 6'b000000; y = 6'b000000; #1;
        x = 6'b000001; y = 6'b000000; #1;
        x = 6'b101010; y = 6'b101010; #1;
        x = 6'b111111; y = 6'b000000; #1;
        x = 6'b000001; y = 6'b000011; #1;
        x = 6'b110011; y = 6'b110010; #1;
    end
endmodule // test_comparador