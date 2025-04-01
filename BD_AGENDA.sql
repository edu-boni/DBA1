DROP DATABASE IF EXISTS Agenda;
CREATE DATABASE IF NOT EXISTS Agenda;
USE Agenda;

CREATE TABLE IF NOT EXISTS Contatos (
	idContato INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    Celular VARCHAR(255),
    idCidade INT,
    Classe VARCHAR(255),
    Preco FLOAT DEFAULT 9.99
);

CREATE TABLE IF NOT EXISTS Cidade (
	idCidade INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    UF VARCHAR(2)
);

INSERT INTO Contatos (Nome, Celular, idCidade, Classe) VALUES
('Eduardo', '16 99198', 1, 'IFSP'),
('Carlos', '16 98765', 2, 'USP'),
('Maria', '16 95321', 3, 'UNICAMP'),
('Ana', '16 91234', 4, 'UNESP'),
('João', '16 94567', 5, 'UNESP'),
('Roberta', '16 99876', 6, 'IFSP');

INSERT INTO Cidade (idCidade, Nome, UF) VALUES
(1, 'Araraquara', 'SP'),
(2, 'São Paulo', 'SP'),
(3, 'Campinas', 'SP'),
(4, 'Ribeirão Preto', 'SP'),
(5, 'Bauru', 'SP'),
(6, 'São Carlos', 'SP');

SELECT * FROM Contatos;
SELECT * FROM Cidade; 

