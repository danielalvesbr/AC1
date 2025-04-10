// -------------------------
// Guia_0704
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// f7_gate
// -------------------------
module f7 (output s_xnor,
           output s_xor,
           output s_or,
           output s_nor,
           input x,
           input y);

    xnor XNOR1 (s_xnor, x, y);
    xor  XOR1  (s_xor, x, y);
    or   OR1   (s_or, x, y);
    nor  NOR1  (s_nor, x, y);
endmodule // f7

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input s_xnor,
            input s_xor,
            input s_or,
            input s_nor,
            input [1:0] select);
// definir dados locais
    wire not_s0;
    wire not_s1;
    wire s_00;
    wire s_01;
    wire s_10;
    wire s_11;

    not NOT1(not_s0, select[0]); //select[0] = 0
    not NOT2(not_s1, select[1]); //select[1] = 0

    and AND1(s_00, s_xnor, not_s1, not_s0);       // 00 - XNOR
    and AND2(s_01, s_xor,  not_s1, select[0]);    // 01 - XOR
    and AND3(s_10, s_or,   select[1], not_s0);    // 10 - OR
    and AND4(s_11, s_nor,  select[1], select[0]); // 11 - NOR
    or SAIDA(s, s_00, s_01, s_10, s_11);
endmodule // mux

// -------------------------
// Teste da Unidade Lógica
// -------------------------
module test_f7;
// ------------------------- definir dados
    reg x;
    reg y;
    reg [1:0] select;
    wire saida_xnor;
    wire saida_xor;
    wire saida_or;
    wire saida_nor;
    wire saida_mux;

    f7 moduloLU (saida_xnor, saida_xor, saida_or, saida_nor, x, y);
    mux seletor (saida_mux, saida_xnor, saida_xor, saida_or, saida_nor, select); 

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0704 - Daniel Alves Goncalves - 874770");
        $display("Test LU's module");
        $display(" x y select | XNOR XOR OR NOR | s");
        $monitor(" %b %b   %b%b   |   %b   %b   %b   %b | %b",
                  x, y, select[1], select[0], saida_xnor, saida_xor, saida_or, saida_nor, saida_mux);


        // Testes com todas as combinações
        x = 0; y = 0; 
        select = 2'b00; #1;
        select = 2'b01; #1;
        select = 2'b10; #1;
        select = 2'b11; #1;
        
        x = 0; y = 1; 
        select = 2'b00; #1;
        select = 2'b01; #1;
        select = 2'b10; #1;
        select = 2'b11; #1;

        x = 1; y = 0; 
        select = 2'b00; #1;
        select = 2'b01; #1;
        select = 2'b10; #1;
        select = 2'b11; #1;

        x = 1; y = 1; 
        select = 2'b00; #1;
        select = 2'b01; #1;
        select = 2'b10; #1;
        select = 2'b11; #1;
    end
endmodule
