#language: pt
#encoding: iso-8859-1

Funcionalidade: FazerPesquisaNoGoogle
	Como um usuário
	Eu quero fazer uma busca no google
	De forma que ele traga o resultado correto

Cenário: Fazer pesquisa
	Dado que  eu estou na página do Google
	Quando eu preencher o campo
	E clico  no botão de pesquisa
	Então o  sistema exibe o resultado da pesquisa 
