from typing import List

from banco_dados import conectar
from entidades import Modelo


def cadastrar(id_marca: int, nome: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO modelos (id_marca, nome) VALUES (%s, %s)", (id_marca, nome))
    conexao.commit()
    conexao.close()


def atualizar(id: int, nome: str):
    pass


def obter_todos_modelos() -> List[Modelo]:
    pass


def apagar(id: int):
    pass
