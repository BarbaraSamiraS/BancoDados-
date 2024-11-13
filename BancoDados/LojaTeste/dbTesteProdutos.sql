-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva

CREATE DATABASE dbTesteProdutos 
GO
 
USE dbTesteProdutos

------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Tabela de teste MERGE ---------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


--PRODUTOS DA LOJA 1
	CREATE TABLE tbProdutosLj1 (
		idProduto INT
		,nomeProduto VARCHAR(255) 
		,precoProduto FLOAT
		,qtdeProduto INT
		,PRIMARY KEY (idProduto)
	)

--PRODUTOS DA LOJA 2
	CREATE TABLE tbProdutosLj2 (
		idProduto INT
		,nomeProduto VARCHAR(255) 
		,precoProduto FLOAT
		,qtdeProduto INT
		,PRIMARY KEY (idProduto)
	)

--PRODUTOS DA LOJA GERAL
	CREATE TABLE tbProdutosGeral (
		idProduto INT
		,nomeProduto VARCHAR(255) 
		,precoProduto FLOAT
		,qtdeProduto INT
		,PRIMARY KEY (idProduto)
	)
