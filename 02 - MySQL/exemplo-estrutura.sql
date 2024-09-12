-- Apresentar todos os bancos de dados criados
SHOW SCHEMAS;
DROP DATABASE IF EXISTS super_dev_loja;
-- Criar banco de dados
CREATE DATABASE super_dev_loja;

-- Definir qual o bando de dados que será utilizado 
USE super_dev_loja;

--Criar a tabela de cores
CREATE TABLE cores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);


-- Consultar tabelas
SHOW TABLES;

-- Consultar os registros da tabela de cores
SELECT 
    id,
    nome
    FROM cores;

-- Inserir registro na tabela de cores
INSERT INTO cores (nome) VALUE ('Vermelho');
INSERT INTO cores (nome) VALUE ('Branco');
INSERT INTO cores (nome) VALUE ('Preto');
INSERT INTO cores (nome) VALUE ('Azul');
INSERT INTO cores (nome) VALUE ('Cinza');
INSERT INTO cores (nome) VALUE ('Roça');

-- Apagar o registro com o código 6 refrente a cor roça
DELETE FROM cores WHERE id = 6;

-- Consultar os registros da tabela de cores
SELECT id, nome FROM cores;

-- Buscar a cor com o código 4
SELECT id, nome FROM cores WHERE id = 4;

-- Buscar a cor com o nome Azul
SELECT id, nome FROM cores WHERE nome = 'Azul';

-- Consultar as cores em ordem alfabetica em ordem crescente
SELECT nome FROM cores ORDER BY nome ASC;

-- Consultar as cores em ordem alfabetica em ordem decrescente
SELECT nome FROM cores ORDER BY nome DESC;


-- Criar tabela de fabricantes
CREATE TABLE fabricantes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

-- Consultar as colunas da tabela de fabricantes
DESCRIBE fabricantes;

-- Inserir o registro do Alfa Romeo na tabela de fabricantes
INSERT INTO fabricantes (nome) VALUE ("Alfa Romeo");
INSERT INTO fabricantes (nome) VALUE ("Ferrari");
INSERT INTO fabricantes (nome) VALUE ("Fiat");
INSERT INTO fabricantes (nome) VALUE ("Honda");
INSERT INTO fabricantes (nome) VALUE ("Hyundai");
INSERT INTO fabricantes (nome) VALUE ("Subaru");
INSERT INTO fabricantes (nome) VALUE ("Volkswagen");
INSERT INTO fabricantes (nome) VALUE ("Bugatti");

-- Consultar os registros da tabela de fabricantes
SELECT id, nome FROM fabricantes;

-- Consultar a quantidade de registros da tabela de fabricantes
SELECT CONT(id) FROM fabricantes;



CREATE TABLE alunos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nota1 DOUBLE NOT NULL,
    nota2 DOUBLE NOT NULL,
    nota3 DOUBLE NOT NULL,
    data_nascimento DATE NOT NULL,
    descricao TEXT
);
INSERT INTO alunos (nome, nota1, nota2, nota3, data_nascimento, descricao)
VALUES ("Jorge",10, 3.5, 7,"2006-01-26", "Felipe não é o pai");

INSERT INTO alunos (nome, nota1, nota2, nota3, data_nascimento, descricao)
VALUES ("William com M",8, 3.5, 5.4,"2004-11-26", "jóia rara");

INSERT INTO alunos (nome, nota1, nota2, nota3, data_nascimento, descricao)
VALUES ("Mateus com H",4.3, 7.1, 2,"2007-02-07", "Gremio");

INSERT INTO alunos (nome, nota1, nota2, nota3, data_nascimento, descricao)
VALUES ("Nicolas com Y",10, 3, 9,"2006-07-12", "");

-- Consultar nome do aluno e sua média
SELECT
    nome AS 'Aluno', -- AS é um apelido para a coluno
    (nota1 + nota2 + nota3) / 3 AS 'Média'
    FROM alunos;


-- Consultar os alunos que nasceram em 2006
SELECT
    nome,
    -- DAY (data_nascimento) Obter o dia da data de nascimento
    -- MONTH(datanascimento) Obter o mês da data de nascimento
    YEAR(data_nascimento)
    FROM alunos
    WHERE YEAR(data_nascimento) = 2006;


-- Criar a tabela chamada pokedex, com as seguintes colunas
-- id, numero NN, nome NN, categoria NN, tipo1 NN, tipo2, numero_evolucoes NN
-- Inserir 10 registros de pokemons na tabela de pokedex
-- Criar as seguintes consultas:
--  Consultar todos os pokemons com todas as colunas
--  Consultar todos os pokemons com as colunas nome, categoria ordenados por categoria
-- Consultar todos os pokemons com o numero, nome, tipo1 e tipo ordenados por numero 
-- Consultar os pokemons da categoria grama com as colunas nome, tipo, tipo2
-- Consultar os pokemons da categoria fantasma com as colunas numero, nome
-- Consultar os pokemons que contenham mais do 2 evoluções

CREATE TABLE pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    categoria TEXT,
    tipo1 TEXT,
    tipo2 TEXT,
    numero_evolucoes INT NOT NULL
);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (25, 'Pikachu','Pokémon Rato','Elétrico',NULL,3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (6,'Charizard','Pokémon Lagarto','Fogo','Voador',3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (1,'Bulbasaur','Pokémon Semente','Grama','Venenoso',3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (39,'Jigglypuff', 'Pokémon Balão','Normal','Fada', 3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (94,'Gengar','Pokémon Sombra','Fantasma','Venenoso',2);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (133,'Eevee','Pokémon Evolutivo','Normal',NULL,8);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (143,'Snorlax','Pokémon Soneca','Normal',NULL,1);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (448,'Lucario','Pokémon Aura','Lutador','Metálico',2);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (658,'Greninja','Pokémon Ninja','Água', 'Noturno',2);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (282,'Gardevoir','Pokémon Sentinela', 'Psíquico','Fada',3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (7,'Squirtle','Pokémon Shell','Água',NULL,3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (16,'Pidgey', 'Pokémon Passáro','Normal','Voador',3);

INSERT INTO pokemon (numero, nome, categoria, tipo1, tipo2, numero_evolucoes)
VALUES (92,'Gastly', 'Pokémon Gasoso','Fantasma','Venenoso',3);

-- DROP TABLE apaga uma tabela
DROP TABLE IF EXISTS carros ;
CREATE TABLE carros(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_fabricante INT NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    id_cor INT NOT NULL,
    ano INT NOT NULL,
    valor DOUBLE NOT NULL,

    -- Chave Estrangeira
    FOREIGN KEY(id_fabricante) REFERENCES fabricantes(id),
    FOREIGN KEY(id_cor) REFERENCES cores(id)
);

-- Buscar o id da cor vermelho
SELECT id, nome FROM cores WHERE nome = 'Vermelho';

-- Buscar o id do fabricante Ferrari
SELECT id, nome FROM fabricantes WHERE nome = 'Ferrari';

INSERT INTO carros (valor, modelo, id_cor, ano, id_fabricante) VALUES
(7000000.00, "SF90", 1, 2018, 2);

INSERT INTO carros (valor, modelo, id_cor, ano, id_fabricante) VALUES
(10000000.00, "Bugatti Veyron", 4, 2024, 8);

INSERT INTO carros (valor, modelo, id_cor, ano, id_fabricante) VALUES
(100000.00, "Polo", 5, 2024, 7);

SELECT id, modelo, id_cor, ano, id_fabricante,  valor FROM carros;


-- Consultar o modelo do carro e o nome da cor
SELECT
    carros.modelo,
    cores.nome
    FROM carros
    INNER JOIN cores ON(carros.id_cor = cores.id);

-- Consultar o modelo do carro e o nome do fabricante
SELECT 
    carros.modelo, 
    fabricantes.nome
    FROM carros
    INNER JOIN fabricantes ON (carros.id_fabricante = fabricantes.id);

-- Consultar o modelo, nome do fabricante e nome da cor
-- https://dontpad.com/franciscosensaulas/python