-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva

------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Exercicio de teste MERGE ------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

	MERGE tbProdutosGeral dest
		USING tbProdutosLj1 ori
		ON ori.idProduto = dest.idProduto
		WHEN NOT MATCHED THEN
		INSERT values (ori.idProduto, ori.nomeProduto, ori.precoProduto, ori.qtdeProduto)
		WHEN MATCHED THEN
		UPDATE SET dest.qtdeProduto += ori.qtdeProduto;


	MERGE tbProdutosGeral dest
		USING tbProdutosLj2 ori
		ON ori.idProduto = dest.idProduto
		WHEN NOT MATCHED THEN
		INSERT values (ori.idProduto, ori.nomeProduto, ori.precoProduto, ori.qtdeProduto)
		WHEN MATCHED THEN
		UPDATE SET dest.qtdeProduto += ori.qtdeProduto;


-- Select 

	SELECT * FROM tbProdutosGeral
