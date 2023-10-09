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

INSERT INTO produtos (produto, preco, quantidade) VALUES
('Produto A', 19.99, 5),
('Produto B', 29.99, -3),
('Produto C', 9.99, 8);

SELECT produto, ROUND(preco, 2) AS preco_arredondado FROM produtos;

SELECT produto, ABS(quantidade) AS quantidade_absoluta FROM produtos;

SELECT AVG(preco) AS media_precos FROM produtos;


CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
('2023-10-01'),
('2023-10-05'),
('2023-10-10');

INSERT INTO eventos (data_evento) VALUES (NOW());

SELECT DATEDIFF('2023-10-10', '2023-10-01') AS dias_entre_datas FROM eventos;

SELECT data_evento, DAYNAME(data_evento) AS nome_dia_semana FROM eventos;

SELECT produto, 
       IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

SELECT produto, 
       CASE 
           WHEN preco < 10 THEN 'Barato'
           WHEN preco >= 10 AND preco <= 20 THEN 'Médio'
           WHEN preco > 20 THEN 'Caro'
       END AS categoria_preco
FROM produtos;

CREATE FUNCTION TOTAL_VALOR(preco NUMERIC, quantidade INT)
RETURNS NUMERIC
BEGIN
    RETURN preco * quantidade;
END;

SELECT produto, TOTAL_VALOR(preco, quantidade) AS valor_total FROM produtos;

SELECT COUNT(*) AS total_produtos FROM produtos;

SELECT MAX(preco) AS produto_mais_caro FROM produtos;

SELECT MIN(preco) AS produto_mais_barato FROM produtos;

SELECT SUM(IF(quantidade > 0, preco * quantidade, 0)) AS soma_total_estoque FROM produtos;

CREATE FUNCTION FATORIAL(n INT)
RETURNS INT
BEGIN
    DECLARE result INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
        SET result = result * i;
        SET i = i + 1;
    END WHILE;
    RETURN result;
END;

SELECT POWER(2, 3) AS exponencial;

CREATE FUNCTION PALINDROMO(palavra VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE palavra_reversa VARCHAR(255);
    SET palavra_reversa = REVERSE(palavra);
    IF palavra = palavra_reversa THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;

SELECT PALINDROMO('radar') AS e_palindromo;
