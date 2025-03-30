/*
    Guia_06.v
    874770 - Daniel Alves Gonçalves
*/

module f1a (output s,
            input x,
            input y,
            input z);
   assign s = (x & z) | (~y & z);
endmodule

module f1b (output s,
            input x,
            input y,
            input z);
   assign s = (x & ~z) | (~y & ~z);
endmodule

module f1c (output s,
            input x,
            input y,
            input z);
   assign s = (~x & z) | (y & ~z);
endmodule

module f1d (output s,
            input x,
            input y,
            input z);
   assign s = (~x & y) | (~y & z);
endmodule

module f1e (output s,
            input x,
            input y,
            input z);
   assign s = (~x & ~z) | (~y & ~z) | (x & y & z);
endmodule
/*__________________________________________________*/

module f2a (output S,
            input X,
            input Y,
            input Z);
   assign S = (X | ~Z) + (~X | ~Z);
endmodule

module f2b (output S,
            input X,
            input Y,
            input Z);
   assign S = (~X | Z) + (Y | Z);
endmodule

module f2c (output S,
            input X,
            input Y,
            input Z);
   assign S = (X | ~Z) + (~Y | Z);
endmodule

module f2d (output S,
            input X,
            input Y,
            input Z);
   assign S = (X | Y) + (Y | ~Z) + (~X | Y | Z);
endmodule

module f2e (output S,
            input X,
            input Y,
            input Z);
   assign S = (X | Z) + (Y | Z) + (~X | ~Y | ~Z);
endmodule
/*__________________________________________________*/


module Guia_06;
    reg x, y, z;
    wire s_1a, s_1b, s_1c, s_1d, s_1e, 
         s_2a, s_2b, s_2c, s_2d, s_2e; // Saidas

    // Instanciar os dois modulos
    f1a s0 (s_1a, x, y, z);
    f1b s1 (s_1b, x, y, z); 
    f1c s2 (s_1c, x, y, z);
    f1d s3 (s_1d, x, y, z);
    f1e s4 (s_1e, x, y, z);
    f2a s5 (s_2a, x, y, z);
    f2b s6 (s_2b, x, y, z);
    f2c s7 (s_2c, x, y, z);
    f2d s8 (s_2d, x, y, z);
    f2e s9 (s_2e, x, y, z);

    initial 
    begin: main
        $display("Guia_0601 - Daniel Alves Goncalves - 874770");
        $display("\n       |     MINTERMOS      |      MAXTERMOS    ");
        $display("\n x y z | 1a, 1b, 1c, 1d, 1e | 2a, 2b, 2c, 2d, 2e");
        $display("___________________________________________________");
        $monitor(" %b %b %b | %b   %b   %b   %b   %b  | %b   %b   %b   %b   %b\n", x, y, z, s_1a, s_1b, s_1c, s_1d, s_1e, s_2a, s_2b, s_2c, s_2d, s_2e);

        // Testar as combinações de entradas
        x = 0; y = 0; z = 0; #1;
        x = 0; y = 0; z = 1; #1;
        x = 0; y = 1; z = 0; #1;
        x = 0; y = 1; z = 1; #1;
        x = 1; y = 0; z = 0; #1;
        x = 1; y = 0; z = 1; #1;
        x = 1; y = 1; z = 0; #1;
        x = 1; y = 1; z = 1; #1;
    end
endmodule
