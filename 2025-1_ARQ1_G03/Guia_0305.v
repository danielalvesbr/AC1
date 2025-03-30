/*
Guia_0305.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0305;  // módulo Guia_0305

// define dados
reg [2:0] a = 0 ; // valor binário de a {registrador de 3 bits}
reg [3:0] b = 0 ; // valor binário de b {registrador de 4 bits}
reg [4:0] c = 0 ; // valor binário de c {registrador de 5 bits}
reg [4:0] d = 0 ; // valor binário de d {registrador de 5 bits}
reg [6:0] e = 0 ; // valor binário de e {registrador de 7 bits}

// ações
initial   // início da execução
begin : main  // função principal
$display ( "Guia_0305 - Tests" );  // título do teste

// operações com overflow (transbordamento)
a = 5 + 3;  // OVERFLOW (transbordamento) {a recebe o valor de 5 + 3}
b = 10 - 5 + 25 + 3 + 1;  // OVERFLOW (transbordamento) {b recebe a soma resultante}
c = 2 - 35;  // OVERFLOW (transbordamento) {c recebe a diferença resultante}

// exibe resultados de overflow
$display("\nOverflow");
$display("a = %d = %3b = %d", (5+3) , a, a);  // exibe a em decimal e binário
$display("b = %d = %4b = %d", (10 - 5 + 25 + 3 + 1), b, b);  // exibe b em decimal e binário
$display("c = %d = %5b = %d", (2-35), c, c);  // exibe c em decimal e binário

// operação de complemento de 2
$display("\nComplements");
$display("0= %d = %3b = %3b", ~1 , (1-1), ~(1*1) );  // exibe complementos de 1
$display("1= %d = %3b = %3b", ~0 , (2-1), ~(0*1) );  // exibe complementos de 0
$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0 );  // exibe complementos de 2

end // fim da execução
endmodule // fim do módulo Guia_0305
