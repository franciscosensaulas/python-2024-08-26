from typing import List

from banco_dados import conectar
from entidades import Marca, Modelo


def cadastrar(id_marca: int, nome: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO modelos (id_marca, nome) VALUES (%s, %s)", (id_marca, nome))
    conexao.commit()
    conexao.close()


def atualizar(id: int, id_marca: int, nome: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("UPDATE modelos SET id_marca = %s, nome = %s WHERE id = %s", (id_marca, nome, id))
    conexao.commit()
    conexao.close()


def obter_todos_modelos() -> List[Modelo]:
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("""
    SELECT 
        modelos.id,
        modelos.nome,
        modelos.id_marca,
        marcas.nome,
        marcas.cnpj
    FROM modelos
    INNER JOIN marcas ON (modelos.id_marca = marcas.id)""")
    registros = cursor.fetchall()
    conexao.close()

    lista_modelos: List[Modelo] = []
    for registro in registros:
        id = registro[0]
        nome = registro[1]
        id_marca = registro[2]
        nome_marca = registro[3]
        cnpj_marca = registro[4]
        marca = Marca(id_marca, nome_marca, cnpj_marca)
        modelo = Modelo(id, marca, nome)
        lista_modelos.append(modelo)
    return lista_modelos


def apagar(id: int):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("DELETE FROM modelos WHERE id = %s", (id,))
    conexao.commit()
    conexao.close()