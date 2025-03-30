/**
Arquitetura de Computadores I - Guia_01.java
874770 - Daniel Alves Gonçalves
*/

public class Guia_01{


//Contador de erros.
private static int errors = 0;


//Testar se dois valores sao iguais. (x e y)
public static void test_equals( Object x, Object y ){
if ((""+x).compareTo(""+y) != 0)
errors = errors + 1;
} // end test_equals ( )


//Exibir o total de erros. (retorna mensagem com o total de erros)
public static String test_report( ){
return (""+errors);
} // end test_report ( )


//Converter valor decimal para binario. (retorna binario)
public static String dec2bin( int value ){
    if(value == 0){
        return ("0");
    }
    String binario = "";
    while(value > 0){
        binario = (value % 2) + binario;
        value = value / 2;
    }
return (binario);
} // end dec2bin ( )


//Converter valor binario para decimal. (retorna decimal)
public static int bin2dec( String value ){
    if(value.equals("0")){
        return (0);
    }
    int decimal = 0;
    int size = value.length();
    for(int k = 0; k < size; k++){
        if(value.charAt(k) == '1'){
            decimal = decimal + (int)Math.pow(2, size - 1 - k);
        }
        else if(value.charAt(k) != '0'){
            return( -1 );
        }
    }
return(decimal);
} // end bin2dec ( )


//Converter valor decimal para base indicada. (retorna base para conversao)
public static String dec2base( int value, int base ){
    if(value == 0){
        return ("0");
    }
    String resultado = "";
    while(value > 0){
            int resto = value % base;
            if(base == 16){
                resultado = "0123456789ABCDEF".charAt(resto) + resultado; //Converte para hexa
            }else{
            resultado = resto + resultado;
            }
            value = value / base;
        }
return (resultado);
} // end dec2base ( )


//Converter valor binario para base indicada. (retorna valor na base equivalente)
public static String bin2base( String value, int base ){
        if(value.equals("0")){
        return ("0");
    }
    //Converte binario pra decimal primeiro
    int decimal = 0;
    int size = value.length();
    for(int k = 0; k < size; k++){
        if(value.charAt(k) == '1'){
            decimal = decimal + (int)Math.pow(2, size - 1 - k);
        }
        else if(value.charAt(k) != '0'){
            return( "-1" );
        }
    }
    //Agora converte decimal para a base desejada
    String resultado = "";
        while(decimal > 0){
            int resto = decimal % base;
            if(base == 16){
                resultado = "0123456789ABCDEF".charAt(resto) + resultado; //Converte para hexa
            }else{
            resultado = resto + resultado;
            }
            decimal = decimal / base;
        }
    return (resultado);
} // end bin2base ( )


//Converter valor em ASCII para hexadecimal. (retorna hexadecimal equivalente)
public static String ASCII2hex( String value ){
    if(value.isEmpty()){
        return("0"); 
    }

    String resultado = "";
    for(int k = 0; k < value.length(); k++){
        int ascii = (int)value.charAt(k); //Passa em ASCII
        String hexa = Integer.toHexString(ascii); //Converte para hexa
        //Garantir 2 digitos sempre e valores espacados:
        if(hexa.length() == 1){
            resultado = resultado + ("0" + hexa) + ""; 
        }else{
            resultado = resultado + hexa + "";
        }
    }   
    return (resultado.toUpperCase()); //Retorna as letras maiusculas
} // end ASCII2hex ( )


//Converter valor em hexadecimal para ASCII. (retorna ASCII equivalente)
public static String hex2ASCII( String value ){
    if (value.isEmpty() || value.length() % 2 != 0) {
        return "0"; //Se string vazia ou número ímpar de caracteres
    }

    String resultado = "";
    for(int k = 0; k < value.length(); k += 2){
        String parNum = value.substring(k, k + 2); //Pega 2 caracteres de cada vez
        int ascii = Integer.parseInt(parNum, 16); //Converte de hexadecimal para decimal
        resultado += (char) ascii; //Converte decimal para caractere ASCII
    }
    return (resultado);
} // end hex2ASCII ( )


/*
Acao principal.
*/
public static void main( String [ ] args ){

System.out.println ( "Guia_01 - Java Tests " );
System.out.println ( "874770 - Daniel Alves Gonçalves " );
System.out.println ( );

test_equals ( dec2bin ( 27 ), "11011" );
test_equals ( dec2bin ( 51 ), "110011" );
test_equals ( dec2bin ( 725 ), "1011010101" );
test_equals ( dec2bin ( 132 ), "10000100" );
test_equals ( dec2bin ( 360 ), "101101000" );
System.out.println ( "1. errorTotalReport = "+test_report ( ) );
test_equals ( bin2dec ( "10011" ), 19 );
test_equals ( bin2dec ( "10101" ), 21 );
test_equals ( bin2dec ( "10110" ), 22 );
test_equals ( bin2dec ( "110010" ), 50 );
test_equals ( bin2dec ( "111011" ), 59 );
System.out.println ( "2. errorTotalReport = "+test_report ( ) );
test_equals ( dec2base ( 54, 4 ), "312" );
test_equals ( dec2base ( 67, 8 ), "103" );
test_equals ( dec2base ( 76, 16 ), "4C" );
test_equals ( dec2base ( 157, 16 ), "9D" );
test_equals ( dec2base ( 731, 16 ), "2DB" );
System.out.println ( "3. errorTotalReport = "+test_report ( ) );
test_equals ( bin2base ( "10110", 4 ), "22" );
test_equals ( bin2base ( "11011", 8 ), "33" );
test_equals ( bin2base ( "100100", 16 ), "24" );
test_equals ( bin2base ( "101011", 8 ), "53" );
test_equals ( bin2base ( "101100", 4 ), "230" );
System.out.println ( "4. errorTotalReport = "+test_report ( ) );
test_equals ( ASCII2hex ( "PUC-Minas" ), "5055432D4D696E6173" );
test_equals ( ASCII2hex ( "2025-01" ), "323032352D3031" );
test_equals ( ASCII2hex ( "Belo Horizonte - M.G." ), "010000100110010101101100011011110010000001001000011011110111001001101001011110100110111101101110011101000110010100100000001011010010000001001101001011100100011100101110" );
// OBS.: A seguir, exemplos apenas para os primeiros, acrescentar todos os outros códigos propostos!
test_equals ( hex2ASCII ( "156157151164145" ), "6E6F697465" ); // OBS.: 164 e' o primeiro octal (0o164)!
test_equals ( hex2ASCII ( "4D616E6861" ), "Manha" ); // OBS.: 4E e' o primeiro hexadecimal (0x4E)!
System.out.println ( "5. errorTotalReport = "+test_report( ) );
System.out.print ( "\n\nApertar ENTER para terminar." );
System.console ( ).readLine ( );
} // end main
} // end class