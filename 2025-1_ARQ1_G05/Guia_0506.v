/*
    Guia_0506.v
    874770 - Daniel Alves Gonçalves
*/

module fteste (output s,
               input a, 
               input b);

    // ~(a ^ b)
    assign s = (~(a ^ b));
endmodule

module fguia_0506 (output s,
                   input a,
                   input b);
    wire not_a;
    wire not_b;
    wire s1;
    wire s2;

    nand NAND1 (not_a, a, a); // NAND do A
    nand NAND2 (not_b, b, b); // NAND do B
    nand NAND3 (s1, not_a, not_b); // NAND do ~A e ~B
    nand NAND4 (s2, a, b); // NAND do A e B
    nand NAND5 (s, s1, s2); // NAND do equivalente OR (a . b) e (A e B)
    // OBS: "equivalente OR" é do NAND1 até o NAND3
endmodule

module Guia_0506;
    reg a, b;
    wire s1, s2; // Saídas para os dois módulos

    // Instanciar os dois módulos
    fteste A1 (s1, a, b);  // Instancia o módulo fteste
    fguia_0506 A2 (s2, a, b); // Instancia o módulo fguia_0503

    initial 
    begin: main
        $display("Guia 0506 - Daniel Alves Goncalves - 874770");
        $display("\n a | b | fteste: ~(a ^ b) | fguia_0506: ~(a ^ b) ");
        $display("-------------------------------------------------");
        $monitor(" %b | %b |        %b         |         %b         |\n", a, b, s1, s2);

        // Testar as combinações de entradas
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
    end
endmodule
