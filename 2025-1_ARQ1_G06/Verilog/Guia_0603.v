/*
    Guia_06.v
    874770 - Daniel Alves Gonçalves
*/

module f5 (output s,
            input x,
            input y,
            input z);
   assign s = (x & ~z) | (x & ~y);
endmodule

module f6 (output S,
            input X,
            input Y,
            input W,
            input Z);
   assign S = X & (~Y | ~W | ~Z);
endmodule


module Guia_06;
    reg x, y, w, z;
    wire s_5, s_6; // Saídas para os dois módulos

    // Instanciar os dois módulos
    f5 s1 (s_5, x, y, z);
    f6 s2 (s_6, x, y, w, z); 

    initial 
    begin: main
        $display("Guia_0603 - Daniel Alves Goncalves - 874770");
        $display("\n MINTERMO Ex5 | MAXTERMO Ex6");
        $display("\n  x y z -> 5  | x y w z -> 6");
        $display(" ____________________________");
        $monitor("  %b %b %b -> %b  | %b %b %b %b -> %b \n", x, y, z, s_5, x, y, w, z, s_6);

        // Testar as combinações de entradas
        x = 0; y = 0; w = 0; z = 0; #1;
        x = 0; y = 0; w = 0; z = 1; #1;
        x = 0; y = 0; w = 1; z = 0; #1;
        x = 0; y = 0; w = 1; z = 1; #1;
        x = 0; y = 1; w = 0; z = 0; #1;
        x = 0; y = 1; w = 0; z = 1; #1;
        x = 0; y = 1; w = 1; z = 0; #1;
        x = 0; y = 1; w = 1; z = 1; #1;
        x = 1; y = 0; w = 0; z = 0; #1;
        x = 1; y = 0; w = 0; z = 1; #1;
        x = 1; y = 0; w = 1; z = 0; #1;
        x = 1; y = 0; w = 1; z = 1; #1;
        x = 1; y = 1; w = 0; z = 0; #1;
        x = 1; y = 1; w = 0; z = 1; #1;
        x = 1; y = 1; w = 1; z = 0; #1;
        x = 1; y = 1; w = 1; z = 1; #1;
    end
endmodule
