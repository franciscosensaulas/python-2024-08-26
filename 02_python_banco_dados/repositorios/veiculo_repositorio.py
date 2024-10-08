from typing import List
from banco_dados import conectar
from entidades import Veiculo


def obter_todos_veiculos() -> List[Veiculo]:
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("")
    registros = cursor.fetchall()
    conexao.close()
    veiculos: List[Veiculo] = []
    return veiculos


def cadastrar(
    id_proprietario: int,
    id_versao: int,
    id_cor: int,
    preco_inicial: float,
    preco_fipe: float,
    km: int,
    chassi: str,
    placa: str,
    renavam: str,
    ano_fabricacao: int,
    ano_modelo: int,
    novo: bool,
):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("""
        INSERT INTO veiculos 
        (id_proprietario, id_versao, id_cor, preco_inicial, preco_fipe, 
        km, chassi, placa, renavam, ano_fabricacao, ano_modelo, novo)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
        (id_proprietario, id_versao, id_cor, preco_inicial, preco_fipe,
         km, chassi, placa, renavam, ano_fabricacao, ano_modelo, novo))
    conexao.commit()
    conexao.close()