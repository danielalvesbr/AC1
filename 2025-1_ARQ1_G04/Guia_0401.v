/*
Guia_0401.v
874770 - Daniel Alves Gonçalves
*/

/*
module fxyz (output s,
input x, y, z);
assign s = ~x | (~y & ~z);
endmodule // fxyz
*/

module a (output s, 
          input x, y, z);
    assign s = ~(x & (y | ~z));
endmodule // a

module b (output s, 
          input x, y, z);
    assign s = (~(x | ~y)) & z;
endmodule // b

module c (output s, 
          input x, y, z);
    assign s = (~(~x & ~y)) & ~z;
endmodule // c

module d (output s, 
          input x, y, z);
    assign s = (~(x & ~y)) & z;
endmodule // d

module e (output s, 
          input x, y, z);
    assign s = (~x | ~y) & ~(y | ~z);
endmodule // e