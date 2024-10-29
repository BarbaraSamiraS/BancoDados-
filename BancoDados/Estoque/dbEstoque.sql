-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva


CREATE DATABASE dbEstoque
GO

USE dbEstoque

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TABELAS

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tabela de Cliente

CREATE TABLE tblCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR (100)
	, cpfCliente VARCHAR (11)
	, emailCliente VARCHAR (130)
	, sexoCliente VARCHAR (30)
	, dataNascimentoCliente DATE
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tabela de Vendas 

CREATE TABLE tblVendas (
	codVenda INT PRIMARY KEY
	, dataVenda DATE
	, valorTotalVenda FLOAT
	, codCliente INT FOREIGN KEY REFERENCES tblCliente 
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tabela do Fabricante

CREATE TABLE tblFabricante (
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	, nomeFabricante VARCHAR(200) 
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tabela do Fornecedor

CREATE TABLE tblFornecedor (
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	, nomeFornecedor VARCHAR(200) 
	, contatoFornecedor VARCHAR(100) 
)


-------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Tabela de Produto

CREATE TABLE tblProduto (
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	, descricaoProduto VARCHAR(200) 
	, valorProduto FLOAT
	, quantidade INT
	, codFabricante INT FOREIGN KEY REFERENCES tblFabricante
	, codFornecedor INT FOREIGN KEY REFERENCES tblFornecedor
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tabela de Itens da Venda 

CREATE TABLE tblItensVenda (
	codItensVenda INT PRIMARY KEY IDENTITY(1,1)
	, codVenda INT FOREIGN KEY REFERENCES tblVendas
	, codProduto INT FOREIGN KEY REFERENCES tblProduto 
	, quantidadeDeItensVenda INT 
	, subTotalItensVenda FLOAT
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

