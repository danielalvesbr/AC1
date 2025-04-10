// -------------------------
// Guia_0703
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// f7_gate
// -------------------------
module f7 (output s_and,
           output s_nand,
           output s_or,
           output s_nor,
           input x,
           input y);

    and AND1 (s_and, x, y);
    nand NAND1 (s_nand, x, y);
    or OR1 (s_or, x, y);
    nor NOR1 (s_nor, x, y);
endmodule // f7

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input s_and,
            input s_nand,
            input s_or,
            input s_nor,
            input k0,
            input k1);
// definir dados locais
    wire not_k1;
    wire not_k0;
    wire s1;
    wire s2;
    wire s3;
    wire s4;
    wire s5;
    wire s6;
    wire s7;
    wire s8;

    nand NOT1 (not_k1, k1, k1);
    nor NOT2 (not_k0, k0, k0);
    nand NAND2 (s1, not_k1, s_and);
    nand NAND3 (s2, k1, s_nand);
    nand NAND4 (s5, s1, s2);
    nor NOR2 (s3, s_or, not_k1);
    nor NOR3 (s4, s_nor, k1);
    or OR2 (s6, s3, s4);
    and AND2 (s7, k0, s5);
    and AND3 (s8, not_k0, s6);
    or OR3 (s, s7, s8);
endmodule // mux

// -------------------------
// Teste da Unidade Lógica
// -------------------------
module test_f7;
// ------------------------- definir dados
    reg x;
    reg y;
    reg s0;
    reg s1;
    wire saida_and;
    wire saida_nand;
    wire saida_or;
    wire saida_nor;
    wire saida_mux;

    f7 moduloLU (saida_and, saida_nand, saida_or, saida_nor, x, y);
    mux seletor (saida_mux, saida_and, saida_nand, saida_or, saida_nor, s1, s0);

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0703 - Daniel Alves Goncalves - 874770");
        $display("Test LU's module");
        $display(" x y s1 s0  | OR AND NAND NOR| s");
        $monitor(" %b %b  %b  %b  | %b   %b    %b   %b | %b",
                  x, y, s1, s0, saida_or, saida_and, saida_nand, saida_nor, saida_mux);

        // Testes com todas as combinações
        x = 0; y = 0; s1 = 0; s0 = 0; #1;
        s1 = 1; #1;
        s0 = 1; #1;
        s1 = 0; #1;
        x = 0; y = 1; s1 = 0; s0 = 0; #1;
        s1 = 1; #1;
        s0 = 1; #1;
        s1 = 0; #1;
        x = 1; y = 0; s1 = 0; s0 = 0; #1;
        s1 = 1; #1;
        s0 = 1; #1;
        s1 = 0; #1;
        x = 1; y = 1; s1 = 0; s0 = 0; #1;
        s1 = 1; #1;
        s0 = 1; #1;
        s1 = 0; #1;
    end
endmodule
