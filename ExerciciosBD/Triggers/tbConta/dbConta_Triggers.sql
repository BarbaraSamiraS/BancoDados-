
-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva

------------------------------------------------------------------------------------------------------------------------

 --------------------------------------------- Exercícios de Triggers Estoque -----------------------------------------

------------------------------------------------------------------------------------------------------------------------
-- database Veiculo
USE bdVeiculo

-- database Conta
USE dbConta

-- 1) Criar um trigger que ao veículo tomar uma multa os pontos da multa sejam atualizados na tabela do motorista no campo pontuacaoAcumulada. Caso o motorista alcance 20 pontos informar via mensagem que o mesmo poderá ter sua habilitação suspensa.

-- TRIGGER: tgAtualizarPontos

CREATE TRIGGER tgAtualizarPontos
ON tbMulta
AFTER INSERT
AS

BEGIN
    
	DECLARE @codMotorista INT, @codVeiculo INT, @numPontos INT, @pontuacaoAcumulada INT
	SET @codVeiculo = (SELECT codVeiculo FROM INSERTED)
	SELECT @numPontos = numPontos FROM INSERTED
	SET @codMotorista = (SELECT codMotorista FROM tbVeiculo WHERE codVeiculo = @codVeiculo)
	UPDATE tbMotorista
		SET pontuacaoAcumulada = pontuacaoAcumulada+@numPontos
		WHERE codMotorista = @codMotorista
		
	SELECT @pontuacaoAcumulada = pontuacaoAcumulada 
    FROM tbMotorista 
    WHERE codMotorista = @codMotorista

	BEGIN
		IF @pontuacaoAcumulada >20
			BEGIN
				PRINT('Você corre o risco de ter sua habilitação suspensa.')
			END
		ELSE
			BEGIN
				PRINT('Sua pontuação atual é de' +CONVERT(VARCHAR(5), @pontuacaoAcumulada) + ' pontos.')
			END
	END
	
    
END


-------------------------------------------------------------------------------------------------------------------------
-- Resultado: 

INSERT INTO tbMulta (dataMulta, numPontos, codVeiculo) VALUES
(GETDATE(), 5, 1)

-------------------------------------------------------------------------------------------------------------------------
-- SELECTS 

SELECT * FROM tbMulta
SELECT * FROM tbMotorista
SELECT * FROM tbVeiculo 

-------------------------------------------------------------------------------------------------------------------------

-- a) Ao ser feito um depósito atualize o saldo da conta corrente somando a quantia depositada

-- TRIGGER: tggAtualizarSaldo

CREATE TRIGGER tgAtualizarSaldo
ON tbDeposito
AFTER INSERT
AS

BEGIN

    DECLARE @valorDeposito FLOAT
    DECLARE @numConta INT
    
    SELECT @valorDeposito = valorDeposito, @numConta = numConta
    FROM inserted

    UPDATE tbContaCorrente
    SET saldoConta = saldoConta + @valorDeposito
    WHERE numConta = @numConta

END
GO

-------------------------------------------------------------------------------------------------------------------------
-- Resultado: 

-- Teste 1 
INSERT INTO tbContaCorrente VALUES
(2000,1)	
	

-------------------------------------------------------------------------------------------------------------------------
-- SELECTS 

SELECT * FROM tbDeposito
SELECT * FROM tbContaCorrente
-------------------------------------------------------------------------------------------------------------------------

-- b) Ao ser feito um saque atualize o saldo da conta corrente descontando o valor caso tenha saldo suficiente

-- TRIGGER: tgSaque

CREATE TRIGGER tgSaque
ON tbSaque
AFTER INSERT
AS

BEGIN

    DECLARE @valorSaque FLOAT
    DECLARE @numConta INT
    DECLARE @saldoConta FLOAT

    SELECT @valorSaque = valorSaque, @numConta = numConta
    FROM inserted

	SELECT @saldoConta = saldoConta FROM tbContaCorrente 
    WHERE @numConta = numConta

	BEGIN
		IF @valorSaque >@saldoConta
			BEGIN
				PRINT('Nâo e possivel sacar pois voce não possui o valor solicitado.')
			END
		ELSE
			BEGIN
				UPDATE tbContaCorrente
				SET saldoConta = saldoConta - @valorSaque
				WHERE numConta = @numConta


			END
	END

    

END
GO

-------------------------------------------------------------------------------------------------------------------------
-- Resultado: 

INSERT INTO tbSaque (valorSaque, dataSaque, horaSaque, numConta)
VALUES 
(800.00, '2023-10-11', '16:20:00', 1)

-------------------------------------------------------------------------------------------------------------------------
-- SELECTS 

select * from tbContaCorrente
select * from tbSaque

-------------------------------------------------------------------------------------------------------------------------
