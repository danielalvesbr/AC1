/*
Guia_0302.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0302;  // módulo Guia_0302

// define dados
reg [7:0] a = 8'h0a ;  // valor hexadecimal de a {registrador de 8 bits em hexadecimal}
reg [6:0] b = 8'o15 ;  // valor octal de b {registrador de 7 bits em octal}
reg [5:0] c = 13 ;     // valor decimal de c {registrador de 6 bits em decimal}
reg [7:0] d = 0 ;      // registrador para complemento de a {inicializa d com 0}
reg [6:0] e = 0 ;      // registrador para complemento de b {inicializa e com 0}
reg [5:0] f = 0 ;      // registrador para complemento de c {inicializa f com 0}

// ações
initial   // início da execução
begin : main  // função principal
$display ( "Guia_0302 - Tests" );  // título do teste

// operação de complemento de 2 em a
d = ~a + 1;  // complementa a {complemento de 2 de a}
$display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b", a, ~a, d );  // exibe a, C1(a) e C2(a)

// operação de complemento de 2 em b
e = ~b + 1;  // complementa b {complemento de 2 de b}
$display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b", b, ~b, e );  // exibe b, C1(b) e C2(b)

// operação de complemento de 2 em c
f = ~c + 1;  // complementa c {complemento de 2 de c}
$display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, f );  // exibe c, C1(c) e C2(c)

end // fim da execução
endmodule // fim do módulo Guia_0302
