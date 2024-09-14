DROP DATABASE IF EXISTS super_dev_games;
CREATE DATABASE super_dev_games;
USE super_dev_games;
CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL

);

INSERT INTO categorias (nome) VALUES
("Survivor"),
("RPG"),
("FPS"),
("Open World"),
("Simulador"),
("Sport");

CREATE TABLE jogos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_lancamento DATETIME,
    preco DOUBLE,
    idade_minima INT,
    FOREIGN KEY(id_categoria) REFERENCES categorias(id)
);


-- Gerar 2 inserts
INSERT INTO jogos (nome, id_categoria, data_lancamento, preco, idade_minima) VALUES
("The Last of Us 2", 1,  "2020-06-19", 350.00, 18),
("  Metal Slug", (SELECT id FROM categorias WHERE nome = 'Survivor'), "1996-04-18", 40.00, 12),
("EA FC 2024  ", (SELECT id FROM categorias WHERE nome = 'Sport'),"2023-09-15", 315.00, 12),
("  Madden NFL 2024  ", (SELECT id FROM categorias WHERE nome = 'Sport'), "2023-08-02", 299.00, 10),
("NHL 2024", (SELECT id FROM categorias WHERE nome = 'Sport'), "2023-10-01", 255.00, 0),
("PGA Tour 2024", (SELECT id FROM categorias WHERE nome = 'Sport'), "2023-05-28", 215.00, 10),
("GTA Vice City", (SELECT id FROM categorias WHERE nome = 'Open World'),  "2002-10-29", 20.00, 18),
("Priston Tale", (SELECT id FROM categorias WHERE nome = 'RPG'),  "2002-01-01", 0.0, 10),
("Resident Evil 4", (SELECT id FROM categorias WHERE nome = 'Survivor'),  "2005-01-11", 130.00, 18),
("DayZ", (SELECT id FROM categorias WHERE nome = 'Survivor'),  "2013-12-16", 159.00, 16),
("Forza Horizon 5", (SELECT id FROM categorias WHERE nome = "Simulador"), "2021-11-05",273.94,5),
("Gran Turismo 7", (SELECT id FROM categorias WHERE nome = "Simulador"), "2022-03-04",349.90,7),
("Counter Strike 2", (SELECT id FROM categorias WHERE nome = "FPS"),  "2023-09-27", 0.00,16),
("League of Legends", (SELECT id FROM categorias WHERE nome = 'RPG'), "2009-10-27", 0.00,12),
("Dead By Daylight", (SELECT id FROM categorias WHERE nome = 'Survivor'),  "2016-06-14", 19.99, 18),
("Identity V", (SELECT id FROM categorias WHERE nome = 'Survivor'),  "2018-06-05", 0, 12),
("Horizon Zero Dawn", (SELECT id FROM categorias WHERE nome = "Open World"),  "2017-02-28", 150.00, 14),
("Asseto Corsa", (SELECT id FROM categorias WHERE nome = "Simulador"),  "2013-09-08", 30.00, 0),
("'Minecraft", (SELECT id FROM categorias WHERE nome = 'RPG'),  "2011-11-18", 148.25, 7),
("Need for speed underground 2", (SELECT id FROM categorias WHERE nome = "Simulador"),  "2004-11-09", 222.54, 13);

-- Alteração do nome do jogo Minecraft e a data de lançamento
UPDATE jogos SET 
	nome = 'Minecraft',
    data_lancamento = '2011-11-19'
    WHERE id = 19;

-- Consultar o jogos que o nome termina com o texto 2024
SELECT * FROM jogos WHERE nome LIKE '%2024';

-- Consultar o jogos que o nome começa com 'Horizon'
SELECT * FROM jogos WHERE nome LIKE 'Horizon%';

-- Consultar o jogos que o nome contenha Horizon em qualquer parte
SELECT * FROM jogos WHERE nome LIKE '%Horizon%';

-- Consultar os colaboradores que contenha no nome ou cpf o que o usuário digitou
-- SELECT * FROM colaboradores WHERE nome LIKE '%fab%' OR cpf LIKE '%fab%';

-- Consultar a quantidade de jogos
SELECT COUNT(id) FROM jogos;

-- Consultar os jogos ordenados por preço decrescente
SELECT * FROM jogos ORDER BY preco DESC;

-- Consultar a quantidade de jogos que o preço é maior que R$ 150.00
SELECT COUNT(id) FROM jogos WHERE preco > 150;

-- Consultar a soma dos preços dos jogos
SELECT SUM(preco) FROM jogos;

-- Consultar os jogos de 2023
SELECT * FROM jogos WHERE YEAR(data_lancamento) = 2023;

-- Consultar a soma dos preços dos jogos da categoria Sport
SELECT 
	SUM(jogos.preco) 
	FROM jogos
    INNER JOIN categorias ON (jogos.id_categoria = categorias.id)
    WHERE categorias.nome = 'Sport';

-- Consultar a soma dos preços dos jogos da categoria Sport
SELECT 
	SUM(jogos.preco) 
	FROM jogos
    INNER JOIN categorias ON (jogos.id_categoria = categorias.id)
    WHERE categorias.nome = 'Sport';

-- Consultar a média dos preços
SELECT AVG(preco) FROM jogos;

-- Consultar o menor preço dos jogos
SELECT MIN(preco) FROM jogos;

-- Consultar o maior preço dos jogos
SELECT MAX(preco) FROM jogos;

-- Consultar a quantidade de caracteres que tem em cada nome do jogo
SELECT LENGTH(nome), nome FROM jogos;

-- Concatenar o nome do jogo e a categoria
SELECT 
    CONCAT(jogos.nome, " - ", categorias.nome)
    FROM jogos
    INNER JOIN categorias ON (jogos.id_categoria = categorias.id);

-- "O jogo 'The Last of Us 2' foi lançado em '2023' da categoria 'Survivor'"
SELECT
    CONCAT(
		"O jogo '", 
        jogos.nome, 
        "' foi lançado em '", 
        YEAR(jogos.data_lancamento),
        "' da categoria '",
        categorias.nome, 
        "'"
	) 
    FROM jogos
    INNER JOIN categorias ON (jogos.id_categoria = categorias.id);

-- Tabela Verdade do E
-- V E V => V
-- F E V => F
-- V E F => F
-- F E F => F

-- Consultar os jogos que foram lançados na década de 90
SELECT
	*
    FROM jogos
    WHERE YEAR(data_lancamento) >= 1990 AND YEAR(data_lancamento) < 2000;

-- Consultar os jogos que a categoria seja RPG, Open World e Sport
SELECT
    categorias.nome,
    jogos.nome
    FROM jogos
    INNER JOIN categorias ON (jogos.id_categoria = categorias.id)
    WHERE categorias.nome = 'RPG' OR categorias.nome = 'Open World' or categorias.nome = 'Sport'
    ORDER BY categorias.nome ASC, jogos.nome ASC;

-- Consultar os jogos que não sejam da categoria FPS e Simulador
SELECT
    categorias.nome,
    jogos.nome
    FROM jogos
    INNER JOIN categorias ON(jogos.id_categoria = categorias.id)
    WHERE categorias.nome != 'FPS' AND categorias.nome != "Simulador";

-- Consultar os jogos que o preço esteja entre 25.00 e 50.00
SELECT
    jogos.nome,
    jogos.preco
    FROM jogos
--    WHERE jogos.preco >= 25.00 AND jogos.preco <= 50;
    WHERE jogos.preco BETWEEN 25 AND 50;

-- Apresentar o número formatado com duas casas decimais
SELECT
    nome,
    FORMAT(preco, 2)
    FROM jogos;

-- Consultar os jogos substituindo o ano 2024 para 1900
SELECT
    REPLACE(nome, "2024", "1900")
    FROM jogos;

-- Consultar removendo os espaços do começo do texto
SELECT LTRIM(nome) FROM jogos;

-- Consultar removendo os espaços do final
SELECT RTRIM(nome) FROM jogos;

-- Consultar removendo os espaços do começo e do final
SELECT TRIM(nome) FROM jogos;

-- Consultar o nome do jogo e preço no formato pt-br
SELECT 
	nome AS 'Jogo', 
    CONCAT("R$ ", REPLACE(FORMAT(preco, 2), ".", ",")) AS 'Preço'
    FROM jogos;

 -- Consultar somente 5 primeiros jogos
 SELECT
    TRIM(nome)
    FROM jogos
    ORDER BY TRIM(nome) ASC
    LIMIT 5;

-- Consultar somente 2 jogos
 SELECT
	id,
    TRIM(nome)
    FROM jogos
    ORDER BY id ASC
    -- LIMIT Indice do Registro, Quantidade de Registros
    LIMIT 0, 2; -- => 1ª Página
-- Consultar a segunda página
 SELECT
	id,
    TRIM(nome)
    FROM jogos
    ORDER BY id ASC
    LIMIT 2, 2; -- => 2ª Página
 SELECT
	id,
    TRIM(nome)
    FROM jogos
    ORDER BY id ASC
    LIMIT 4, 2; -- => 3ª Página
 SELECT
	id,
    TRIM(nome)
    FROM jogos
    ORDER BY id ASC
    LIMIT 6, 2; -- => 4ª Página
 SELECT
	id,
    TRIM(nome)
    FROM jogos
    ORDER BY id ASC
    LIMIT 8, 2; -- => 5ª Página


SELECT 
    *
FROM
    jogos;
# https://dontpad.com/franciscosensaulas/python


