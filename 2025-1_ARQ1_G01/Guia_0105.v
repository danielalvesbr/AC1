/*
Guia_0105.v
874770 - Daniel Alves Gonçalves
*/

module Guia_0105;   // define um módulo Guia_0105

// define data
integer x = 13;        // decimal {int x = 13;}
reg [7:0] b;          // binary (bits - little endian) {define um registrador de 8 bits sem inicialização}
reg [0:2][7:0] s = "PUC"; // char array[3] (3x8 bits - little Endian) {define um vetor de 3 caracteres armazenando "PUC"}

// actions
initial         // equivale à função main {main()}
begin : main    // inicia a função
$display ( "Guia_0105 - Tests" );   // $display(); equivale à função printf {printf();}
$display ( "x = %d" , x );          // ("x = %d", x) para printar uma variavel (%d - decimal, %b - binário, %s - string)
$display ( "b = %8b", b );          // "printando" b (valor indefinido, pois não foi inicializado)
$display ( "s = %s" , s );          // "printando" a string armazenada em s ("PUC")
b = x;                              // atribuindo o valor de x para b

// "printando" b em grupos de 4 bits (nibble alto e baixo) e %h exibe os nibbles em hexadecimal
$display ( "b = [%4b] [%4b] = %h %h", b[7:4], b[3:0], b[7:4], b[3:0] ); 


s[0] = "-";                         // alterando o primeiro caractere da string para '-'
s[1] = 8'b01001101;                 // alterando o segundo caractere para 'M' (ASCII: 0x4D)
s[2] = 71;                          // alterando o terceiro caractere para 'G' (ASCII: 0x47)
$display ( "s = %s" , s );          // "printando" a nova string armazenada em s ("-MG")

end // encerra main    
endmodule // encerra Guia_0105
