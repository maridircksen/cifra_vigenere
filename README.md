
# Cifra de Vigenère em Pascal

Este projeto é uma implementação simples da cifra de Vigenère em Pascal. A cifra de Vigenère é uma técnica clássica de criptografia que usa uma chave repetida para codificar e decodificar mensagens.

## Como Funciona a Cifra de Vigenère

A cifra de Vigenère é uma extensão da cifra de César, onde o deslocamento é determinado por uma chave. Em vez de usar um único deslocamento, a cifra de Vigenère usa um deslocamento diferente para cada letra do texto, baseado na letra correspondente da chave.

### Criptografia

1. **Transformação do Texto e da Chave em Números**: O texto e a chave são convertidos em números correspondentes às suas posições no alfabeto.
2. **Aplicação da Cifra**: Para cada letra do texto, o número correspondente é ajustado pelo número correspondente à letra da chave, resultando em um novo número.
3. **Conversão de Volta para Texto**: O novo número é convertido de volta para uma letra, formando o texto criptografado.

### Descriptografia

1. **Transformação do Texto Criptografado e da Chave em Números**: Similar à criptografia, mas com o texto criptografado e a chave.
2. **Aplicação do Deslocamento Inverso**: O número correspondente ao texto criptografado é ajustado subtraindo o número da chave, revertendo o texto ao formato original.
3. **Conversão de Volta para Texto**: O número resultante é convertido novamente em uma letra.


## Exemplo de Uso
Definir como palavra para Criptografar: COMPUTADOR
Palavra Chave: SEGURANCA

Observação: Para descriptografar basta utilizar o termo criptografado e palavra chave
