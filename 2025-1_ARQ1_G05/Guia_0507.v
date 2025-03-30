/*
    Guia_0507.v
    874770 - Daniel Alves Gonçalves
*/

module fteste (output s,
               input a, 
               input b);

    // ~(~a ^ ~b)
    assign s = (~(~a ^ ~b));
endmodule

module fguia_0507 (output s,
                   input a,
                   input b);
    wire not_a;
    wire not_b;
    wire s1;
    wire s2;
    wire s3;

    nor NOR1 (not_a, a, a); // NOR do A
    nor NOR2 (not_b, b, b); // NOR do B
    nor NOR3 (s1, not_a, not_b); // NOR do ~A e ~B
    nor NOR4 (s2, a, b); // NOR do A e B
    nor NOR5 (s3, s1, s2); // NOR do equivalente AND (a . b) e (A e B)
    nor NOR6 (s, s3, s3); // NOR da negação final
    // OBS: "equivalente AND" é do NOR1 até o NOR3
endmodule

module Guia_0507;
    reg a, b;
    wire s1, s2; // Saídas para os dois módulos

    // Instanciar os dois módulos
    fteste A1 (s1, a, b);  // Instancia o módulo fteste
    fguia_0507 A2 (s2, a, b); // Instancia o módulo fguia_0503

    initial 
    begin: main
        $display("Guia 0507 - Daniel Alves Goncalves - 874770");
        $display("\n a | b | fteste: ~(~a ^ ~b) | fguia_0507: ~(~a ^ ~b) ");
        $display("-------------------------------------------------");
        $monitor(" %b | %b |        %b         |         %b         |\n", a, b, s1, s2);

        // Testar as combinações de entradas
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
    end
endmodule
