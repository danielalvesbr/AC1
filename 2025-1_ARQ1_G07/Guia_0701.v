// -------------------------
// Guia_0701
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// f7_gate
// -------------------------
module f7 (output s_and,
           output s_nand,
           input x,
           input y);

    and AND1 (s_and, x, y);
    nand NAND1 (s_nand, x, y);
endmodule // f7

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input s_and,
            input s_nand,
            input select);
// definir dados locais
    wire not_select;
    wire s1;
    wire s2;

    nand NOT1 (not_select, select, select);
    nand NAND2 (s3, not_select, s_and);
    nand NAND3 (s4, select, s_nand);
    nand NAND4 (s , s3, s4);
endmodule // mux

// -------------------------
// Teste da Unidade Lógica
// -------------------------
module test_f7;
// ------------------------- definir dados
    reg x;
    reg y;
    reg select;
    wire saida_and;
    wire saida_nand;
    wire saida_mux;

    f7 moduloLU (saida_and, saida_nand, x, y);
    mux seletor (saida_mux, saida_and, saida_nand, select);

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0701 - Daniel Alves Goncalves - 874770");
        $display("Test LU's module");
        $display(" x y select | AND NAND | s");
        $monitor(" %b %b    %b   |  %b    %b  | %b",
                  x, y, select, saida_and, saida_nand, saida_mux);

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
