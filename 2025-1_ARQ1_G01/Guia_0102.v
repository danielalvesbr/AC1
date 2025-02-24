/*
Guia_0102.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0102;   // define um módulo Guia_0102

// define data
integer x = 0;               // decimal {int x = 0;}
reg [7:0] b = 8'b00001101;   // binary (bits - little endian) {define um registrador de 8 bits com valor 00001101(13)}

// actions
initial         // equivale à função main {main()}
begin : main    // inicia a função
$display ( "Guia_0102 - Tests" );   // $display(); equivale à função printf {printf();}
$display ( "x = %d" , x );          // ("x = %d", x) para printar uma variavel (%d - decimal, %b - binário, %s - string)
$display ( "b = %8b", b );          // "printando" 8 bits com o valor inicial de b: (13 em binario = 00001101)
x = b;                              // atribuindo o valor de b para x
$display ( "x = %d", x );           // "printando" x em decimal (13)

end // encerra main    
endmodule // encerra Guia_0102