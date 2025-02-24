/*
Guia_0204.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0204;   // módulo Guia_0204

// define data
real x = 0.625;             // valor de x (decimal)
reg [7:0] b = 8'b1010_0000; // valor de b (binário)
integer q [3:0];            // vetor de inteiros q com 4 elementos

// actions
initial           // início da execução
begin : main    // função principal
$display ( "Guia_0204 - Tests" );  // exibe título
$display ( "x = %f" , x );         // exibe x (real)
$display ( "b = 0.%8b", b );       // exibe b em binário (8 bits)
$display ( "b = 0.%x%x (16)", b[7:4], b[3:0] );  // exibe b em hexadecimal

q[3] = b[7:6];         // 2 bits mais significativos de b para q[3]
q[2] = b[5:4];         // próximos 2 bits de b para q[2]
q[1] = b[3:2];         // próximos 2 bits de b para q[1]
q[0] = b[1:0];         // 2 bits menos significativos de b para q[0]

$display ( "b = 0.%2b %2b %2b %2b (2)", b[7:6], b[5:4], b[3:2], b[1:0] );  // exibe b em grupos de 2 bits (binário)
$display ( "q = 0.%2d %2d %2d %2d (4)", q[3], q[2], q[1], q[0] );  // exibe q

end // fim da função
endmodule // fim do módulo Guia_0204
