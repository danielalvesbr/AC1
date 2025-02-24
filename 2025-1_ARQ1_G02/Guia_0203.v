/*
Guia_0203.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0203;   // módulo Guia_0203

// define data
real x = 0.625;      // valor inicial 0.625
reg [7:0] b = 8'b1010_0000;  // registrador de 8 bits com valor inicial 10100000

// actions
initial              // início da execução
begin : main         // função principal
$display ( "Guia_0203 - Tests" );   // título do teste
$display ( "x = %f" , x );         // exibe valor de x em decimal
$display ( "b = 0.%8b", b );       // exibe b em binário
$display ( "b = 0.%x%x (16)", b[7:4], b[3:0] );  // exibe b em hexadecimal
$display ( "b = 0.%o%o%o (8) ", b[7:5], b[4:2], b[1:0] );  // exibe b em octal

end // fim da função
endmodule // fim do módulo Guia_0203
