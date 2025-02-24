/*
Guia_0202.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0202;   // módulo Guia_0202

// define data
real x = 0.75;       // valor inicial 0.75
integer y = 7;       // contador de 7 a 0
reg [7:0] b = 0;     // registrador de 8 bits com valor inicial 0

// actions
initial             // início da execução
begin : main        // função principal
$display ( "Guia_0202 - Tests" );   // título do teste
$display ( "x = %f" , x );         // exibe valor de x
$display ( "b = 0.%8b", b );       // exibe b em binário

while ( x > 0 && y >= 0 )  // laço até x > 0 e y >= 0
begin
if ( x*2 >= 1 )           // se x*2 >= 1
begin
b[y] = 1;                // define bit como 1
x = x*2.0 - 1.0;         // remove a parte inteira de x
end
else
begin
b[y] = 0;                // define bit como 0
x = x*2.0;               // multiplica x por 2
end // fim do if
$display ( "b = 0.%8b", b );  // exibe b a cada iteração
y=y-1;                         // decrementa y
end // fim do while

end // fim da função
endmodule // fim do módulo Guia_0202
