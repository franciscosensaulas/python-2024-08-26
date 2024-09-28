import questionary
import os
from rich.console import Console
from rich.table import Table
from typing import List
from modelos import Marca
# import banco_dados
from banco_dados import conectar


# https://dontpad.com/franciscosensaulas/python


def limpar_tela():
    os.system("cls")


def menu_marcas():
    opcao_escolhida = ""
    while opcao_escolhida != "Sair":
        opcao_escolhida = questionary.select(
        "Menu de Marcas",
        choices=[
            "Consultar marcas",
            "Cadastrar marca",
            "Editar marca",
            "Apagar marca",
            "Sair"
        ]).ask()
        limpar_tela()

        if opcao_escolhida == "Consultar marcas":
            consultar_marcas()
        elif opcao_escolhida == "Cadastrar marca":
            inserir_marca()
        elif opcao_escolhida == "Editar marca":
            atualizar_marca()
        elif opcao_escolhida == "Apagar marca":
            apagar_marca()


def inserir_marca(): # create
    nome = questionary.text("Informe o nome da marca: ").ask()
    cnpj = questionary.text("Informe o CNPJ: ").ask()

    # conexao = banco_dados.conectar()
    conexao = conectar()
    print("Conectado com sucesso")

    cursor = conexao.cursor()
    cursor.execute("use dev_motors")
    cursor.execute(f"INSERT INTO marcas (nome, cnpj) VALUES ('{nome}', '{cnpj}');")
    conexao.commit() # Efetuar a transação
    conexao.close() # Fechar a conexão com o banco de dados
    print("Marca cadastrada com sucesso")

def obter_todas_marcas() -> List[Marca]:
    conexao = conectar()
    print("Conectado com sucesso")
    # criado cursor que nos permitirá executar comandos de SQL 
    cursor = conexao.cursor()
    # definir que será executado uma consulta (SELECT) de todas as marcas 
    cursor.execute("SELECT id, nome, cnpj FROM marcas")
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
        nome = registro[1]
        cnpj = registro[2]
        # instanciando um objeto da marca, passando como parâmetro no construtor
        marca = Marca(id, nome, cnpj)
        # adicionando a marca na lista de marcas
        marcas.append(marca)
    # retornar a lista de marcas
    return marcas


def consultar_marcas(): # read
    marcas = obter_todas_marcas()

    table = Table(title="Consulta de Marcas")

    table.add_column("Código", justify="center", style="cyan", no_wrap=True)
    table.add_column("Nome", justify="center", style="magenta")
    table.add_column("CNPJ", justify="center", style="green")

    for marca in marcas:
        table.add_row(str(marca.id), marca.nome, marca.cnpj)

    console = Console()
    console.print(table)


def atualizar_marca(): # update
    marcas = obter_todas_marcas()

    opcoes_para_escolher = []
    for marca in marcas:
        opcao = questionary.Choice(title=marca.nome, value=marca.id)
        opcoes_para_escolher.append(opcao)
    
    id_marca_escolhida = questionary.select(
        "Escolha a marca que deseja editar",
        choices=opcoes_para_escolher
    ).ask()

    nome_editado = questionary.text("Informe o nome da marca: ").ask()
    cnpj_editado = questionary.text("Informe o CNPJ: ").ask()

    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute(f"UPDATE marcas SET nome = '{nome_editado}', cnpj = '{cnpj_editado}' WHERE id = {id_marca_escolhida}")
    conexao.commit()
    conexao.close()
    

# https://dontpad.com/franciscosensaulas/python
def apagar_marca(): # delete
    # Consultar todas as marcas
    marcas = obter_todas_marcas()

    # Criar um vetor com as marcas para o usuário poder escolher a marca que deseja apagar
    opcoes = []
    for marca in marcas:
        opcoes.append(marca.nome)

    # perguntando para o usuário qual marca ele deseja apagar
    marca_apagar = questionary.select(
        "Escolha a marca para apagar",
        choices=opcoes,
    ).ask()
    # Abrir a conexão
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute(f"DELETE FROM marcas WHERE nome = '" + marca_apagar + "'")
    conexao.commit() # Efetuar a transação
    conexao.close() # Fechar a conexão com o banco de dados
      


if __name__ == "__main__":
    menu_marcas()
