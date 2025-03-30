/*
Guia_0403.v
874770 - Daniel Alves Gonçalves
*/

module SoP (output sa, sb, sc, sd, se, input x, y, z, w); // mintermos

    // a) f (x,y,z) = Σ m ( 1, 2, 6, 7 )
    assign sa = ( ~x & ~y & z) | ( ~x & y & ~z) | (x & y & ~z) | (x & y & z);

    // b) f (x,y,z) = Σ m ( 3, 5, 6, 7 )
    assign sb = ( ~x & y & z) | (x & ~y & z) | (x & y & ~z) | (x & y & z);

    // c) f (x,y,w,z) = Σ m ( 1, 2, 3, 5, 7, 13, 15 )
    assign sc = ( ~x & ~y & z) | ( ~x & y & ~z) | ( ~x & y & z) | 
                (x & ~y & z) | (x & y & z) | (x & y & w & ~z) | (x & y & w & z);

    // d) f (x,y,w,z) = Σ m ( 1, 2, 4, 8, 10, 12, 14 )
    assign sd = ( ~x & ~y & z) | ( ~x & y & ~z) | (x & ~y & ~z) | 
                (x & y & ~w & ~z) | (x & y & ~w & z) | (x & y & w & ~z) | (x & y & w & z);

    // e) f (x,y,w,z) = Σ m ( 0, 2, 6, 7, 8, 14 )
    assign se = ( ~x & ~y & ~z) | ( ~x & y & ~z) | (x & y & ~z) | 
                (x & y & z) | (x & ~y & ~z) | (x & y & w & z);

endmodule // SoP

/*
module TestPoS_SoP;
    reg x, y, z, w;
    wire sa, sb, sc, sd, se;
    integer i;

    // Instanciando o módulo SoP
    SoP uut (sa, sb, sc, sd, se, x, y, z, w);

    initial begin
        $display("x y z w | SoP_a SoP_b SoP_c SoP_d SoP_e");
        $monitor("%b %b %b %b |  %b    %b    %b    %b    %b", 
                 x, y, z, w, sa, sb, sc, sd, se);

        // Loop para testar todas as combinações de entrada (0 a 15)
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, z, w} = i;
            #10;
        end

        $finish; // Termina a simulação
    end
endmodule
*/
