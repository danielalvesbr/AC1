Olá Theldo, 

Depois de apanhar pro verilog, aprendi a similaridade com C, mas não entendi a parte:

initial 
    begin: main
        
	(...)

        // Testar as combinações de entradas
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
end

Como esse #1 funciona? Eu entendi o sistema de funções(módulos), reg, wire...
Mas esse begin: main não sei oq equivale em C, lembro de você falar que o $monitor muda se houver mudança na variável, mas essa parte de // Testar as combinações de entradas pra baixo não entendi.

Te mandei o Guia_0501 completo, e separei os PNGs e o arquivo executável .circ,
se preferir que faça tudo em 1 arquivo você me avisa no futuro.

De qualquer forma, até breve, obrigado!