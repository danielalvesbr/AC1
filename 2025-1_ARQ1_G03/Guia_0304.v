/*
Guia_0304.v
999999 - Daniel Alves Gonçalves
*/

module Guia_0304;  // módulo Guia_0304

// define dados
reg signed [7:0] a = 8'b1111_1010; // valor binário de a {registrador de 8 bits com sinal}
reg signed [6:0] b = 8'b1111_101 ; // valor binário de b {registrador de 7 bits com sinal}
reg signed [5:0] c = 8'b0001_10 ; // valor binário de c {registrador de 6 bits com sinal}
reg signed [7:0] d = 0 ;         // registrador para a operação de subtração de a
reg signed [6:0] e = 0 ;         // registrador para a operação de subtração de b
reg signed [5:0] f = 0 ;         // registrador para a operação de subtração de c

// ações
initial   // início da execução
begin : main  // função principal
$display ( "Guia_0304 - Tests" );  // título do teste

// exibe valores de a, b e c em binário e decimal
$display ( "a = %8b = %d", a, a );  // exibe a em binário e como decimal
$display ( "b = %8b = %d", b, b );  // exibe b em binário e como decimal
$display ( "c = %8b = %d", c, c );  // exibe c em binário e como decimal

// operação de subtração a - b
d = a - b;  // subtrai b de a {subtração de a e b}
$display ( "d = a-b = %8b-%8b = %8b = %d", a, b, d, d );  // exibe a-b em binário e como decimal

// operação de subtração b - a
d = b - a;  // subtrai a de b {subtração de b e a}
$display ( "d = b-a = %8b-%8b = %8b = %d", b, a, d, d );  // exibe b-a em binário e como decimal

// operação de subtração a - c
d = a - c;  // subtrai c de a {subtração de a e c}
$display ( "d = a-c = %8b-%8b = %8b = %d", a, c, d, d );  // exibe a-c em binário e como decimal

// operação de subtração c - a
d = c - a;  // subtrai a de c {subtração de c e a}
$display ( "d = c-a = %8b-%8b = %8b = %d", c, a, d, d );  // exibe c-a em binário e como decimal

end // fim da execução
endmodule // fim do módulo Guia_0304
