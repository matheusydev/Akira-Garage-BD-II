-- =========================================
-- População inicial do banco de dados
-- =========================================

-- FABRICANTE_MARCA
INSERT INTO FABRICANTE_MARCA (ID_FABRICANTE, NOME) VALUES
(1, 'Fabrica da Toyota'),
(2, 'Fabrica da Volkswagen'),
(3, 'Fabrica da Chevrolet'),
(4, 'Fabrica da Volvo'),
(5, 'Fabrica da Audi'),
(6, 'Fabrica da BMW'),
(7, 'Fabrica da Porsche'),
(8, 'Fabrica da Ferrari'),
(9, 'Fabrica da Koenigsegg'),
(10, 'Fabrica da BYD');

-- MARCA
INSERT INTO MARCA (ID_MARCA, ID_FABRICANTE_M, NOME) VALUES
(1, 1, 'Toyota'),
(2, 2, 'Volkswagen'),
(3, 3, 'Chevrolet'),
(4, 4, 'Volvo'),
(5, 5, 'Audi'),
(6, 6, 'BMW'),
(7, 7, 'Porsche'),
(8, 8, 'Ferrari'),
(9, 9, 'Koenigsegg'),
(10, 10, 'BYD');

-- MODELO
INSERT INTO MODELO (ID_MODELO, ID_MARCA_M, NOME) VALUES
(1, 1, 'Corolla'),
(2, 1, 'Hilux'),
(3, 2, 'Polo'),
(4, 2, 'Nivus'),
(5, 3, 'Opala'),
(6, 3, 'Prisma'),
(7, 4, 'XC60'),
(8, 4, 'XC90'),
(9, 5, 'A3'),
(10, 5, 'Q5'),
(11, 6, '320i'),
(12, 6, 'X1'),
(13, 7, '911'),
(14, 7, 'Macan'),
(15, 8, 'F8 Tributo'),
(16, 8, 'Roma'),
(17, 9, 'Jesko'),
(18, 9, 'Agera RS'),
(19, 10, 'Dolphin'),
(20, 10, 'Seal');

-- CLIENTE
INSERT INTO CLIENTE (ID_CLIENTE, CPF, NOME, TELEFONE, EMAIL) VALUES
(1, '11111111111', 'Thiago Elias', '5586999999999', 'Thiago.Elias@email.com'),
(2, '22222222222', 'João Carlos', '5586888888888', 'joao.carlos@email.com'),
(3, '33333333333', 'Guilherme Alves', '5586777777777', 'Guilherme.alves@email.com'),
(4, '44444444444', 'Matheus Ylan', '5586666666666', 'Matheus.Ylan@email.com'),
(5, '55555555555', 'Max Verstappen', '5586555555555', 'Max.Verstappen@email.com'),
(6, '66666666666', 'Joseph Joestar', '5586444444444', 'Jojo.BattleTendency@email.com'),
(7, '77777777777', 'Cristiano Ronaldo', '5586333333333', 'Cristiano.Ronaldo@email.com'),
(8, '88888888888', 'Steven Stone', '5586222222222', 'Steven.Stone@email.com'),
(9, '99999999999', 'Trevor Belmont', '5586111111111', 'Trevor.Belmont@email.com'),
(10, '00000000000', 'Zagreu', '5586000000000', 'Zagreu.Hades@email.com');

-- FABRICANTE_PECA
INSERT INTO FABRICANTE_PECA (ID_FABRICANTE, NOME) VALUES
(1, 'Bosch'),
(2, 'Nakata'),
(3, 'Denso'),
(4, 'Mahle'),
(5, 'Axios'),
(6, 'Fremax'),
(7, 'Bridgestone');

-- PECA
INSERT INTO PECA (ID_PECA, ID_FABRICANTE_P, VALOR_UNITARIO, ESTOQUE) VALUES
(1, 1, 350.00, 10),
(2, 1, 85.50, 25),
(3, 2, 190.00, 8),
(4, 3, 540.00, 5),
(5, 4, 42.00, 50),
(6, 5, 65.00, 30),
(7, 6, 220.00, 12),
(8, 7, 480.00, 16),
(9, 2, 115.00, 14),
(10, 4, 95.00, 40);

-- CARGO
INSERT INTO CARGO (ID_CARGO, NOME, COMISSAO) VALUES
(1, 'Mecânico Senior', 0.75),
(2, 'Mecânico Pleno', 0.50),
(3, 'Mecânico Junior', 0.30),
(4, 'Auxiliar de Mecânico', 0.10),
(5, 'Eletricista Automotivo', 0.60),
(6, 'Mecânico Funileiro', 0.40),
(7, 'Alinhador', 0.25),
(8, 'Borracheiro', 0.20);

-- FUNCIONARIO
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, ID_CARGO, CPF, NOME, SALARIO) VALUES
(1, 1, '11111111111', 'Neymar Junior', 4500.00),
(2, 2, '22222222222', 'Lewis Hamilton', 3800.00),
(3, 3, '33333333333', 'Leon Kennedy', 2800.00),
(4, 4, '44444444444', 'Johnny Joestar', 1800.00),
(5, 5, '55555555555', 'Vaas Montenegro', 4000.00),
(6, 6, '66666666666', 'Carl Johnson', 3200.00),
(7, 7, '77777777777', 'Pierre Stardew Valley', 2500.00),
(8, 8, '88888888888', 'Monkey D. Luffy', 2200.00),
(9, 2, '99999999999', 'Ichigo Kurosaki', 3800.00),
(10, 1, '00000000000', 'Axl Rose', 4600.00);

-- SERVICO
INSERT INTO SERVICO (ID_SERVICO, ID_FUNCIONARIO, DESCRICAO, VALOR) VALUES
(1, 1, 'Troca de pastilhas de freio e alinhamento', 200.00),
(2, 5, 'Instalação de kit multimídia', 350.00),
(3, 6, 'Alinhamento 3D e pintura de para-choque', 400.00),
(4, 8, 'Troca de pneus e balanceamento', 150.00),
(5, 2, 'Revisão completa de 10.000km', 600.00),
(6, 7, 'Alinhamento 3D', 120.00),
(7, 3, 'Troca de óleo e filtro', 80.00),
(8, 1, 'Retífica preventiva de motor', 1500.00),
(9, 9, 'Troca de kit de embreagem', 450.00),
(10, 4, 'Limpeza de bicos injetores', 180.00);

-- VEICULO
INSERT INTO VEICULO (ID_VEICULO, ID_MODELO, ANO, COR) VALUES
(1, 1, 2023, 'Cinza'),
(2, 3, 2020, 'Branco'),
(3, 5, 1988, 'Preto'),
(4, 7, 2022, 'Prata'),
(5, 11, 2021, 'Azul'),
(6, 13, 2024, 'Vermelho'),
(7, 19, 2023, 'Branco'),
(8, 2, 2018, 'Prata'),
(9, 15, 2022, 'Amarelo'),
(10, 10, 2021, 'Preto');

-- OS
INSERT INTO OS (ID_OS, ID_POSSE, ID_SERVICO, ID_PECA, DT_ABRE_OS, DT_FECHA_OS, STATUS, VALOR_FINAL) VALUES
(1, 1, 1, 1, '2026-05-20', '2026-05-25', 'F', 550.00),
(2, 2, 7, 5, '2026-05-21', '2026-05-21', 'F', 122.00),
(3, 3, 3, 9, '2026-05-22', '2026-05-24', 'F', 515.00),
(4, 4, 6, 6, '2026-05-23', '2026-05-23', 'F', 185.00),
(5, 5, 5, 1, '2026-05-24', '2026-05-25', 'A', 950.00),
(6, 6, 9, 3, '2026-05-20', '2026-05-22', 'F', 640.00),
(7, 7, 2, 10, '2026-05-22', '2026-05-23', 'F', 445.00),
(8, 8, 4, 8, '2026-05-21', '2026-05-21', 'F', 630.00),
(9, 9, 8, 4, '2026-05-15', '2026-05-25', 'A', 2040.00),
(10, 10, 10, 2, '2026-05-25', '2026-05-25', 'F', 265.50);