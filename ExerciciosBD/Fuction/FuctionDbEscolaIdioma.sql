-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva

----------------------------------------------------------------------------------------------------------------
----------------------------- Exercicio de Function utilizando dbEscolaIdiomas ---------------------------------
----------------------------------------------------------------------------------------------------------------

-- DB Escola -----
USE dbEscola

-- 1- Crie uma função que informada uma data da  matrícula retorne o dia da semana.

CREATE FUNCTION fcDiaDaSemana (@dataMatricula SMALLDATETIME)
	RETURNS VARCHAR(20)  
AS
BEGIN 
    RETURN DATENAME(WEEKDAY, @dataMatricula)  
END

-- Resultado: ----------------------------------------------------------------------------------------------

SELECT dbo.fcDiaDaSemana(CONVERT(smalldatetime, '2024-10-08')) AS 'Dia da Semana'
------------------------------------------------------------------------------------------------------------

-- 2- Crie uma funçao que de acordo com a carga horária do curso exiba curso rápido ou curso extenso. (Rápido menos de 1000 horas).

CREATE FUNCTION fcDuracaoCurso (@cargaHoraria INT)
RETURNS VARCHAR(20)  
AS
BEGIN 
	DECLARE @duracao Varchar(20)
		
    IF @cargaHoraria < 1000
        SET @duracao = 'Curso rápido'
    ELSE
        SET @duracao = 'Curso extenso'

    RETURN @duracao;  
END

-- Resultado: ----------------------------------------------------------------------------------------------

-- Curso rápido
SELECT dbo.fcDuracaoCurso(800) AS 'Tempo de curso'

-- Curso extenso
SELECT dbo.fcDuracaoCurso(1200) AS 'Tempo de curso'

------------------------------------------------------------------------------------------------------------

-- 3- Crie uma funçao que de acordo com o valor do curso exiba curso caro ou curso barato. (Curso caro acima de 400).

CREATE FUNCTION fcValorCurso (@valor INT)
RETURNS VARCHAR(20)  
AS
BEGIN 
	DECLARE @valorCurso Varchar(20)
		
    IF @valor < 400
        SET @valorCurso = 'Curso barato'
    ELSE
        SET @valorCurso = 'Curso caro'

    RETURN @valorCurso;  
END
-- Resultado: ----------------------------------------------------------------------------------------------

-- Curso caro
SELECT dbo.fcValorCurso(500) AS 'Valor do curso'  

-- Curso barato
SELECT dbo.fcValorCurso(300) AS 'Valor de curso' 

------------------------------------------------------------------------------------------------------------
-- 4- Criar uma função que informada a data da matrícula converta-a no formato (dd/mm/aaaa).

CREATE FUNCTION fcConverterData (@dataMatricula SMALLDATETIME)
RETURNS VARCHAR(10)
AS
BEGIN 
    RETURN CONVERT(VARCHAR(10), @dataMatricula, 103)
END

-- Resultado: ----------------------------------------------------------------------------------------------

SELECT dbo.fcConverterData('2024-10-09') AS 'Data Convertida'


