DROP DATABASE super_dev_financeiro;
CREATE DATABASE super_dev_financeiro;
USE super_dev_financeiro;

CREATE TABLE contas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    saldo DOUBLE NOT NULL
);

INSERT INTO contas (saldo) VALUES
(129.90),
(250.00);

-- Alterar o nome da tabela
ALTER TABLE contas RENAME TO despesas;

-- https://dontpad.com/franciscosensaulas/mysql

-- Alterar o nome da coluna saldo para valor
ALTER TABLE despesas RENAME COLUMN saldo TO valor;

-- Adicionar coluna de status da despesa
ALTER TABLE despesas ADD COLUMN status INT;

INSERT INTO despesas (valor) VALUES (110);

-- Atualizar o status das despesas atuais
--- Atualizando a despesa de internet para o status pendente
UPDATE despesas SET status = 0 WHERE id = 1;
--- Atualizando a despesa da gasolina para o status realizado
UPDATE despesas SET status = 1 where id = 2;
--- Atualizando a despesa da megadog para o status realizado
UPDATE despesas SET status = 1 where id = 3;

-- Definir valor 0(pendente) como default(padrão) para a coluna de status, 
-- ou seja, ao realizar um insert caso ñ informado a coluna de status será 
-- preenchido com 0(pendente)
ALTER TABLE despesas ALTER COLUMN status SET DEFAULT 0;

INSERT INTO despesas (valor) VALUES (950.10);

-- Adicionado coluna do nome na tabela de despesas
ALTER TABLE despesas ADD COLUMN nome VARCHAR(10);

-- Alterar a coluna nome de VARCHAR(10) para VARCHAR(30)
ALTER TABLE despesas MODIFY nome VARCHAR(30);

-- Atualizar o nome das despesas atuais
UPDATE despesas SET nome = 'Internet Unifique' WHERE id = 1;
UPDATE despesas SET nome = 'Gasolina' WHERE id = 2;
UPDATE despesas SET nome = 'MegaDog' WHERE id = 3;
UPDATE despesas SET nome = 'Aluguel' WHERE id = 4;

-- Adicionar coluna de forma de pagamento na tabela de despesas
ALTER TABLE despesas ADD COLUMN forma_pagamento VARCHAR(20);

-- Atualizar a forma de pagamento das despesas atuais
--- Atualizar a forma de pagamento para despesa de internet
UPDATE despesas SET forma_pagamento = 'Pix' WHERE id = 1;
--- Atualizar a forma de pagamento para despesa de gasolina
UPDATE despesas SET forma_pagamento = 'Cartão de Crédito' WHERE id = 2;
--- Atualizar a forma de pagamento para despesa de Megadog
UPDATE despesas SET forma_pagamento = 'Pix' WHERE id = 3;

-- Tornar a coluna do nome obrigatória
ALTER TABLE despesas MODIFY nome VARCHAR(30) NOT NULL;

-- Consultar as despesas que a forma de pagamento é nula
SELECT * FROM despesas WHERE forma_pagamento IS NULL;
-- Consultar as despesas que a forma de pagamento é não nula, ou seja, preenchida
SELECT * FROM despesas WHERE forma_pagamento IS NOT NULL;

-- Adicionar data de vencimento
ALTER TABLE despesas ADD COLUMN data_vencimento DATE;

-- Atualizar a data de vencimento das despesas
UPDATE despesas SET data_vencimento = '2024-09-19' WHERE id = 1;
UPDATE despesas SET data_vencimento = '2024-09-20' WHERE id = 2;
UPDATE despesas SET data_vencimento = '2024-09-15' WHERE id = 3;
UPDATE despesas SET data_vencimento = '2024-09-20' WHERE id = 4;

-- Modificar not null para coluna de data de vencimento
ALTER TABLE despesas MODIFY data_vencimento DATE NOT NULL;

-- Adicionar coluna de data de pagemento
ALTER TABLE despesas ADD COLUMN data_pagamento DATE;

-- Atualizar as datas de pagamento das despesas
--- Definir a data de pagamento do gasolina
UPDATE despesas SET data_pagamento = '2024-09-16' WHERE id = 2;
--- Definir a data de pagamento do megadog
UPDATE despesas SET data_pagamento = STR_TO_DATE('15/09/2024', '%d/%m/%Y') WHERE id = 3;

-- Consultar a data de vencimento no formato 'Blumenau, 05 de Set de 2024.'
SELECT DATE_FORMAT(data_vencimento, 'Blumenau, %e de %b de %Y.') FROM despesas;

-- Consultar a hora no formato '23 horas e 04 minutos e 50 segundos'
SELECT TIME_FORMAT("23:04:50", "%H horas e %i e %S segundos");

-- Adicionar coluna de categoria na tabela de despesas
ALTER TABLE despesas ADD COLUMN categoria VARCHAR(40);
-- Atualizar a categoria das despesas
UPDATE despesas SET categoria = 'Contas Casa' WHERE id = 1;
UPDATE despesas SET categoria = 'Carro' WHERE id = 2;
UPDATE despesas SET categoria = 'Restaurante' WHERE id = 3;
UPDATE despesas SET categoria = 'Contas Casa' WHERE id = 4;
-- Definir como obrigatório a coluna de categoria
ALTER TABLE despesas MODIFY categoria VARCHAR(40) NOT NULL;


-- Criar tabela de categorias e popular
CREATE TABLE categorias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
INSERT INTO categorias (nome) VALUES
('Lazer'),
('Restaurante'),
('Contas Casa'),
('Carro'),
('Supermercado');

-- Criar coluna id_categoria na tabela de despesas
ALTER TABLE despesas ADD COLUMN id_categoria INT;

-- Adicionar chave estrangeira para a coluna de id_categoria referenciando a tabela de categorias
ALTER TABLE despesas ADD CONSTRAINT fk_categoria FOREIGN KEY(id_categoria) REFERENCES categorias(id);

-- Definir o código da categoria 'Contas Casa' da despesa Internet Unifique
-- UPDATE despesas SET id_categoria = (SELECT id FROM categorias WHERE nome = 'Contas Casa') WHERE id = 1;
UPDATE despesas SET 
	id_categoria = (SELECT id FROM categorias WHERE nome = 'Contas Casa') 
WHERE categoria = 'Contas Casa';

UPDATE despesas SET 
	id_categoria = (SELECT id FROM categorias WHERE nome = 'Restaurante') 
WHERE categoria = 'Restaurante';

UPDATE despesas SET 
	id_categoria = (SELECT id FROM categorias WHERE nome = 'Carro') 
WHERE categoria = 'Carro';

-- Apagar a coluna de categoria
ALTER TABLE despesas DROP COLUMN categoria;

SELECT * FROM despesas;

-- Gerar o create table da tabale
SHOW CREATE TABLE despeas;