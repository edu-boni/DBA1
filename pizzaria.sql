-- banco de dados Pizzaria
-- ativbidade: 05/05

-- criacção e abertura do banco de dados
CREATE DATABASE pizzaria;
USE pizzaria;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Pizza;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Ingredientes_pizza;
DROP TABLE IF EXISTS Item_pedido;
DROP TABLE IF EXISTS Pedido;


-- tabela cliente
CREATE TABLE Cliente (
	telefone VARCHAR(12) PRIMARY KEY, 
    nome VARCHAR(20) NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero INT, 
    compl VARCHAR(10), 
    bairro VARCHAR(20)
);

CREATE TABLE Pizza(
	codigo VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(20),
    descricao VARCHAR(20),
    preco numeric(5,2)
);

CREATE TABLE Ingredientes_pizza(
	nome_ingrediente VARCHAR(20),
    cod_pizza VARCHAR(5),
	PRIMARY KEY(nome_ingrediente, cod_pizza),
    FOREIGN KEY(cod_pizza) REFERENCES Pizza (codigo)
);

CREATE TABLE Funcionario(
	CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE Pedido(
	codigo INT PRIMARY KEY,
    data_hora DATETIME,
    tel_cliente VARCHAR(12),
    cpf_funcionario VARCHAR(11),
    FOREIGN KEY (tel_cliente) REFERENCES Cliente(telefone),
	FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

CREATE TABLE Item_pedido(
	cod_pedido INT,
    cod_pizza VARCHAR(5),
    quantidade INT,
    PRIMARY KEY(cod_pedido, cod_pizza),
    FOREIGN KEY(cod_pedido) REFERENCES Pedido(codigo),
    FOREIGN KEY(cod_pizza) REFERENCES Pizza(codigo)
);

-- Inserir cliente
INSERT INTO Cliente VALUES ('11999999999', 'Maria Silva', 'Rua das Flores', 123, 'Apt 1', 'Centro');

-- Inserir funcionário
INSERT INTO Funcionario VALUES ('12345678901', 'João Souza');

-- Inserir pizza
INSERT INTO Pizza VALUES ('P001', 'Calabresa', 'Calabresa com queijo', 39.90);

-- Inserir ingredientes da pizza
INSERT INTO Ingredientes_pizza VALUES ('Calabresa', 'P001');
INSERT INTO Ingredientes_pizza VALUES ('Queijo', 'P001');

-- Inserir pedido
INSERT INTO Pedido VALUES (1, NOW(), '11999999999', '12345678901');

-- Inserir item do pedido
INSERT INTO Item_pedido VALUES (1, 'P001', 2);

UPDATE Cliente
SET rua = 'Av. Brasil', numero = 456, compl = 'Casa', bairro = 'Jardins'
WHERE telefone = '11999999999';

DELETE FROM Ingredientes_pizza
WHERE cod_pizza = 'P001';

SELECT * FROM Pedido
WHERE cpf_funcionario = '12345678901' AND tel_cliente = '11999999999';

SELECT cod_pizza, quantidade, quantidade * preco AS total_item
FROM Item_pedido
JOIN Pizza ON Item_pedido.cod_pizza = Pizza.codigo;

SELECT * FROM Pizza
ORDER BY preco DESC;

SELECT * FROM Cliente
WHERE nome LIKE 'Maria%';

SELECT * FROM Cliente
WHERE compl IS NULL;

SELECT cod_pizza, SUM(quantidade) AS total_vendido
FROM Item_pedido
GROUP BY cod_pizza;

SELECT nome
FROM Funcionario
WHERE CPF = (
    SELECT cpf_funcionario
    FROM Pedido
    WHERE codigo = 1
);

SELECT nome
FROM Pizza
WHERE codigo IN (
    SELECT cod_pizza
    FROM Item_pedido
    WHERE cod_pedido IN (
        SELECT codigo
        FROM Pedido
        WHERE tel_cliente = '11999999999'
    )
);
