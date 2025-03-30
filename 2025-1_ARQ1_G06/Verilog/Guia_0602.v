/*
    Guia_06.v
    874770 - Daniel Alves Gonçalves
*/

module f3a (output s,
            input x,
            input y,
            input w,
            input z);
   assign s = (~x & w & ~z) | (~y & w & ~z) | (x & ~w & ~z) | (~x & ~y & ~w & z);
endmodule

module f3b (output s,
            input x,
            input y,
            input w,
            input z);
   assign s = (~x & ~y & ~w) | (~x & w & z) | (y & w & z) | (x & ~w & ~z);
endmodule

module f3c (output s,
            input x,
            input y,
            input w,
            input z);
   assign s = (~x & ~y & ~w) | (y & w & z) | (x & w & z) | (x & w & ~z) | (~x & ~y & w & ~z);
endmodule

module f3d (output s,
            input x,
            input y,
            input w,
            input z);
   assign s = (~x & y & ~w) | (y & ~w & z) | (~x & w & ~z) | (x & w & ~z);
endmodule

module f3e (output s,
            input x,
            input y,
            input w,
            input z);
   assign s = (~x & ~y & ~w) | (~x & ~y & z) | (y & ~w & z) | (x & ~y & ~w) | (x & ~y & z);
endmodule
/*__________________________________________________*/

module f4a (output S,
            input X,
            input Y,
            input W,
            input Z);
   assign S = (X | ~Y | ~Z) + (~Y | W | ~Z) + (X | Y | ~W | Z);
endmodule

module f4b (output S,
            input X,
            input Y,
            input W,
            input Z);
   assign S = (~Y | ~W | Z) + (~X | Y | ~Z) + (X | ~Y | W | Z);
endmodule

module f4c (output S,
            input X,
            input Y,
            input W,
            input Z);
   assign S = (~Y | W | Z) + (~X | Y | Z) + (X | ~Y | ~W | ~Z);
endmodule

module f4d (output S,
            input X,
            input Y,
            input W,
            input Z);
   assign S = (X | W | ~Z) + (~Y | W | ~Z) + (~Y | ~W | ~Z);
endmodule

module f4e (output S,
            input X,
            input Y,
            input W,
            input Z);
   assign S = (X | Y | ~W) + (X | ~Y | ~W)+ (Y | ~W | ~Z) + (~Y | ~W | Z) + (~X | ~Y | W | ~Z);
endmodule
/*__________________________________________________*/


module Guia_06;
    reg x, y, w, z;
    wire s_3a, s_3b, s_3c, s_3d, s_3e, 
         s_4a, s_4b, s_4c, s_4d, s_4e; // Saidas

    // Instanciar os modulos
    f3a s0 (s_3a, x, y, w, z);
    f3b s1 (s_3b, x, y, w, z); 
    f3c s2 (s_3c, x, y, w, z);
    f3d s3 (s_3d, x, y, w, z);
    f3e s4 (s_3e, x, y, w, z);
    f4a s5 (s_4a, x, y, w, z);
    f4b s6 (s_4b, x, y, w, z);
    f4c s7 (s_4c, x, y, w, z);
    f4d s8 (s_4d, x, y, w, z);
    f4e s9 (s_4e, x, y, w, z);

    initial 
    begin: main
        $display("Guia_0602 - Daniel Alves Goncalves - 874770");
        $display("\n         |     MINTERMOS      |      MAXTERMOS    ");
        $display("\n x y w z | 3a, 3b, 3c, 3d, 3e | 4a, 4b, 4c, 4d, 4e");
        $display("___________________________________________________");
        $monitor(" %b %b %b %b | %b   %b   %b   %b   %b  | %b   %b   %b   %b   %b\n", x, y, w, z, s_3a, s_3b, s_3c, s_3d, s_3e, s_4a, s_4b, s_4c, s_4d, s_4e);

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
