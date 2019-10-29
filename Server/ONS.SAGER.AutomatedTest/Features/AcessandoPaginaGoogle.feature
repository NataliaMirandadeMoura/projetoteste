#language: pt
#encoding: iso-8859-1

Funcionalidade: AcessandoPaginaGoogle
	Como um usuário do sistema
	eu quero acessar a pagina do google
	afim de realizar uma pesquisa

@mytag
Cenario: Acessando a página do google
	Dado que estou na página do google
	Quando preencho o campo de pesquisa
	E clico no enter
	Então o sistema muda de página
