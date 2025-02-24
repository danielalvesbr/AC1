/*
Guia_0101.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0101;   // define um modulo Guia_0101

// define data
integer x = 13; // decimal {int x = 13;}
reg [7:0] b = 0; // binary (bits - little endian) {zera um registrador de 8 bits}

// actions
initial         // equivale a funcão main {main()}
begin : main    // inicia a função
$display ( "Guia_0101 - Tests" );   // $display(); equivale a função printf {printf();}
$display ( "x = %d" , x );          // ("x = %d", x) para printar uma variavel (%d - decimal, %b - binario, %s - string)
$display ( "b = %8b", b );          // "printando" 8 bits com valor zerado
b = x;                              // atribuindo valor de x para b
$display ( "b = %8b", b );          // "printando" 8 bits com valor de x: (13 em binario = 00001101)

end // encerra main    
endmodule // encerra Guia_0101