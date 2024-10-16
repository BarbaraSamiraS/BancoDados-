USE bdVeiculo

INSERT INTO tbMotorista (nomeMotorista, cpfMotorista, pontuacaoAcumulada) 
VALUES 
('Carlos Silva', '123.456.789-00', 10),
('Ana Souza', '987.654.321-00', 5);

INSERT INTO tbVeiculo (placaVeiculo, renavam, anoFabricacao, codMotorista) 
VALUES 
('ABC1234', '0123456789', 2018, 1),
('XYZ5678', '9876543210', 2020, 2);

INSERT INTO tbMulta (dataMulta, numPontos, codVeiculo) 
VALUES 
('2024-09-12', 3, 1),
('2024-10-01', 5, 2);
