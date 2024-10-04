-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva

------------------------------------------------------------------------------------------------------------------------

---------------------------------------------- Exercícios de Triggers Estoque ------------------------------------------

------------------------------------------------------------------------------------------------------------------------

USE dbEstoqueTriggers



-- 1) Criar um trigger que, ao ser feita uma venda (Insert na tabela tbitensVenda), todos os produtos vendidos tenham sua quantidade atualizada na tabela tbProduto. Exemplo, se foi feita uma venda de 5 unidades do produto código 01, na tabela tbProduto a quantidade desse produto será a quantidade atual - 5;

-- TRIGGER: tgAtualizarProdutos

CREATE TRIGGER tgAtualizarProdutos
ON tblItensVenda FOR INSERT
AS
BEGIN
	DECLARE @saida INT, @codP INT 

	SET @saida = (SELECT quantidadeDeItensVenda FROM inserted)
	SET @codP = (SELECT codProduto FROM inserted)	
	UPDATE tblProduto
		SET quantidade = quantidade - @saida
		WHERE codProduto =	@codP

		PRINT ('Estoque atualizado com sucesso!')
END
GO

-------------------------------------------------------------------------------------------------------------------------
-- Resultado: 

INSERT INTO tblItensVenda VALUES
(1, 1, 12, 150.00)	

-------------------------------------------------------------------------------------------------------------------------
-- SELECTS 

SELECT * FROM tblProduto
SELECT * FROM tblItensVenda

-------------------------------------------------------------------------------------------------------------------------

-- 2) Criar uma trigger que, quando for inserida uma nova entrada de produtos na tbEntradaProduto, a quantidade desse produto seja atualizada e aumentada na tabela tbProduto;

-- TRIGGER: tgAtualizarProdutos



-------------------------------------------------------------------------------------------------------------------------
-- Resultado: 



-------------------------------------------------------------------------------------------------------------------------
-- SELECTS 


-------------------------------------------------------------------------------------------------------------------------

-- 3) Criar uma trigger que, quando for feita uma venda de um determinado produto, seja feito um Insert na tbSaidaProduto.

-- TRIGGER: tgRegistraVendas

CREATE TRIGGER tgRegistraVendas
ON tblItensVenda AFTER INSERT
AS
BEGIN
	DECLARE @datasaida DATE, @quantsaida INT, @codProduto INT, @codVenda INT, @codSaidaProduto INT

	SET @codVenda = (SELECT codVenda FROM inserted)
	SET @datasaida = GETDATE()
	SET @codProduto = (SELECT codProduto FROM inserted)
	SET @quantsaida = (SELECT quantidadeDeItensVenda FROM inserted)

	INSERT INTO tblSaidaProduto 
	VALUES (@datasaida, @quantsaida, @codProduto)

	SET @codSaidaProduto = (SELECT MAX(codSaidaProduto) FROM tblSaidaProduto) 
	PRINT('Saida cadastrada com sucesso com codigo ' +CONVERT(VARCHAR(5), @codSaidaProduto))
END
GO

-------------------------------------------------------------------------------------------------------------------------
-- Resultado: 

INSERT INTO tblItensVenda 
VALUES (9,5, 2200, 300.00)

-------------------------------------------------------------------------------------------------------------------------
-- SELECTS 

SELECT * FROM tblItensVenda
SELECT * FROM tblSaidaProduto

-------------------------------------------------------------------------------------------------------------------------