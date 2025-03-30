/*
Guia_0404.v
874770 - Daniel Alves Gonçalves
*/

module PoS (output S, input X, Y, Z); // MAXTERMOS

// a) F (X,Y,Z) = π M ( 1, 3, 6, 7 )
assign sa = (X | Y | Z') & (X | Y' | Z) & (X' | Y | Z) & (X' | Y' | Z);

// b) F (X,Y,Z) = π M ( 0, 2, 6, 7 )
assign sb = (X | Y | Z) & (X | Y' | Z') & (X' | Y | Z) & (X' | Y' | Z);

// c) F (X,Y,W,Z) = π M ( 0, 1, 2, 5, 6, 7, 11, 13 )
assign sc = (X | Y | W | Z) & (X | Y | W' | Z) & (X | Y' | W | Z) & (X' | Y | W' | Z') & (X' | Y | W | Z) & (X' | Y | W' | Z) & (X' | Y' | W | Z') & (X' | Y' | W' | Z);

// d) F (X,Y,W,Z) = π M ( 1, 2, 4, 6, 8, 9, 14 )
assign sd = (X | Y | W' | Z) & (X | Y' | W | Z') & (X | Y' | W' | Z) & (X' | Y | W | Z') & (X' | Y | W' | Z) & (X' | Y' | W | Z) & (X' | Y' | W' | Z);

// e) F (X,Y,W,Z) = π M ( 0, 1, 2, 4, 5, 11, 15 )
assign se = (X | Y | W | Z) & (X | Y | W' | Z) & (X | Y' | W | Z) & (X' | Y | W | Z') & (X' | Y | W' | Z) & (X' | Y' | W' | Z) & (X' | Y' | W | Z);

endmodule // PoS
