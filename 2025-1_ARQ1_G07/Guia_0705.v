// -------------------------
// Guia_0705
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

// -------------------------
// f7_gate
// -------------------------
module f7 (output not_x,
           output not_y,
           output s_xnor,
           output s_xor,
           output s_or,
           output s_nor,
           output s_and,
           output s_nand,
           input x,
           input y);

    not  NOT1  (not_x, x);
    not  NOT2  (not_y, y);
    xnor XNOR1 (s_xnor, x, y);
    xor  XOR1  (s_xor, x, y);
    or   OR1   (s_or, x, y);
    nor  NOR1  (s_nor, x, y);
    and  AND1  (s_and, x, y);
    nand NAND1 (s_nand, x, y);
endmodule // f7

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input not_x,
            input not_y,
            input s_xnor,
            input s_xor,
            input s_or,
            input s_nor,
            input s_and,
            input s_nand,
            input [2:0] select);
// definir dados locais
    wire not_s0;
    wire not_s1;
    wire not_s2;
    wire s_000;
    wire s_001;
    wire s_010;
    wire s_011;
    wire s_100;
    wire s_101;
    wire s_110;
    wire s_111;

    not NOT3(not_s0, select[0]); //select[0] = 0
    not NOT4(not_s1, select[1]); //select[1] = 0
    not NOT5(not_s2, select[2]); //select[2] = 0

    and AND1(s_000, not_x,  not_s2, not_s1, not_s0);       // 000 - NOT(x)
    and AND2(s_001, not_y,  not_s2, not_s1, select[0]);       // 001 - NOT(y)
    and AND3(s_010, s_xnor, not_s2, select[1], not_s0);       // 010 - XNOR
    and AND4(s_011, s_xor,  not_s2, select[1], select[0]);    // 011 - XOR
    and AND5(s_100, s_or,   select[2], not_s1, not_s0);    // 100 - OR
    and AND6(s_101, s_nor,  select[2], not_s1, select[0]); // 101 - NOR
    and AND7(s_110, s_and,  select[2], select[1], not_s0);       // 110 - AND
    and AND8(s_111, s_nand, select[2], select[1], select[0]);       // 111 - NAND

    or SAIDA(s, s_000, s_001, s_010, s_011, s_100, s_101, s_110, s_111);
endmodule // mux

// -------------------------
// Teste da Unidade Lógica
// -------------------------
module test_f7;
// ------------------------- definir dados
    reg x;
    reg y;
    reg [2:0] select;
    wire saida_not_x;
    wire saida_not_y;
    wire saida_xnor;
    wire saida_xor;
    wire saida_or;
    wire saida_nor;
    wire saida_and;
    wire saida_nand;
    wire saida_mux;

    f7 moduloLU (saida_not_x, saida_not_y, saida_xnor, saida_xor, saida_or, saida_nor, saida_and, saida_nand, x, y);
    mux seletor (saida_mux, saida_not_x, saida_not_y, saida_xnor, saida_xor, saida_or, saida_nor, saida_and, saida_nand, select); 

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0705 - Daniel Alves Goncalves - 874770");
        $display("Test LU's module");
        $display(" x y select | NOT(x) NOT(y) XNOR XOR OR NOR AND NAND | s");
        $monitor(" %b %b  %b%b%b   |   %b      %b     %b    %b  %b   %b   %b   %b   | %b",
                  x, y, select[2], select[1], select[0], saida_not_x, saida_not_y, saida_xnor, saida_xor, saida_or, saida_nor, saida_and, saida_nand, saida_mux);


        // Testes com todas as combinações
        x = 0; y = 0; 
        select = 3'b000; #1;
        select = 3'b001; #1;
        select = 3'b010; #1;
        select = 3'b011; #1;
        select = 3'b100; #1;
        select = 3'b101; #1;
        select = 3'b110; #1;
        select = 3'b111; #1;
        
        x = 0; y = 1; 
        select = 3'b000; #1;
        select = 3'b001; #1;
        select = 3'b010; #1;
        select = 3'b011; #1;
        select = 3'b100; #1;
        select = 3'b101; #1;
        select = 3'b110; #1;
        select = 3'b111; #1;

        x = 1; y = 0; 
        select = 3'b000; #1;
        select = 3'b001; #1;
        select = 3'b010; #1;
        select = 3'b011; #1;
        select = 3'b100; #1;
        select = 3'b101; #1;
        select = 3'b110; #1;
        select = 3'b111; #1;

        x = 1; y = 1; 
        select = 3'b000; #1;
        select = 3'b001; #1;
        select = 3'b010; #1;
        select = 3'b011; #1;
        select = 3'b100; #1;
        select = 3'b101; #1;
        select = 3'b110; #1;
        select = 3'b111; #1;
    end
endmodule
