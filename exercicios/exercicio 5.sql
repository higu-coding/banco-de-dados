CREATE DATABASE exercicio

CREATE TABLE clientes (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE vendas (
    ID SERIAL PRIMARY KEY,
    clienteID INT,
    produtoID INT,
    quantidade INT,
    data DATE,
    FOREIGN KEY (clienteID) REFERENCES clientes(ID),
    FOREIGN KEY (produtoID) REFERENCES produtos(ID)
);

CREATE TABLE produtos (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL,
    categoria VARCHAR(20)
);

SELECT categoria, COUNT(*) AS Contagem
FROM produtos
GROUP BY categoria
ORDER BY Contagem ASC;

SELECT produtoID, COUNT(*) AS Contagem
FROM vendas
GROUP BY produtoID
ORDER BY Contagem DESC;

SELECT c.nome AS NomeCliente, P.Nome AS NomeProduto, V.quantidade
FROM vendas v
JOIN clientes C ON V.clienteID = C.ID
JOIN produtos P ON V.produtoID = p.ID

INSERT INTO clientes (id, nome, email)
VALUES (1, 'João', 'joao@exemplo.com'),

INSERT INTO clientes (id, nome, email)
VALUES (2, 'Fernanda', 'fernanda@exemplo.com'),

SELECT *
FROM clientes
WHERE id = 1