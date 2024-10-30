SELECT dbEstoque.dbo.CPF_VALIDO(cpfCliente) FROM tblCliente
USE dbEstoque

GO

CREATE FUNCTION CPF_VALIDO(@CPF VARCHAR(11))
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @INDICE INT,
            @SOMA INT,
            @DIG1 INT,
            @DIG2 INT,
            @CPF_TEMP VARCHAR(11),
            @DIGITOS_IGUAIS CHAR(1),
            @RESULTADO CHAR(1)
    
    SET @RESULTADO = 'N'
    /*
    Verificando se os digitos são iguais
    A princípio CPF com todos os números iguais são inválidos
    apesar de validar o cálculo do dígito verificado
    EX: O CPF 00000000000 é inválido, mas pelo cálculo
    validaria
    */
    SET @CPF_TEMP = SUBSTRING(@CPF, 1, 1)
    SET @INDICE = 1
    SET @DIGITOS_IGUAIS = 'CPF válido'
    
    WHILE (@INDICE <= 11)
    BEGIN
        IF SUBSTRING(@CPF, @INDICE, 1) <> @CPF_TEMP
            SET @DIGITOS_IGUAIS = 'CPF inválido'
        
        SET @INDICE = @INDICE + 1
    END;
    
    -- Caso os dígitos não sejam todos iguais, começo o cálculo do dígito
    IF @DIGITOS_IGUAIS = 'CPF inválido' 
    BEGIN
        -- Cálculo do 1º dígito
        SET @SOMA = 0
        SET @INDICE = 1
        
        WHILE (@INDICE <= 9)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1)) * (11 - @INDICE);
            SET @INDICE = @INDICE + 1
        END
        
        SET @DIG1 = 11 - (@SOMA % 11)
        IF @DIG1 > 9
            SET @DIG1 = 0;
        
        -- Cálculo do 2º dígito
        SET @SOMA = 0
        SET @INDICE = 1
        
        WHILE (@INDICE <= 10)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1)) * (12 - @INDICE);
            SET @INDICE = @INDICE + 1
        END
        
        SET @DIG2 = 11 - (@SOMA % 11)
        IF @DIG2 > 9
            SET @DIG2 = 0;
        
        -- Validando
        IF (@DIG1 = SUBSTRING(@CPF, LEN(@CPF) - 1, 1)) AND (@DIG2 = SUBSTRING(@CPF, LEN(@CPF), 1))
            SET @RESULTADO = 'CPF válido'
        ELSE
            SET @RESULTADO = 'CPF inválido'
    END
    
    RETURN @RESULTADO
END
