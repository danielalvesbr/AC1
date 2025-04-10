// -------------------------
// Guia_0702
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// f7_gate
// -------------------------
module f7 (output s_or,
           output s_nor,
           input x,
           input y);

    or OR1 (s_or, x, y);
    nor NOR1 (s_nor, x, y);
endmodule // f7

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input s_or,
            input s_nor,
            input select);
// definir dados locais
    wire not_select;
    wire s1;
    wire s2;

    nor NOT1 (not_select, select, select);
    nor NOR2 (s1, s_or, not_select);
    nor NOR3 (s2, s_nor, select);
    or OR2 (s, s1, s2);
endmodule // mux

// -------------------------
// Teste da Unidade Lógica
// -------------------------
module test_f7;
// ------------------------- definir dados
    reg x;
    reg y;
    reg select;
    wire saida_or;
    wire saida_nor;
    wire saida_mux;

    f7 moduloLU (saida_or, saida_nor, x, y);
    mux seletor (saida_mux, saida_or, saida_nor, select);

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0702 - Daniel Alves Goncalves - 874770");
        $display("Test LU's module");
        $display(" x y select | OR NOR | s");
        $monitor(" %b %b    %b   | %b   %b  | %b",
                  x, y, select, saida_or, saida_nor, saida_mux);

        // Testes com todas as combinações
        x = 0; y = 0; select = 0; #1;
        select = 1; #1;
        x = 0; y = 1; select = 0; #1;
        select = 1; #1;
        x = 1; y = 0; select = 0; #1;
        select = 1; #1;
        x = 1; y = 1; select = 0; #1;
        select = 1; #1;
    end
endmodule
