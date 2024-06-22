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

-- Inserção de dados
INSERT INTO clientes (id, nome, email, telefone, endereco)
VALUES (1, 'Jonas', 'jonas@exemplo.com', '123123123', 'Rua 3');

INSERT INTO carros (id, marca, modelo, ano, cor_exterior, preco)
VALUES (1, 'Ford', 'Fiesta', 2000, 'Prata', 15000);

INSERT INTO vendas (id, carro_id, cliente_id, data_venda, valor)
VALUES (1, 1, 1, '2020-01-01', 25000);
