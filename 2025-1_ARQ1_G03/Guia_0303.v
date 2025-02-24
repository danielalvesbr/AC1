/*
Guia_0303.v
999999 - Daniel Alves Gonçalves
*/

module Guia_0303;  // módulo Guia_0303

// define dados
reg signed [7:0] a = 8'b1111_1010; // valor binário de a {registrador de 8 bits com sinal}
reg signed [6:0] b = 8'b1111_101 ; // valor binário de b {registrador de 7 bits com sinal}
reg signed [5:0] c = 8'b1111_10 ; // valor binário de c {registrador de 6 bits com sinal}
reg signed [7:0] d = 0 ;         // registrador para complemento de a {inicializa d com 0}
reg signed [6:0] e = 0 ;         // registrador para complemento de b {inicializa e com 0}

// ações
initial   // início da execução
begin : main  // função principal
$display ( "Guia_0303 - Tests" );  // título do teste

// operação de complemento de 2 em a
d = ~a + 1;  // complementa a {complemento de 2 de a}
e = ~(a - 1);  // outra forma de calcular o complemento de 2 de a {complemento de 2 de a usando subtração}
$display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b = %d = %d", a, ~a, d, d, e );  // exibe a, C1(a), C2(a) em binário e como decimal

// operação de complemento de 2 em b
d = ~b + 1;  // complementa b {complemento de 2 de b}
e = ~(b - 1);  // outra forma de calcular o complemento de 2 de b {complemento de 2 de b usando subtração}
$display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b = %d = %d", b, ~b, d, d, e );  // exibe b, C1(b), C2(b) em binário e como decimal

// operação de complemento de 2 em c
d = ~c + 1;  // complementa c {complemento de 2 de c}
e = ~(c - 1);  // outra forma de calcular o complemento de 2 de c {complemento de 2 de c usando subtração}
$display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", c, ~c, d, d, e );  // exibe c, C1(c), C2(c) em binário e como decimal

end // fim da execução
endmodule // fim do módulo Guia_0303
