DROP DATABASE IF EXISTS Cantina;
CREATE DATABASE IF NOT EXISTS Cantina;
USE Cantina;

CREATE TABLE CategoriaPreco(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Cor VARCHAR(255) NOT NULL UNIQUE,
    Preco DOUBLE CHECK (Preco > 0)
);

CREATE TABLE Produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Sabor VARCHAR(255) NOT NULL,
    Tamanho VARCHAR(255) NOT NULL,
    Tipo VARCHAR(255) DEFAULT 'Assado',
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES CategoriaPreco(idCategoria)
);

INSERT INTO CategoriaPreco (Cor, Preco) VALUES
('Amarelo', 5),
('Vermelho', 6),
('Azul', 7),
('Verde', 4.5),
('Roxo', 6.5);

INSERT INTO Produtos (Sabor, Tamanho, idCategoria) VALUES
('Coxinha de Frango', 'Média', 1),   -- Amarelo
('Coxinha de Carne', 'Pequena', 2),   -- Vermelho
('Coxinha de Frango', 'Grande', 3),  -- Azul
('Coxinha de Queijo', 'Média', 1),   -- Amarelo
('Coxinha de Carne', 'Grande', 2),   -- Vermelho
('Esfiha de Carne', 'Pequena', 3),   -- Azul
('Esfiha de Frango', 'Média', 4),    -- Verde
('Esfiha de Queijo', 'Grande', 5),   -- Roxo
('Empada de Frango', 'Pequena', 2),  -- Vermelho
('Empada de Carne', 'Média', 1),    -- Amarelo
('Pastel de Carne', 'Grande', 4),   -- Verde
('Pastel de Frango', 'Pequena', 3), -- Azul
('Pastel de Queijo', 'Média', 5),   -- Roxo
('Empada de Queijo', 'Grande', 4),  -- Verde
('Esfiha de Carne', 'Média', 2),    -- Vermelho
('Esfiha de Frango', 'Grande', 3),  -- Azul
('Coxinha de Carne', 'Média', 1),   -- Amarelo
('Coxinha de Frango', 'Pequena', 5), -- Roxo
('Pastel de Frango', 'Média', 1),   -- Amarelo
('Empada de Frango', 'Grande', 2);  -- Vermelho

SELECT p.Sabor, p.Tamanho, c.Cor, c.Preco
FROM Produtos p
JOIN CategoriaPreco c ON p.idCategoria = c.idCategoria
ORDER BY c.Preco DESC;

