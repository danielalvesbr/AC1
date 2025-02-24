/*
Guia_0205.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0205;   // módulo Guia_0205

// define data
reg [7:0] a = 8'b000_1010; // valor de a (binário)
reg [7:0] b = 8'b000_1100; // valor de b (binário)
reg [7:0] c;               // variável c para armazenar os resultados

// actions
initial            // início da execução
begin : main     // função principal
$display ( "Guia_0205 - Tests" );   // exibe título
$display ( "a = %8b", a );          // exibe a em binário
$display ( "b = %8b", b );          // exibe b em binário

c = a + b;                          // soma a e b
$display ( "c = a+b = %8b", c );     // exibe soma

c = a - b;                          // subtrai b de a
$display ( "c = a-b = %8b", c );     // exibe subtração

c = b - a;                          // subtrai a de b
$display ( "c = b-a = %8b", c );     // exibe subtração

c = a * b;                          // multiplica a por b
$display ( "c = a*b = %8b", c );     // exibe multiplicação

c = b / a;                          // divide b por a
$display ( "c = b/a = %8b", c );     // exibe divisão

c = b % a;                          // calcula o módulo de b por a
$display ( "c = b%%a = %8b", c );    // exibe módulo

end // fim da função
endmodule // fim do módulo Guia_0205
