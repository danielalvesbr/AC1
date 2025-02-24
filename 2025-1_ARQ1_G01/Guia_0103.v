/*
Guia_0103.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0103;   // define um módulo Guia_0103

// define data
integer x = 13;       // decimal {int x = 13;}
reg [7:0] b = 0;      // binary (bits - little endian) {define um registrador de 8 bits com 0}

// actions
initial         // equivale à função main {main()}
begin : main    // inicia a função
$display ( "Guia_0103 - Tests" );   // $display(); equivale à função printf {printf();}
$display ( "x = %d" , x );          // ("x = %d", x) para printar uma variavel (%d - decimal, %b - binário, %s - string)
$display ( "b = %8b", b );          // "printando" 8 bits com valor zerado
b = x;                              // atribuindo o valor de x para b

// "printando" b em diferentes bases: binário (2), octal (8) e hexadecimal (16)
$display ( "b = %B (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );     

end // encerra main    
endmodule // encerra Guia_0103
