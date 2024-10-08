from typing import List
from banco_dados import conectar
from entidades import Marca, Modelo, Versao


def obter_todas_versoes() -> List[Versao]:
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("""
    SELECT 
        marcas.id,
        marcas.nome,
        modelos.id,
        modelos.nome,
        versoes.id,
        versoes.nome,
        versoes.motor
    FROM versoes
    INNER JOIN modelos ON (modelos.id = versoes.id_modelo)
    INNER JOIN marcas ON (marcas.id = modelos.id_marca);""")
    registros = cursor.fetchall()
    conexao.close()
    versoes: List[Versao] = []
    for registro in registros:
        marca = Marca(registro[0], registro[1], None)
        modelo = Modelo(registro[2], marca, registro[3])
        versao = Versao(registro[4], modelo, registro[5], registro[6])
        versoes.append(versao)
    return versoes


def cadastrar(id_modelo: int, nome: str, motor: str):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO versoes (id_modelo, nome, motor) VALUES (%s, %s, %s)", (id_modelo, nome, motor))
    conexao.commit()
    conexao.close()