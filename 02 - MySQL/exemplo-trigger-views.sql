drop database if exists super_dev_jogos;
create database super_dev_jogos;
use super_dev_jogos;
-- Criação da tabela Marcas
CREATE TABLE Marcas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Consoles
CREATE TABLE Consoles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_lancamento DATE NOT NULL,
    id_marca INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES Marcas(id)
);

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL
);

-- Criação da tabela Vendas
CREATE TABLE Vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_console INT NOT NULL,
    id_cliente INT NOT NULL,
    quantidade INT NOT NULL,
    data_hora_venda DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_console) REFERENCES Consoles(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

-- Inserção de dados na tabela Marcas
INSERT INTO Marcas (nome) VALUES
('Nintendo'),
('Sony'),
('Microsoft'),
('Sega'),
('Atari');

-- Inserção de dados na tabela Consoles
INSERT INTO Consoles (nome, preco, data_lancamento, id_marca) VALUES
('Nintendo Entertainment System', 199.99, '1983-07-15', 1),
('Super Nintendo Entertainment System', 199.99, '1990-11-21', 1),
('Nintendo 64', 199.99, '1996-06-23', 1),
('Nintendo GameCube', 199.99, '2001-09-14', 1),
('Nintendo Wii', 249.99, '2006-11-19', 1),
('Nintendo Wii U', 299.99, '2012-11-18', 1),
('Nintendo Switch', 299.99, '2017-03-03', 1),
('Sony PlayStation', 299.99, '1994-12-03', 2),
('Sony PlayStation 2', 299.99, '2000-03-04', 2),
('Sony PlayStation 3', 499.99, '2006-11-11', 2),
('Sony PlayStation 4', 399.99, '2013-11-15', 2),
('Sony PlayStation 5', 499.99, '2020-11-12', 2),
('Microsoft Xbox', 299.99, '2001-11-15', 3),
('Microsoft Xbox 360', 399.99, '2005-11-22', 3),
('Microsoft Xbox One', 499.99, '2013-11-22', 3),
('Microsoft Xbox Series X', 499.99, '2020-11-10', 3),
('Sega Master System', 199.99, '1985-10-20', 4),
('Sega Genesis', 189.99, '1988-10-29', 4),
('Sega Saturn', 399.99, '1994-11-22', 4),
('Sega Dreamcast', 199.99, '1998-11-27', 4),
('Atari 2600', 199.99, '1977-09-11', 5),
('Atari 5200', 269.99, '1982-11-01', 5),
('Atari 7800', 139.99, '1986-05-01', 5),
('Nintendo Game Boy', 89.99, '1989-04-21', 1),
('Sony PSP', 249.99, '2004-12-12', 2);

-- Inserção de dados na tabela Clientes
INSERT INTO Clientes (nome, cpf, data_nascimento) VALUES
('João Silva', '12345678909', '1980-05-15'),
('Maria Oliveira', '98765432100', '1985-08-22'),
('José Souza', '11144477735', '1975-12-30'),
('Ana Pereira', '22233344456', '1990-03-12'),
('Pedro Lima', '55566677788', '1988-07-01'),
('Lucas Fernandes', '99988877766', '1992-11-05'),
('Paulo Gomes', '33322211100', '1983-09-20'),
('Rafael Costa', '44455566677', '1995-06-18'),
('Bruno Ribeiro', '77788899900', '1987-02-28'),
('Mariana Santos', '88877766655', '1991-04-25'),
('Juliana Carvalho', '66655544433', '1993-10-10'),
('Gabriel Alves', '55544433322', '1989-01-30'),
('Matheus Castro', '44433322211', '1996-08-15'),
('Gustavo Dias', '22211100099', '1982-12-12'),
('Felipe Rodrigues', '11100099988', '1979-07-07'),
('Eduardo Melo', '99900011122', '1986-05-23'),
('Tiago Barbosa', '88811122233', '1984-03-14'),
('Daniel Ferreira', '77722233344', '1997-09-19'),
('Letícia Martins', '66633344455', '1994-06-08'),
('Larissa Rocha', '55544455566', '1981-11-29'),
('Beatriz Correia', '44455566677', '1985-02-02'),
('Luana Fernandes', '33366677788', '1988-07-16'),
('Camila Alves', '22277788899', '1990-10-05'),
('Lucas Oliveira', '11188899900', '1992-01-01'),
('Vinícius Santos', '12312312312', '1993-05-20'),
('Leonardo Souza', '32132132132', '1989-12-24'),
('André Gomes', '45645645645', '1987-04-18'),
('Diego Costa', '65465465465', '1991-09-09'),
('Ricardo Lima', '78978978978', '1986-03-30'),
('Rodrigo Ribeiro', '98798798798', '1983-06-07'),
('Carla Pereira', '15915915915', '1995-08-13'),
('Fernanda Oliveira', '95195195195', '1984-10-28'),
('Isabela Mendes', '25825825825', '1997-01-19'),
('Sabrina Nunes', '85285285285', '1985-05-08'),
('Amanda Duarte', '35735735735', '1990-02-14'),
('Rafael Moreira', '75375375375', '1992-11-21'),
('Bruno Cardoso', '14714714714', '1988-08-08'),
('Marcelo Pinto', '74174174174', '1981-12-05'),
('Victor Monteiro', '36936936936', '1979-07-23'),
('Marina Teixeira', '96396396396', '1986-03-03'),
('Renata Cunha', '95135785296', '1994-06-11'),
('Daniela Carvalho', '15935725846', '1995-09-27'),
('Patrícia Azevedo', '35715965485', '1989-04-17'),
('Roberta Silva', '75395145684', '1982-02-09'),
('Flávia Souza', '45685278996', '1996-08-02'),
('João Pereira', '65425896385', '1987-11-12');

-- Inserção de dados na tabela Vendas
INSERT INTO Vendas (id_console, id_cliente, quantidade, data_hora_venda, status) VALUES
(5, 12, 1, '2018-01-15 14:23:45', 'Completed'),
(10, 3, 2, '2018-02-20 09:17:30', 'Shipped'),
(17, 22, 1, '2018-03-01 16:45:10', 'Completed'),
(1, 35, 1, '2018-04-05 11:05:55', 'Completed'),
(23, 40, 3, '2018-05-25 19:20:35', 'Pending'),
(7, 18, 1, '2018-06-12 13:15:05', 'Completed'),
(12, 27, 2, '2018-07-30 10:50:50', 'Shipped'),
(20, 5, 1, '2018-08-22 17:30:30', 'Cancelled'),
(9, 31, 2, '2018-09-11 15:05:25', 'Completed'),
(15, 8, 1, '2018-10-18 12:40:15', 'Returned'),
(2, 21, 3, '2018-11-07 09:55:05', 'Completed'),
(6, 14, 1, '2018-12-24 20:10:50', 'Shipped'),
(13, 39, 2, '2018-12-31 22:55:40', 'Completed'),
(18, 2, 1, '2018-01-19 11:30:20', 'Pending'),
(24, 28, 2, '2018-02-27 08:15:10', 'Completed'),

(3, 6, 1, '2019-03-14 14:45:55', 'Completed'),
(11, 19, 1, '2019-04-23 16:20:40', 'Shipped'),
(16, 30, 2, '2019-05-02 09:05:35', 'Completed'),
(21, 11, 1, '2019-06-18 13:50:25', 'Cancelled'),
(8, 25, 2, '2019-07-29 15:35:15', 'Completed'),
(14, 9, 3, '2019-08-05 10:20:05', 'Completed'),
(4, 34, 1, '2019-09-17 18:55:50', 'Shipped'),
(22, 16, 1, '2019-10-26 12:40:40', 'Completed'),
(19, 7, 2, '2019-11-13 17:25:30', 'Pending'),
(25, 20, 1, '2019-12-05 20:10:20', 'Completed'),
(5, 33, 2, '2019-12-22 08:55:10', 'Returned'),
(10, 13, 1, '2019-01-09 14:40:00', 'Completed'),
(17, 26, 3, '2019-02-28 16:25:50', 'Cancelled'),
(1, 4, 1, '2019-03-15 19:10:40', 'Completed'),
(23, 32, 2, '2019-04-30 11:55:30', 'Shipped'),

(7, 17, 1, '2020-05-12 13:40:20', 'Completed'),
(12, 29, 2, '2020-06-22 09:25:10', 'Shipped'),
(20, 10, 1, '2020-07-30 16:10:00', 'Completed'),
(9, 24, 3, '2020-08-15 12:55:50', 'Pending'),
(15, 36, 1, '2020-09-28 18:40:40', 'Completed'),
(2, 15, 2, '2020-10-19 14:25:30', 'Cancelled'),
(6, 38, 1, '2020-11-06 10:10:20', 'Completed'),
(13, 1, 2, '2020-12-14 17:55:10', 'Shipped'),
(18, 23, 1, '2020-01-31 13:40:00', 'Completed'),
(24, 37, 2, '2020-02-08 09:25:50', 'Returned'),
(3, 5, 1, '2020-03-16 16:10:40', 'Completed'),
(11, 27, 3, '2020-04-24 12:55:30', 'Pending'),
(16, 12, 1, '2020-05-20 18:40:20', 'Completed'),
(21, 41, 2, '2020-06-29 14:25:10', 'Cancelled'),
(8, 44, 1, '2020-07-05 10:10:00', 'Completed'),

(14, 42, 2, '2021-08-17 15:55:50', 'Completed'),
(4, 18, 1, '2021-09-29 11:40:40', 'Shipped'),
(22, 31, 1, '2021-10-13 16:25:30', 'Completed'),
(19, 14, 2, '2021-11-07 09:10:20', 'Pending'),
(25, 21, 1, '2021-12-25 18:55:10', 'Completed'),
(5, 43, 3, '2021-01-11 14:40:00', 'Cancelled'),
(10, 2, 1, '2021-02-28 10:25:50', 'Completed'),
(17, 28, 2, '2021-03-15 17:10:40', 'Shipped'),
(1, 6, 1, '2021-04-22 13:55:30', 'Completed'),
(23, 33, 2, '2021-05-09 08:40:20', 'Pending'),
(7, 45, 1, '2021-06-30 16:25:10', 'Completed'),
(12, 16, 3, '2021-07-18 12:10:00', 'Cancelled'),
(20, 19, 1, '2021-08-05 18:55:50', 'Completed'),
(9, 25, 2, '2021-09-27 14:40:40', 'Shipped'),
(15, 8, 1, '2021-10-12 10:25:30', 'Completed'),

(2, 37, 2, '2022-11-20 19:10:20', 'Completed'),
(6, 13, 1, '2022-12-03 15:55:10', 'Pending'),
(13, 26, 1, '2022-01-14 11:40:00', 'Completed'),
(18, 9, 2, '2022-02-25 16:25:50', 'Cancelled'),
(24, 40, 1, '2022-03-31 12:10:40', 'Completed'),
(3, 22, 3, '2022-04-08 17:55:30', 'Shipped'),
(11, 35, 1, '2022-05-16 13:40:20', 'Completed'),
(16, 7, 2, '2022-06-27 09:25:10', 'Pending'),
(21, 30, 1, '2022-07-04 16:10:00', 'Completed'),
(8, 11, 2, '2022-08-19 12:55:50', 'Cancelled'),
(14, 39, 1, '2022-09-26 18:40:40', 'Completed'),
(4, 15, 2, '2022-10-10 14:25:30', 'Shipped'),
(22, 42, 1, '2022-11-17 10:10:20', 'Completed'),
(19, 3, 2, '2022-12-29 16:55:10', 'Pending'),
(25, 24, 1, '2022-01-05 13:40:00', 'Completed'),

(5, 32, 1, '2023-02-28 09:25:50', 'Completed'),
(10, 20, 2, '2023-03-15 16:10:40', 'Shipped'),
(17, 4, 1, '2023-04-30 12:55:30', 'Completed'),
(1, 36, 2, '2023-05-18 18:40:20', 'Pending'),
(23, 17, 1, '2023-06-29 14:25:10', 'Completed'),
(7, 29, 3, '2023-07-05 10:10:00', 'Cancelled'),
(12, 12, 1, '2023-08-17 15:55:50', 'Completed'),
(20, 38, 2, '2023-09-29 11:40:40', 'Shipped'),
(9, 1, 1, '2023-10-13 16:25:30', 'Completed'),
(15, 23, 2, '2023-01-07 09:10:20', 'Pending'),
(2, 41, 1, '2023-02-25 18:55:10', 'Completed'),
(6, 44, 2, '2023-03-11 14:40:00', 'Cancelled'),
(13, 6, 1, '2023-04-28 10:25:50', 'Completed'),
(18, 27, 3, '2023-05-15 17:10:40', 'Shipped'),
(24, 13, 1, '2023-06-22 13:55:30', 'Completed');

create view vendas_consoles as

	select marcas.nome as 'marca', consoles.nome as 'console', clientes.nome as 'cliente'
		from vendas 
		inner join clientes on (vendas.id_cliente = clientes.id)
		inner join consoles on (vendas.id_console = consoles.id)
		inner join marcas on (consoles.id_marca = marcas.id);


-- 299.99 => R$ 299,99
delimiter $
drop function if exists formatar_valor $ 
create function formatar_valor(valor double) returns varchar(20)  
deterministic
begin
	declare valor_formatado varchar(20);
	select concat("R$ ", format(valor, 2)) into valor_formatado;
	select replace(valor_formatado, ".", ",") into valor_formatado;
	return valor_formatado;
end $
delimiter ;

select formatar_valor(200.99199);

drop view if exists pedidos_finalizados;
create view pedidos_finalizados as
	select 
		vendas.data_hora_venda, 
		consoles.nome,
		vendas.quantidade, 
		formatar_valor(consoles.preco),
		formatar_valor(vendas.quantidade  * consoles.preco) as 'Total'
		from vendas
		inner join consoles on (vendas.id_console = consoles.id)
		where vendas.status = "Completed";

	
drop view if exists pedidos_2018;
create view pedidos_2018 as 
	select 
	vendas.data_hora_venda as 'data_hora',
	case
		when vendas.status = 'Completed' then 'Finalizado'
		when vendas.status = 'Shipped' then 'Enviado'
		when vendas.status = 'Cancelled' then 'Cancelado'
		when vendas.status = 'Pending' then 'Pendente'
		else 'Retornado'
	end as 'Status',
	formatar_valor(vendas.quantidade * consoles.preco) as 'total venda'
	from vendas
	inner join consoles on (vendas.id_console = consoles.id)
	where year(vendas.data_hora_venda) = 2018
	order by vendas.status;

select * from pedidos_2018;


select * from vendas_consoles;


alter table clientes add column geracao VARCHAR(30);
delimiter $
drop trigger if exists preencher_geracao $
create trigger preencher_geracao before insert -- executar esse gatilho antes do insert ocorrer
on clientes -- antes do insert ser executado na tabela de clientes
for each row
begin
	-- criando variável para ano de nascimento
	declare ano_nascimento int;
	-- criando variável para armazenarmos a geração do cliente
	declare geracao_cliente varchar(30);
	-- definindo valor para variável ano_nascimento com o ano da data_nascimento do insert
	set ano_nascimento := year(new.data_nascimento);
	-- verificando se o ano de nascimento é maior que 1981
	if ano_nascimento >= 1981 then
		-- definindo que valor para variável com o valor 'Geração Y'
		set geracao_cliente := "Geração Y";
	else
		set geracao_cliente := "Outra";
	end if;
	-- Definindo valor para a coluna geração, com o que foi 
	-- armazenado na variável geracao_clietne, ou seja, mesmo que no insert n seja preenchido
	-- a coluna geração a trigger garantirá que a coluna será preenchida.
	set new.geracao := geracao_cliente;
end $
delimiter ;
select * from clientes;
insert into clientes (nome, data_nascimento, cpf) values 
("Francisco", "1994-06-04", "12345678910");



-- Remoção física
delete from vendas where id = 88;

-- Remoção digital
alter table vendas add column registro_ativo BIT default 1;

-- Apagar o registro 38
update vendas set registro_ativo = 0 where id = 38;

-- Consultar vendas apagadas e não
select * from vendas;

-- Consultar todas as vendas que não estão apagadas
select * from vendas where registro_ativo = 1;

-- Consultar todas as vendas que estão apagadas
select * from vendas where registro_ativo = 0;