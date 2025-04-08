DROP DATABASE IF EXISTS Exercicios;
CREATE DATABASE Exercicios;
USE Exercicios;

DROP TABLE IF EXISTS Feriados;
CREATE TABLE Feriados(
	idFeriado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    data_feriado DATE NOT NULL 
);

INSERT INTO Feriados (nome, data_feriado) VALUES
('Confraternização Universal', '2025-01-01'),
('Sexta-Feira Santa', '2025-04-18'),
('Tirandentes', '2025-04-21'),
('Dia do Trabalho', '2025-05-01'),
('Corpus Christi', '2025-06-19'),
('Independência do Brasil', '2025-09-07'),
('Nossa Senhora Aparecida', '2025-10-12'),
('Finados', '2025-11-02'),
('Proclamação da República', '2025-11-15'),
('Dia Nacional de Zumbi e da Consciência Negra', '2025-11-20'),
('Natal', '2025-12-25');

SELECT * FROM Feriados;