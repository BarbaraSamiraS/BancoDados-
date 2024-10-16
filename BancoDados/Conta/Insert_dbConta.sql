USE dbConta

--  tabela cliente

INSERT INTO tbCliente (nomeCliente, cpfCliente)
VALUES 
('João Silva', '123.456.789-00'),
('Maria Oliveira', '987.654.321-11'),
('Carlos Souza', '456.789.123-22'),
('Ana Pereira', '321.654.987-33'),
('Pedro Santos', '789.123.456-44')

--  tabela Conta Corrente

INSERT INTO tbContaCorrente (saldoConta, codCliente)
VALUES 
(1500.75, 1), 
(2500.00, 2), 
(3200.50, 3),
(1800.25, 4),
(5000.00, 5)

--  tabela Deposito

INSERT INTO tbDeposito (valorDeposito, dataDeposito, horaDeposito, numConta)
VALUES 
(500.00, '2023-10-12', '09:30:00', 3), 
(1000.00, '2023-11-11', '10:15:00', 4), 
(750.00, '2023-10-09', '11:45:00', 5),
(1200.00, '2023-10-12', '12:20:00', 1),
(2000.00, '2024-10-08', '13:05:00', 2)

--  tabela Saque

INSERT INTO tbSaque (valorSaque, dataSaque, horaSaque, numConta)
VALUES 
(300.00, '2023-10-11', '14:00:00', 3), 
(500.00, '2023-10-11', '14:30:00', 4), 
(450.00, '2023-10-11', '15:00:00', 5),
(600.00, '2023-10-11', '15:45:00', 2),
(800.00, '2023-10-11', '16:20:00', 1)

select * from tbCliente
select * from tbContaCorrente
select * from tbDeposito
select * from tbSaque
