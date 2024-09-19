USE super_dev_financeiro;
-- Delimiter é o comando que defini qual será o(s) caracter(es) que será utilizado para encerrar a instrução
DELIMITER $
CREATE PROCEDURE criar_despesa(
	IN id_categoria INT, 
    IN nome VARCHAR(30), 
    IN valor DOUBLE, 
    IN data_vencimento DATE)
BEGIN
	INSERT INTO despesas (id_categoria, nome, valor, data_vencimento) 
    VALUE (id_categoria, nome, valor, data_vencimento);
    
    SELECT * FROM despesas 
		ORDER BY id DESC
        LIMIT 1;
END $
-- Retornando o delimitador para ';', ou seja, as demais instruções devem terminar com ';'
DELIMITER ;
CALL criar_despesa(1, "Cinema", 50, STR_TO_DATE('18/09/2024', '%d/%m/%Y'));


DELIMITER $
DROP PROCEDURE IF EXISTS realizar_pagamento $
CREATE PROCEDURE realizar_pagamento(
	IN nome_da_despesa VARCHAR(50), 
    IN forma_de_pagamento VARCHAR(50))
BEGIN
	-- Criar uma variável para armezenar o id da despesa que será consultada
	DECLARE id_despesa INT;
    SELECT id INTO id_despesa FROM despesas WHERE nome = nome_da_despesa;
    UPDATE despesas SET 
		forma_pagamento = forma_de_pagamento,
        status = 1,
        data_pagamento = DATE(NOW())
	WHERE id = id_despesa;
END $
DELIMITER ;
SELECT * FROM despesas;
CALL realizar_pagamento("Aluguel", "pix");
SELECT * FROM despesas;

DROP FUNCTION IF EXISTS concatenar_nome_completo;
DELIMITER //
CREATE FUNCTION concatenar_nome_completo(nome VARCHAR(30), sobrenome VARCHAR(100)) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(nome, " ", sobrenome);
END //
DELIMITER ;

SELECT concatenar_nome_completo("Bruce", "Uainee");

/*
Criar uma função para calcular o % de desconto
Quantidade do pedido   % desconto
2                  0
5                  2.5
10                 4.70
20                 6.51
50                 10
>                  15
*/
DROP FUNCTION IF EXISTS calcular_percentual;
DELIMITER $
CREATE FUNCTION calcular_percentual(quantidade_pedido INT) RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE percentual DOUBLE;
    IF quantidade_pedido <= 2 THEN
        SET percentual := 0;
    ELSEIF quantidade_pedido <= 5 THEN
        SET percentual := 2.5;
    ELSEIF quantidade_pedido <= 10 THEN
        SET percentual := 4.70;
    ELSEIF quantidade_pedido <= 20 THEN
        SET percentual := 6.51;
    ELSEIF quantidade_pedido <= 50 THEN
        SET percentual := 10;
    ELSE
        SET percentual := 15;    
    END IF;
    RETURN percentual;
END $

DELIMITER ;

SELECT calcular_percentual(1);
-- Criar function para obter o status de acordo com imc (com entrada do imc) retornando o status
-- Procurar no Google a tabela de IMC para poder responder a questão acima
-- Criar function para calcular o imc (com entrada de peso, altura) retornando o imc