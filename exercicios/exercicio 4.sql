-- Criação das tabelas
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (100),
    email VARCHAR (100),
    telefone VARCHAR (20),
    endereco VARCHAR(100)
);

CREATE TABLE carros (
    id SERIAL PRIMARY KEY,
    marca VARCHAR (50),
    modelo VARCHAR (50),
    ano INT,
    cor_exterior VARCHAR (20),
    preco DECIMAL (10, 2)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    carro_id INT REFERENCES carros(id),
    cliente_id INT REFERENCES clientes(id),
    data_venda DATE,
    valor DECIMAL(10, 2)
);

-- Usando UPDATE

UPDATE vendas
SET valor = 45000.00
WHERE id = 1

-- Ver na tabela

SELECT c.nome AS nome_cliente, ca.marca, ca.modelo, v.valor
FROM vendas v
JOIN carros ca ON v.carro_id = ca.id
JOIN clientes c ON v.cliente_id = c.id
WHERE v.id = 1;