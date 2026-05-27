-- =========================================
-- Projeto final completo do banco de dados
-- =========================================

-- CRIAÇÃO DAS TABELAS
CREATE TABLE FABRICANTE_MARCA(
ID_FABRICANTE INT NOT NULL PRIMARY KEY,
NOME VARCHAR(50) NOT NULL);

CREATE TABLE MARCA(
ID_MARCA INT NOT NULL PRIMARY KEY,
ID_FABRICANTE_M INT NOT NULL REFERENCES FABRICANTE_MARCA(ID_FABRICANTE),
NOME VARCHAR(50) NOT NULL);

CREATE TABLE MODELO(
ID_MODELO INT NOT NULL PRIMARY KEY,
ID_MARCA INT NOT NULL REFERENCES MARCA(ID_MARCA),
NOME VARCHAR(50) NOT NULL);

CREATE TABLE VEICULO(
ID_VEICULO INT NOT NULL PRIMARY KEY,
ID_MODELO INT NOT NULL REFERENCES MODELO(ID_MODELO),
ANO INT NOT NULL,
COR VARCHAR(50) NOT NULL);

CREATE TABLE CARGO(
ID_CARGO INT NOT NULL PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
COMISSAO FLOAT NOT NULL);

CREATE TABLE FUNCIONARIO(
ID_FUNCIONARIO INT NOT NULL PRIMARY KEY,
ID_CARGO INT NOT NULL REFERENCES CARGO(ID_CARGO),
CPF VARCHAR(11) NOT NULL,
NOME VARCHAR(50) NOT NULL,
SALARIO FLOAT NOT NULL,
CONSTRAINT CPF_TAMANHO CHECK (CHAR_LENGTH(CPF) = 11));

CREATE TABLE FABRICANTE_PECA(
ID_FABRICANTE INT NOT NULL PRIMARY KEY,
NOME VARCHAR(50) NOT NULL);

CREATE TABLE PECA(
ID_PECA INT NOT NULL PRIMARY KEY,
ID_FABRICANTE_P INT NOT NULL REFERENCES FABRICANTE_PECA(ID_FABRICANTE),
VALOR_UNITARIO FLOAT NOT NULL,
ESTOQUE INT NOT NULL);

CREATE TABLE CLIENTE(
ID_CLIENTE INT NOT NULL PRIMARY KEY,
CPF VARCHAR(11) NOT NULL,
NOME VARCHAR(50) NOT NULL,
TELEFONE VARCHAR(13) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
CONSTRAINT CPF_TAMANHO CHECK (CHAR_LENGTH(CPF) = 11),
CONSTRAINT TELEFONE_TAMANHO CHECK (CHAR_LENGTH(TELEFONE) BETWEEN 12 AND 13));

CREATE TABLE POSSE(
ID_POSSE INT NOT NULL PRIMARY KEY,
ID_VEICULO INT NOT NULL REFERENCES VEICULO(ID_VEICULO),
ID_CLIENTE INT NOT NULL REFERENCES CLIENTE(ID_CLIENTE));

CREATE TABLE SERVICO
(ID_SERVICO INT NOT NULL PRIMARY KEY,
ID_FUNCIONARIO INT REFERENCES FUNCIONARIO(ID_FUNCIONARIO),
DESCRICAO VARCHAR(200),
VALOR FLOAT NOT NULL);

CREATE TABLE OS
(ID_OS INT NOT NULL PRIMARY KEY,
ID_POSSE INT NOT NULL REFERENCES POSSE(ID_POSSE),
ID_SERVICO INT REFERENCES SERVICO(ID_SERVICO),
ID_PECA INT REFERENCES PECA(ID_PECA),
DT_ABRE_OS DATE NOT NULL,
DT_FECHA_OS DATE,
STATUS VARCHAR(1) CHECK (STATUS = 'A' OR STATUS = 'F')
VALOR_FINAL FLOAT);

-- MOSTRAR TODAS AS TABELAS
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema='public' 
AND table_type='BASE TABLE';   

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
(1, 1, 'Toyota'),        -- Toyota
(2, 2, 'Volkswagen'),    -- Volkswagen
(3, 3, 'Chevrolet'),     -- Chevrolet
(4, 4, 'Volvo'),         -- Volvo
(5, 5, 'Audi'),          -- Audi
(6, 6, 'BMW'),           -- BMW
(7, 7, 'Porsche'),       -- Porsche
(8, 8, 'Ferrari'),       -- Ferrari
(9, 9, 'Koenigsegg'),    -- Koenigsegg
(10, 10, 'BYD');         -- BYD

-- MODELO
INSERT INTO MODELO (ID_MODELO, ID_MARCA_M, NOME) VALUES
(1, 1, 'Corolla'),        -- Toyota
(2, 1, 'Hilux'),          -- Toyota
(3, 2, 'Polo'),           -- Volkswagen
(4, 2, 'Nivus'),          -- Volkswagen
(5, 3, 'Opala'),          -- Chevrolet
(6, 3, 'Prisma'),         -- Chevrolet
(7, 4, 'XC60'),           -- Volvo
(8, 4, 'XC90'),           -- Volvo
(9, 5, 'A3'),             -- Audi
(10, 5, 'Q5'),            -- Audi
(11, 6, '320i'),          -- BMW
(12, 6, 'X1'),            -- BMW
(13, 7, '911'),           -- Porsche
(14, 7, 'Macan'),         -- Porsche
(15, 8, 'F8 Tributo'),    -- Ferrari
(16, 8, 'Roma'),          -- Ferrari
(17, 9, 'Jesko'),         -- Koenigsegg
(18, 9, 'Agera RS'),      -- Koenigsegg
(19, 10, 'Dolphin'),      -- BYD
(20, 10, 'Seal');         -- BYD

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
(1, 1, '11111111111', 'Neymar Junior', 4500.00),          -- Mecânico Senior
(2, 2, '22222222222', 'Lewis Hamilton', 3800.00),         -- Mecânico Pleno
(3, 3, '33333333333', 'Leon Kennedy', 2800.00),           -- Mecânico Junior
(4, 4, '44444444444', 'Johnny Joestar', 1800.00),         -- Auxiliar de Mecânico
(5, 5, '55555555555', 'Vaas Montenegro', 4000.00),        -- Eletricista Automotivo
(6, 6, '66666666666', 'Carl Johnson', 3200.00),           -- Mecânico Funileiro
(7, 7, '77777777777', 'Pierre Stardew Valley', 2500.00),  -- Alinhador
(8, 8, '88888888888', 'Monkey D. Luffy', 2200.00),        -- Borracheiro
(9, 2, '99999999999', 'Ichigo Kurosaki', 3800.00),        -- Mecânico Pleno
(10, 1, '00000000000', 'Axl Rose', 4600.00);              -- Mecânico Senior

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
(1, 1, 2023, 'Cinza'),        -- Corolla
(2, 3, 2020, 'Branco'),       -- Polo
(3, 5, 1988, 'Preto'),        -- Opala
(4, 7, 2022, 'Prata'),        -- XC60
(5, 11, 2021, 'Azul'),        -- BMW 320i
(6, 13, 2024, 'Vermelho'),    -- Porsche 911
(7, 19, 2023, 'Branco'),      -- BYD Dolphin
(8, 2, 2018, 'Prata'),        -- Toyota Hilux
(9, 15, 2022, 'Amarelo'),     -- Ferrari F8 Tributo
(10, 10, 2021, 'Preto');      -- Audi Q5

-- ORDEM DE SERVIÇO
INSERT INTO OS (ID_OS, ID_POSSE, ID_SERVICO, ID_PECA, DT_ABRE_OS, DT_FECHA_OS, STATUS, VALOR_FINAL) VALUES
(1, 1, 1, 1, '2026-05-20', '2026-05-25', 'F', 550.00),    -- Troca de pastilhas/alinhamento + Bosch 350.00
(2, 2, 7, 5, '2026-05-21', '2026-05-21', 'F', 122.00),    -- Troca de óleo e filtro + Mahle 42.00
(3, 3, 3, 9, '2026-05-22', '2026-05-24', 'F', 515.00),    -- Alinhamento 3D/pintura + Nakata 115.00
(4, 4, 6, 6, '2026-05-23', '2026-05-23', 'F', 185.00),    -- Alinhamento 3D + Axios 65.00
(5, 5, 5, 1, '2026-05-24', '2026-05-25', 'A', 950.00),    -- Revisão 10.000km + Bosch 350.00
(6, 6, 9, 3, '2026-05-20', '2026-05-22', 'F', 640.00),    -- Troca de kit de embreagem + Nakata 190.00
(7, 7, 2, 10, '2026-05-22', '2026-05-23', 'F', 445.00),   -- Instalação de kit multimídia + Mahle 95.00
(8, 8, 4, 8, '2026-05-21', '2026-05-21', 'F', 630.00),    -- Troca de pneus/balanceamento + Bridgestone 480.00
(9, 9, 8, 4, '2026-05-15', '2026-05-25', 'A', 2040.00),   -- Retífica preventiva de motor + Denso 540.00
(10, 10, 10, 2, '2026-05-25', '2026-05-25', 'F', 265.50); -- Limpeza de bicos injetores + Bosch 85.50
