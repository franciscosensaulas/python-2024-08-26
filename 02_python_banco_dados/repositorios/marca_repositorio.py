from typing import List
from entidades import Marca
from banco_dados import conectar


def obter_todas_marcas() -> List[Marca]:
    conexao = conectar()
    # criado cursor que nos permitirá executar comandos de SQL 
    cursor = conexao.cursor()
    # definir que será executado uma consulta (SELECT) de todas as marcas 
    cursor.execute("SELECT id, cnpj, nome FROM marcas")
    # fetchall buscar todos os registros encontrados na consulta
    registros = cursor.fetchall()
    # fechar a conexão com o banco de dados
    conexao.close()

    # criando a lista de marcas
    marcas : List[Marca] = []
    # percorrer cada um dos registros que consultamos do banco de dados
    for registro in registros:
        # obter os valores das colunas do select
        id = registro[0]
        nome = registro[2]
        cnpj = registro[1]
        # instanciando um objeto da marca, passando como parâmetro no construtor
        marca = Marca(id, nome, cnpj)
        # adicionando a marca na lista de marcas
        marcas.append(marca)
    # retornar a lista de marcas
    return marcas


def cadastrar(nome: str, cnpj: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO marcas (nome, cnpj) VALUES (%s, %s)", (nome, cnpj))
    conexao.commit() # Efetuar a transação
    conexao.close() # Fechar a conexão com o banco de dados


def atualizar(id: int, nome: str, cnpj: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("UPDATE marcas SET nome = %s, cnpj = %s WHERE id = %s", (nome, cnpj, id))
    conexao.commit()
    conexao.close()


def apagar(id: int):
    # Abrir a conexão
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("DELETE FROM marcas WHERE id = %s", (id,))
    conexao.commit() # Efetuar a transação
    conexao.close() # Fechar a conexão com o banco de dados