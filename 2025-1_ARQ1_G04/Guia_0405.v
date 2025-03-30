/*
Guia_0405.v
874770 - Daniel Alves Gonçalves
*/

module PoS_SoP (output sa, sb, sc, sd, se, output pa, pb, pc, pd, pe, input x, y, z, w);
    // SoP (Soma de Produtos)
    assign sa = (~x & y);
    assign sb = (~x & ~y) | (x & ~y);
    assign sc = (~x & ~y & ~z) | (~x & y & ~z) | (~x & y & z) | (x & ~y & ~z) | (x & y & ~z) | (x & y & z);
    assign sd = (~x & ~y & ~z) | (~x & y & ~z) | (x & ~y & ~z) | (x & ~y & z);
    assign se = (~x & ~y & ~w & ~z) | (~x & ~y & w & z) | (~x & y & ~w & z) | (~x & y & w & ~z) | 
                (x & ~y & ~w & ~z) | (x & ~y & w & ~z) | (x & y & ~w & ~z) | (x & y & w & ~z) | (x & y & w & z);
    
    // PoS (Produto de Somas)
    assign pa = (x | y) & (~x | y) & (~x | ~y);
    assign pb = (x | ~y) & (~x | ~y);
    assign pc = (x | y | ~z) & (~x | y | ~z);
    assign pd = (x | y | ~z) & (x | ~y | ~z) & (~x | ~y | z) & (~x | ~y | ~z);
    assign pe = (x | y | w | ~z) & (x | y | ~w | z) & (x | ~y | w | z) & (x | ~y | ~w | ~z) & 
                (~x | y | w | ~z) & (~x | y | ~w | ~z) & (~x | ~y | w | ~z);
endmodule

module TestPoS_SoP;
    reg x, y, z, w;
    wire sa, sb, sc, sd, se, pa, pb, pc, pd, pe;
    integer i;  // Variável de controle do loop

    PoS_SoP uut (sa, sb, sc, sd, se, pa, pb, pc, pd, pe, x, y, z, w);

    initial begin
        $display("x y z w | SoP_a SoP_b SoP_c SoP_d SoP_e | PoS_a PoS_b PoS_c PoS_d PoS_e");
        $monitor("%b %b %b %b |  %b    %b    %b    %b    %b  |  %b    %b    %b    %b    %b", 
                 x, y, z, w, sa, sb, sc, sd, se, pa, pb, pc, pd, pe);
        
        // Gerar todas as combinações uma única vez
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, z, w} = i;
            #10;
        end

        $finish; // Termina a simulação após completar as execuções
    end
endmodule
