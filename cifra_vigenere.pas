{Acadêmica: Mariana Dircksen}

program CifraDeVigenere;

uses crt;  { Limpar a tela }

	const
	MAX = 255;   { O maior tamanho possível para o texto e a chave }
	ERRO = -1;    { Um valor especial que indica que houve um erro }
	
	type
	numerosIndice = array[1..MAX] of integer;  { Irá armazenar uma lista de números inteiros }

	{ Esta função transforma o texto em números de 0 a 25 }
function ConverterTextoParaNumerico(texto: string; var resultado: numerosIndice): integer;
var
i: integer;
	begin
		{ Irá passar por cada letra do texto }
		for i := 1 to Length(texto) do  { Usa a função Length para obter o número de caracteres no texto }
			begin
				{ Checa se a letra é uma letra do alfabeto (A-Z ou a-z) }
				if (ord(texto[i]) >= 65) and (ord(texto[i]) <= 90) or (ord(texto[i]) >= 97) and (ord(texto[i]) <= 122) then
				begin
					{ Converte a letra em um número entre 0 e 25 }
					if ord(texto[i]) < 97 then
						resultado[i] := ord(texto[i]) - 65
					else
						resultado[i] := ord(texto[i]) - 97;
				end
				else
				begin
					{ Se encontrar um caractere que não seja letra, mostra uma mensagem de erro }
					writeln('Erro! Informe apenas letras de A-Z.');
					ConverterTextoParaNumerico := ERRO;  { Indica que houve um erro }
				end;
			end;
		{ Retorna o tamanho do texto convertido usando a função Length }
		ConverterTextoParaNumerico := Length(texto);
	end;

{ Este procedimento ajusta a chave para combinar com o tamanho do texto }
procedure AjustarChave(chaveNumerica, entradaNumerica: numerosIndice; termoChave, termoEntrada: integer; var chaveAjustada: numerosIndice);
var i: integer;
	begin
		{ Se a chave é menor ou igual ao texto, repete a chave até o tamanho do texto }
		if termoChave <= termoEntrada then
		begin
			for i := 1 to termoEntrada do
			chaveAjustada[i] := chaveNumerica[(i - 1) mod termoChave + 1];
		end
		else
			writeln('Erro! Informe uma chave menor ou uma entrada maior.');  { Mostra mensagem se a chave for muito longa }
	end;

{ Esta função criptografa ou descriptografa o texto usando a cifra de Vigenère }
function ProcessarCifraVigenere(operacao: char; chave, texto: string): string;
	var
	chaveNumerica, textoNumerico, chaveAjustada, resultadoNumerico: numerosIndice;
	i, termoChave, termoTexto: integer;
	resultado: string;
	begin
		{ Converte a chave e o texto em números }
		termoChave := ConverterTextoParaNumerico(chave, chaveNumerica);
		if termoChave = ERRO then
		begin
			ProcessarCifraVigenere := '';
		end;
			termoTexto := ConverterTextoParaNumerico(texto, textoNumerico);
			if termoTexto = ERRO then
			begin
				ProcessarCifraVigenere := '';
			end;
			{ Ajusta a chave para ter o mesmo tamanho que o texto }
			AjustarChave(chaveNumerica, textoNumerico, termoChave, termoTexto, chaveAjustada);
			resultado := '';  { Inicializa a variável que vai guardar o resultado }
			for i := 1 to termoTexto do
			begin
				{ Se for criptografar, adiciona a chave ao texto }
				if operacao = 'E' then
					resultadoNumerico[i] := (textoNumerico[i] + chaveAjustada[i]) mod 26
					{ Se for descriptografar, subtrai a chave do texto }
				else
					resultadoNumerico[i] := (textoNumerico[i] - chaveAjustada[i] + 26) mod 26;
					{ Converte o número de volta para letra e adiciona ao resultado }
					resultado := resultado + chr(resultadoNumerico[i] + 65);
			end;
	{ Retorna o resultado da criptografia ou descriptografia }
	ProcessarCifraVigenere := resultado;
	end;

{ Esta função mostra o menu e faz o que o usuário escolher }
procedure MostrarMenu();
var
chave, texto, resultado: string;
opcao: integer;
textoCriptografado: string;
	begin
		textoCriptografado := '';  { Inicializa a variável para guardar o texto criptografado }
		clrscr;  
		while True do
		begin
			writeln('-----------------------------------------');
			writeln('Cifra de Vigenère');
			writeln('-----------------------------------------');
			writeln('1. Criptografar');
			writeln('2. Descriptografar');
			writeln('0. Sair');
			write('Escolha uma opção: ');
			readln(opcao);
			
			case opcao of
			1: begin
			{ Se o usuário escolheu criptografar }
			write('Informe o texto para criptografar: ');
			readln(texto);
			write('Informe a chave: ');
			readln(chave);
			resultado := ProcessarCifraVigenere('E', chave, texto);
			textoCriptografado := resultado;  { Guarda o texto criptografado }
			writeln('Texto criptografado: ', resultado);
			end;
			
			2: begin
			{ Se o usuário escolheu descriptografar }
			if textoCriptografado = '' then
			begin
			writeln('Nenhum texto criptografado disponível para descriptografar.');
			continue;
			end;
			write('Informe a chave para descriptografar: ');
			readln(chave);
			resultado := ProcessarCifraVigenere('D', chave, textoCriptografado);
			writeln('Texto descriptografado: ', resultado);
			end;
			
			0: begin
			{ Se o usuário escolheu sair }
			writeln('Saindo...');
			Break;  { Sai do loop e fecha o programa }
			end;
			
			else
			{ Se a opção não for válida }
			writeln('Opção inválida. Por favor, escolha uma opção válida.');
			end;
			
			writeln;
			readkey;  { Espera o usuário pressionar uma tecla antes de limpar a tela }
			clrscr;  { Limpa a tela para o próximo menu }
		end;
	end;

begin
	MostrarMenu;  
end.
