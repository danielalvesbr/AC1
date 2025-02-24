/*
Guia_0201.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0201;   // módulo Guia_0201

// define data
real x = 0 ;              // valor inicial de x {double x = 0.0;}
real power2 = 1.0;        // potências de 2 {double power2 = 1.0;}
integer y = 7 ;           // contador {int y = 7;}
reg [7:0] b = 8'b10100000; // registrador de 8 bits

// actions
initial         // início da execução
begin : main    // função principal
$display ( "Guia_0201 - Tests" );   // título do teste
$display ( "x = %f" , x );          // printa x
$display ( "b = 0.%8b", b );        // exibe b em binário

while ( y >= 0 )       // loop enquanto y >= 0
begin
    power2 = power2 / 2.0;  // divide power2 por 2
    if ( b[y] == 1 )        // se bit for 1
    begin
        x = x + power2;     // soma power2 a x
    end
    $display ( "x = %f", x ); // printa x atualizado
    y = y - 1;              // decrementa y
end // fim do loop

end // fim da função
endmodule // fim do módulo Guia_0201
