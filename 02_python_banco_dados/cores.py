import questionary
import os
from rich.console import Console
from rich.table import Table
from repositorios.cor_repositorio import obter_todas_cores, cadastrar, atualizar, apagar


def limpar_tela():
    os.system("cls")


def menu_cores():
    opcao_escolhida = ""
    opcoes = [
        "Consultar cores",
        "Cadastrar cor",
        "Editar cor",
        "Apagar cor",
        "Sair"
    ]
    while opcao_escolhida != "Sair":
        opcao_escolhida = questionary.select("Menu de Cores", choices=opcoes).ask()
        limpar_tela()

        if opcao_escolhida == "Consultar cores":
            consultar_cores()
        elif opcao_escolhida == "Cadastrar cor":
            inserir_cor()
        elif opcao_escolhida == "Editar cor":
            atualizar_cor()
        elif opcao_escolhida == "Apagar cor":
            apagar_cor()


def inserir_cor():
    nome = questionary.text("Informe o nome da cor: ").ask()
    cadastrar(nome)
    print("Cor cadastrada com sucesso")


def consultar_cores():
    cores = obter_todas_cores()
    if len(cores) == 0:
        print("Nenhuma cor cadastrada")
        return

    table = Table(title="Consulta de Cores")

    table.add_column("Código", justify="center", style="cyan", no_wrap=True)
    table.add_column("Nome", justify="center", style="magenta")

    for cor in cores:
        table.add_row(str(cor.id), cor.nome)

    console = Console()
    console.print(table)


def atualizar_cor():
    cores = obter_todas_cores()
    if len(cores) == 0:
        print("Nenhuma cor cadastrada")
        return

    opcoes_para_escolher = []
    for cor in cores:
        opcao = questionary.Choice(title=cor.nome, value=cor.id)
        opcoes_para_escolher.append(opcao)
    
    id_cor_escolhida = questionary.select(
        "Escolha a cor que deseja editar",
        choices=opcoes_para_escolher
    ).ask()

    nome_editado = questionary.text("Informe o novo nome da cor: ").ask()
    atualizar(id_cor_escolhida, nome_editado)
    print("Cor atualizada com sucesso")


def apagar_cor():
    cores = obter_todas_cores()
    if len(cores) == 0:
        print("Nenhuma cor cadastrada")
        return

    opcoes = []
    for cor in cores:
        opcao = questionary.Choice(cor.nome, cor.id)
        opcoes.append(opcao)

    id_para_apagar = questionary.select(
        "Escolha a cor para apagar",
        choices=opcoes,
    ).ask()
    apagar(id_para_apagar)
    print("Cor apagada com sucesso")
