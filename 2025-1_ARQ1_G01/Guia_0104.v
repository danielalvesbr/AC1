/*
Guia_0104.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0104;   // define um módulo Guia_0104

// define data
integer x = 13;       // decimal {int x = 13;}
reg [7:0] b = 0;      // binary (bits - little endian) {define um registrador de 8 bits com 0}

// actions
initial         // equivale à função main {main()}
begin : main    // inicia a função
$display ( "Guia_0104 - Tests" );   // $display(); equivale à função printf {printf();}
$display ( "x = %d" , x );          // ("x = %d", x) para printar uma variavel (%d - decimal, %b - binário, %s - string)
$display ( "b = %8b", b );          // "printando" 8 bits com valor inicial zerado (00000000)
b = x;                              // atribuindo o valor de x para b

// "printando" b em grupos de 4 bits: [%4b] [%4b] divide b em dois blocos de 4 bits (nibble alto e baixo)
// %x %x exibe esses blocos em hexadecimal e, para atribuir, limita o b[7:0], com a posição dos bits respectivamente
$display ( "b = [%4b] [%4b] = %x %x", b[7:4], b[3:0], b[7:4], b[3:0] ); 

end // encerra main    
endmodule // encerra Guia_0104
