import questionary
import os
from rich.console import Console
from rich.table import Table
from repositorios.proprietario_repositorio import cadastrar, apagar, atualizar, obter_todos_proprietarios


def limpar_tela():
    os.system("cls")


def menu_proprietarios():
    opcao_escolhida = ""
    while opcao_escolhida != "Sair":
        opcao_escolhida = questionary.select(
        "Menu de Proprietarios",
        choices=[
            "Consultar proprietarios",
            "Cadastrar proprietarios",
            "Editar proprietarios",
            "Apagar proprietarios",
            "Sair"
        ]).ask()
        limpar_tela()

        if opcao_escolhida == "Consultar proprietarios":
            consultar_proprietario()
        elif opcao_escolhida == "Cadastrar proprietarios":
            inserir_proprietario()
        elif opcao_escolhida == "Editar proprietarios":
            atualizar_proprietario()
        elif opcao_escolhida == "Apagar proprietarios":
            apagar_proprietario()


def consultar_proprietario():
    proprietarios = obter_todos_proprietarios()
    if len(proprietarios) == 0:
        print("Nenhum proprietario cadastrado")
        return
    
    table = Table(title="Consulta de Proprietarios")

    table.add_column("Código", justify="center", style="cyan", no_wrap=True)
    table.add_column("Nome", justify="center", style="cyan", no_wrap=True)
    table.add_column("CPF/CNPJ", justify="center", style="cyan", no_wrap=True)
    table.add_column("Data de Nascimento", justify="center", style="cyan", no_wrap=True)
    table.add_column("e-mail", justify="center", style="magenta")
    table.add_column("Celular", justify="center", style="magenta")
    table.add_column("Estado", justify="center", style="magenta")
    table.add_column("Cidade", justify="center", style="magenta")
    table.add_column("Bairro", justify="center", style="green")
    table.add_column("Logradouro", justify="center", style="green")
    table.add_column("CEP", justify="center", style="green")
    table.add_column("Numero", justify="center", style="green")
    table.add_column("Complemento", justify="center", style="green")

    for proprietario in proprietarios:
        table.add_row(str(proprietario.id), proprietario.nome, proprietario.cpf_cnpj, str(proprietario.data_nascimento), proprietario.email, proprietario.celular, proprietario.estado, proprietario.cidade, proprietario.bairro, proprietario.logradouro, proprietario.cep, proprietario.numero, proprietario.complemento)

    console = Console()
    console.print(table)


def inserir_proprietario():
    nome = questionary.text("Informe o nome do proprietario: ").ask()
    cpf_cnpj = questionary.text("Informe o cpf ou cnpj do proprietario: ").ask()
    data_nascimento = questionary.text("Informe a data de nascimento do proprietario: ").ask()
    email = questionary.text("Informe o e-mail do proprietario: ").ask()
    celular = questionary.text("Informe o celular do proprietario: ").ask()
    estado = questionary.text("Informe o estado do proprietario: ").ask()
    cidade = questionary.text("Informe a cidade do proprietario: ").ask()
    bairro = questionary.text("Informe o bairro do proprietario: ").ask()
    logradouro = questionary.text("Informe o logradouro do proprietario: ").ask()
    cep = questionary.text("Informe o cep do proprietario: ").ask()
    numero = questionary.text("Informe o numero da residencia do proprietario: ").ask()
    complemento = questionary.text("Informe o complemento da residencia: ").ask()
    cadastrar(nome, cpf_cnpj, data_nascimento, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento)
    print("Proprietario cadastrado com sucesso")


def atualizar_proprietario():
    proprietarios = obter_todos_proprietarios()
    if len(proprietarios) == 0:
        print("Nenhum proprietario cadastrado")
        return
    
    opcoes_para_escolher = []
    for proprietario in proprietarios:
        opcao = questionary.Choice(proprietario.nome, proprietario.id)
        opcoes_para_escolher.append(opcao)

    id_proprietario_escolhido = questionary.select(
        "Escolha o proprietario para editar",
        choices=opcoes_para_escolher
    ).ask()

    nome_editado = questionary.text("Informe o nome: ").ask()
    cpf_cnpj_editado = questionary.text("Informe o CPF/CNPJ: ").ask()
    email_editado = questionary.text("Informe o email: ").ask()
    celular_editado = questionary.text("Informe o celular: ").ask()
    estado_editado = questionary.text("Informe o Estado: ").ask()
    cidade_editada = questionary.text("Informe a cidade: ").ask()
    bairro_editado = questionary.text("Informe o bairro: ").ask()
    logradouro_editado = questionary.text("Informe o logradouro: ").ask()
    cep_editado = questionary.text("Informe o CEP: ").ask()
    numero_editado = questionary.text("Informe o numero da residencia: ").ask()
    complemento_editado = questionary.text("Informe o complemento: ").ask()
    atualizar(nome_editado, cpf_cnpj_editado, email_editado, celular_editado, estado_editado, cidade_editada, bairro_editado, logradouro_editado, cep_editado, numero_editado, complemento_editado)


def apagar_proprietario():
    proprietarios = obter_todos_proprietarios()
    if len(proprietarios) == 0:
        print("Nenhum proprietario cadastrado")
        return
    
    opcoes = []
    for proprietario in proprietarios:
        opcao = questionary.Choice(proprietario.nome, proprietario.id)
        opcoes.append(opcao)

    id_apagar_proprietario = questionary.select(
        "Escolha um Proprietario para apagar",
        choices=opcoes,
    ).ask()
    apagar(id_apagar_proprietario)