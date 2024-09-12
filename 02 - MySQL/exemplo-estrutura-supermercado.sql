DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE supermercado;
USE supermercado;


CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    id_categoria INT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

INSERT INTO categorias (nome) VALUES ('Alimentos');
INSERT INTO categorias (nome) VALUES ('Bebidas');
INSERT INTO categorias (nome) VALUES ('Limpeza');
INSERT INTO categorias (nome) VALUES ('Higiene Pessoal');
INSERT INTO categorias (nome) VALUES ('Frios e Laticínios');
INSERT INTO categorias (nome) VALUES ('Padaria e Confeitaria');
INSERT INTO categorias (nome) VALUES ('Carnes');
INSERT INTO categorias (nome) VALUES ('Frutas e Verduras');
INSERT INTO categorias (nome) VALUES ('Congelados');
INSERT INTO categorias (nome) VALUES ('Utilidades Domésticas');


INSERT INTO produtos (nome, id_categoria, preco, quantidade_estoque, descricao) VALUES 
('Arroz', 1, 20.50, 100, 'Arroz tipo 1, pacote de 5kg'),  -- Alimentos
('Feijão', 1, 12.90, 80, NULL),  -- Alimentos
('Macarrão', 1, 5.75, 150, 'Macarrão espaguete, pacote de 1kg'),  -- Alimentos
('Leite Integral', 5, 4.90, 200, NULL),  -- Frios e Laticínios
('Queijo Mussarela', 5, 29.90, 50, 'Queijo fatiado 500g'),  -- Frios e Laticínios
('Detergente', 3, 2.20, 300, NULL),  -- Limpeza
('Desinfetante', 3, 6.50, 120, 'Desinfetante com aroma de pinho'),  -- Limpeza
('Sabão em Pó', 3, 14.00, 90, NULL),  -- Limpeza
('Shampoo', 4, 15.90, 80, 'Shampoo para cabelos oleosos'),  -- Higiene Pessoal
('Sabonete', 4, 3.50, 200, NULL),  -- Higiene Pessoal
('Pão Francês', 6, 0.99, 300, 'Pão francês por unidade'),  -- Padaria e Confeitaria
('Torta de Morango', 6, 35.00, 20, NULL),  -- Padaria e Confeitaria
('Bolo de Chocolate', 6, 25.00, 25, 'Bolo de chocolate com cobertura'),  -- Padaria e Confeitaria
('Carne Bovina', 7, 40.90, 50, 'Carne de primeira'),  -- Carnes
('Frango Congelado', 9, 15.90, 100, NULL),  -- Congelados
('Banana', 8, 3.50, 150, NULL),  -- Frutas e Verduras
('Maçã', 8, 6.90, 130, 'Maçã gala'),  -- Frutas e Verduras
('Suco de Laranja', 2, 4.50, 80, NULL),  -- Bebidas
('Refrigerante', 2, 7.90, 100, 'Refrigerante de cola 2L'),  -- Bebidas
('Cerveja', 2, 3.50, 300, NULL),  -- Bebidas
('Água Mineral', 2, 2.00, 500, NULL),  -- Bebidas
('Vinho Tinto', 2, 49.90, 30, 'Vinho tinto seco'),  -- Bebidas
('Queijo Parmesão', 5, 45.90, 20, 'Queijo parmesão ralado'),  -- Frios e Laticínios
('Iogurte Natural', 5, 4.50, 80, NULL),  -- Frios e Laticínios
('Manteiga', 5, 8.90, 60, 'Manteiga sem sal 200g'),  -- Frios e Laticínios
('Sabão Líquido', 3, 22.50, 90, NULL),  -- Limpeza
('Álcool em Gel', 3, 9.90, 150, 'Álcool em gel 70%'),  -- Limpeza
('Limpador Multiuso', 3, 8.50, 110, NULL),  -- Limpeza
('Escova de Dentes', 4, 12.90, 50, 'Escova dental macia'),  -- Higiene Pessoal
('Condicionador', 4, 16.50, 75, NULL),  -- Higiene Pessoal
('Desodorante', 4, 9.90, 120, NULL),  -- Higiene Pessoal
('Pão de Queijo', 6, 22.90, 40, 'Pão de queijo congelado 1kg'),  -- Padaria e Confeitaria
('Biscoito', 1, 3.50, 200, NULL),  -- Alimentos
('Molho de Tomate', 1, 3.20, 150, 'Molho de tomate tradicional'),  -- Alimentos
('Farinha de Trigo', 1, 4.90, 100, NULL),  -- Alimentos
('Carne Suína', 7, 35.50, 30, 'Carne suína desossada'),  -- Carnes
('Salsicha', 5, 10.50, 80, NULL),  -- Frios e Laticínios
('Linguiça Calabresa', 7, 19.90, 60, 'Linguiça calabresa defumada'),  -- Carnes
('Papel Higiênico', 4, 12.50, 150, 'Pacote com 12 rolos'),  -- Higiene Pessoal
('Fralda', 4, 45.90, 40, NULL),  -- Higiene Pessoal
('Pão Integral', 6, 7.90, 80, NULL),  -- Padaria e Confeitaria
('Margarina', 5, 6.20, 70, 'Margarina com sal 250g'),  -- Frios e Laticínios
('Geléia de Morango', 1, 8.90, 50, NULL),  -- Alimentos
('Azeite de Oliva', 1, 19.90, 60, 'Azeite extra virgem 500ml'),  -- Alimentos
('Café', 1, 10.90, 120, NULL),  -- Alimentos
('Chá Verde', 2, 12.90, 90, NULL),  -- Bebidas
('Hambúrguer', 9, 13.50, 70, 'Hambúrguer bovino congelado'),  -- Congelados
('Sorvete', 9, 23.90, 40, NULL),  -- Congelados
('Pizza Congelada', 9, 18.90, 30, 'Pizza de mussarela'),  -- Congelados
('Batata Frita Congelada', 9, 15.00, 60, NULL),  -- Congelados
('Alface', 8, 2.50, 200, NULL),  -- Frutas e Verduras
('Tomate', 8, 5.90, 180, 'Tomate italiano'),  -- Frutas e Verduras
('Cenoura', 8, 3.50, 150, NULL),  -- Frutas e Verduras
('Brócolis', 8, 4.90, 70, NULL),  -- Frutas e Verduras
('Espuma de Barbear', 4, 18.90, 40, NULL),  -- Higiene Pessoal
('Ração para Cães', 10, 89.90, 20, NULL),  -- Utilidades Domésticas
('Sabonete Líquido', 4, 7.90, 90, NULL),  -- Higiene Pessoal
('Vassoura', 3, 12.50, 60, ),  -- Limpeza
('Esponja de Aço', 3, 2.90, 150, NULL),  -- Limpeza
('Churrasqueira', 10, 199.90, 10, NULL),  -- Utilidades Domésticas
('Filtro de Água', 10, 89.90, 15, NULL),  -- Utilidades Domésticas
('Guardanapo', 3, 5.90, 100, NULL),  -- Limpeza
('Papel Toalha', 3, 7.90, 110, NULL);  -- Limpeza


-- https://dontpad.com/franciscosensaulas/python
/*
Ex. 1: Consultar e apresentar os seguintes dados:
        nome da categoria, nome produto e preço
Ex. 2: Consultar e apresentar os seguintes dados:
        nome produto, preço, quantidade e total daquele produto
Ex. 3: Consultar nome do produto em órdem alfabética a-z
Ex. 4: Consultar nome do produto em órdem alfabética inversa
Ex. 5: Consultar nome, preço unitário ordenados por preço do unitário do maior para menor
Ex. 6: Consultar categoria, produto nome ordenados por nome da categoria
Ex. 7: Consultar categoria, produto nome ordenados por nome da categoria inversa
Ex. 8: Consultar categoria, produto nome ordenados filtrando por categoria Limpeza
Ex. 9: Consultar categoria, produto nome ordenados filtrando por categoria Congelados
Ex. 10: Consultar nome, preço e quantidade produtos que contém mais que 50 items
Ex. 11: Consultar nome, preço e quantidade produtos que contém o preço menor que R$ 10,00
Ex. 12: Consultar nome, preço e quantidade produtos que contém menos que 5 itens e o preço unitário é menor que 30 reais (procurar por e em mysql)
Ex. 13: Consultar categoria, nome ordenados filtrando por categoria Alimentos ou Carnes (procurar por ou em mysql)

SELECT alunos.nome 
    FROM alunos
    ORDER BY alunos.nome DESC;

Outro exercício:
Criar tabela de estados
  Colunas: id, sigla
  Inserir dois registros de estados
  Consultar todos os estados

Criar tabela de cidades
  Colunas: id, id_estado, nome
  Inserir duas cidades para cada estado
  Consultar nome da cidade e seu estado

Criar tabela de bairros
  Colunas: id, id_cidade, nome
  Inserir dois bairros para cada cidades
  Consultar nome do bairro e cidade
  Consultar nome do bairro, cidade e estado

Criar tabela de endereços
  Colunas: id, id_bairro, logradouro, numero
  Inserir dois endereços para cada bairro
  Consultar dados do endereço por completo(bairro, cidade, estado)
*/















