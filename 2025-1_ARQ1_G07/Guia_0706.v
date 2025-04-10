// -------------------------
// Guia_0706
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// f7_gate
// -------------------------
module f7 (output s_xnor,
           output s_xor,
           input x,
           input y);

    xnor XNOR1 (s_xnor, x, y);
    xor  XOR1  (s_xor, x, y);
endmodule // f7

// -------------------------
// Comparador de 4 bits
// -------------------------
module comparator(output [3:0] igual, 
                  output [3:0] diferente, 
                  input  [3:0] x, 
                  input  [3:0] y);
    
    // Comparacao bit a bit
    f7 bit0 (igual[0], diferente[0], x[0], y[0]);
    f7 bit1 (igual[1], diferente[1], x[1], y[1]);
    f7 bit2 (igual[2], diferente[2], x[2], y[2]);
    f7 bit3 (igual[3], diferente[3], x[3], y[3]);

endmodule // comparator
// -------------------------

// -------------------------
module mux(output [3:0] s, 
           input  [3:0] igual, 
           input  [3:0] diferente, 
           input select);

    assign s = (select) ? diferente : igual;  //(condicao) ? valor_if_true : valor_if_false;
endmodule // mux
// -------------------------

// -------------------------
module test_comparator;
// ------------------------- definir dados
    reg [3:0] a;
    reg [3:0] b;
    reg select;
    wire [3:0] saida_igual;
    wire [3:0] saida_diferente;
    wire [3:0] saida_mux;

    comparator comparador (saida_igual, saida_diferente, a, b);
    mux seletor (saida_mux, saida_igual, saida_diferente, select); 

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0706 - Daniel Alves Goncalves - 874770");
        $display("Test Comparator's module");
        $display("  a    b    select | Igual Diferente |  s");
        $monitor(" %b %b    %b    |  %b    %b   | %b",
                  a, b, select, saida_igual, saida_diferente, saida_mux);

        // Testes com várias combinações
        a = 4'b0000; b = 4'b0000; select = 0; #1;
        select = 1; #1;
        
        a = 4'b0000; b = 4'b0001; select = 0; #1;
        select = 1; #1;

        a = 4'b1010; b = 4'b1010; select = 0; #1;
        select = 1; #1;

        a = 4'b1111; b = 4'b1010; select = 0; #1;
        select = 1; #1;
    end
endmodule
