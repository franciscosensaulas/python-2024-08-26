from typing import List
from entidades import Cor
from banco_dados import conectar


def obter_todas_cores() -> List[Cor]:
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("SELECT id, nome FROM cores")
    registros = cursor.fetchall()
    conexao.close()

    cores: List[Cor] = []
    for registro in registros:
        id = registro[0]
        nome = registro[1]
        cor = Cor(id, nome)
        cores.append(cor)
    return cores


def cadastrar(nome: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO cores (nome) VALUES (%s)", (nome,))
    conexao.commit()
    conexao.close()


def atualizar(id: int, nome: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("UPDATE cores SET nome = %s WHERE id = %s", (nome, id))
    conexao.commit()
    conexao.close()


def apagar(id: int):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("DELETE FROM cores WHERE id = %s", (id,))
    conexao.commit()
    conexao.close()
