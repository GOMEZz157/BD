CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome) VALUES
('Roberta'),
('Roberto'),
('Maria Clara'),
('João');

SELECT UPPER(nome) FROM nomes;

SELECT nome, LENGTH(nome) FROM nomes;

SELECT 
    CASE 
        WHEN nome LIKE '%Maria%' THEN 'Sra. ' || nome
        ELSE 'Sr. ' || nome
    END AS nome_com_tratamento
FROM nomes;

CREATE TABLE produtos (
    produto VARCHAR(50),
    preco NUMERIC(10, 2),
    quantidade INT
);