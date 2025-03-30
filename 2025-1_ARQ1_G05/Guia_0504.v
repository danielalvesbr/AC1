/*
    Guia_0504.v
    874770 - Daniel Alves Gonçalves
*/

module fteste (output s,
               input a, 
               input b);

    // ~(a & ~b) 
    assign s = (~(a & ~b));  
endmodule

module fguia_0504 (output s,
                   input a,
                   input b);
    wire not_b;

    nand NAND1 (not_b, b, b); // NAND do B
    nand NAND2 (s, a, not_b); // NAND do A e ~B
endmodule

module Guia_0504;
    reg a, b;
    wire s1, s2; // Saídas para os dois módulos

    // Instanciar os dois módulos
    fteste A1 (s1, a, b);  // Instancia o módulo fteste
    fguia_0504 A2 (s2, a, b); // Instancia o módulo fguia_0504

    initial 
    begin: main
        $display("Guia 0504 - Daniel Alves Goncalves - 874770");
        $display("\n a | b | fteste: ~(a & ~b) | fguia_0504: ~(a & ~b) ");
        $display("---------------------------------------------");
        $monitor(" %b | %b |       %b        |         %b         |\n", a, b, s1, s2);

        // Testar as combinações de entradas
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
    end
endmodule
