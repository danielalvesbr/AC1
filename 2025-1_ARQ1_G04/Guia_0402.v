/*
Guia_0402.v
874770 - Daniel Alves Gonçalves
*/

module fxyz (output s1, output s2, input x, y, z);
    assign s1 = ~(x & ~(x | y));        // x' . ( x + y )'
    assign s2 = (x | ~y) | (~x & ~y);   // ( x + y' ) + ( x' . y' )
    assign s3 = ~(x & ~y) & (x | y);    // ( x . y' )' . ( x + y )
    assign s4 = ~(x & ~y) | ~(x | ~y);  // ( x . y' )' + ( x + y' )'
    assign s5 = (y | ~x) & ~(y' | x);   // ( y + x' ) . ( y' + x )'
endmodule // fxyz
