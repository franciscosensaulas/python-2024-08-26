import questionary
from cores import limpar_tela
from perguntar_entidade import escolher_marca, escolher_modelo_da_marca
from repositorios.versao_repositorio import cadastrar, obter_todas_versoes
from rich.console import Console
from rich.table import Table


def menu_versoes():
    opcao_escolhida = ""
    opcoes = [
        "Consultar versões",
        "Cadastrar versão",
        "Sair"
    ]
    while opcao_escolhida != "Sair":
        opcao_escolhida = questionary.select(
            "Menu de versões", choices=opcoes,
        ).ask()
        limpar_tela()

        if opcao_escolhida == "Consultar versões":
            consultar_versoes()
        elif opcao_escolhida == "Cadastrar versão":
            inserir_versao()

def consultar_versoes():
    versoes = obter_todas_versoes()

    # Criar a tabela (que apresentaremos os registros) com seu cabeçalho
    tabela = Table(title="Lista de Versões")
    tabela.add_column("Código")
    tabela.add_column("Marca")
    tabela.add_column("Modelo")
    tabela.add_column("Nome")
    tabela.add_column("Motor")

    for versao in versoes:
        tabela.add_row(
            str(versao.id),
            versao.modelo.marca.nome,
            versao.modelo.nome,
            versao.nome,
            versao.motor,
        )

    console = Console()
    console.print(tabela)

def inserir_versao():
    # Obter as marcas
    marca = escolher_marca()
    if marca is None:
        return
    # Após selecionar a marca, obter os modelos daquela marca
    modelo = escolher_modelo_da_marca(marca.id)
    if modelo is None:
        return
    
    nome = questionary.text("Digite o nome da versão:").ask()
    motor = questionary.text("Digite o motor da versão:").ask()
    cadastrar(modelo.id, nome, motor)
    print("Versão cadastrada com sucesso")
