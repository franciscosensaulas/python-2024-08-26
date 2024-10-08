import questionary
from perguntar_entidade import escolher_marca
from repositorios.marca_repositorio import obter_todas_marcas
from repositorios.modelo_repositorio import apagar, atualizar, cadastrar, obter_todos_modelos
from rich.console import Console
from rich.table import Table


def menu_modelos():
    opcoes = [
        "Consultar",
        "Cadastrar",
        "Editar",
        "Apagar",
        "Sair"
    ]
    opcao_escolhida = ""
    while opcao_escolhida != "Sair":
        opcao_escolhida = questionary.select("Menu de modelos", opcoes).ask()
        if opcao_escolhida == "Consultar":
            consultar_modelos()
        elif opcao_escolhida == "Cadastrar":
            inserir_modelo()
        elif opcao_escolhida == "Apagar":
            apagar_modelo()
        elif opcao_escolhida == "Editar":
            editar_modelo()


def editar_modelo():
    modelos = obter_todos_modelos()
    if len(modelos) == 0:
        print("Nenhum modelo cadastrado")
        return
    
    opcoes_para_escolher = []
    for modelo in modelos:
        opcao = questionary.Choice(modelo.nome, modelo.id)
        opcoes_para_escolher.append(opcao)
    # Perguntar para o usuário qual o modelo que deseja alterar,
    # quando usuário escolher o modelo será armazenado o id
    id_modelo_escolhido = questionary.select(
        "Escolha o modelo para alterar", opcoes_para_escolher,
    ).ask()
    
    # Perguntar o nome do novo modelo
    nome = questionary.text("Digite o nome do modelo").ask()
    id_marca = escolher_marca().id
    # Atualizar o registro na tabela de modelos 
    atualizar(id_modelo_escolhido, id_marca, nome)


def apagar_modelo():
    modelos = obter_todos_modelos()
    if len(modelos) == 0:
        print("Nenhum modelo cadastrado")
        return
    
    opcoes_para_escolher = []
    for modelo in modelos:
        opcao = questionary.Choice(modelo.nome, modelo.id)
        opcoes_para_escolher.append(opcao)
    # Perguntar para o usuário qual o modelo que deseja apagar,
    # quando usuário escolher o modelo será armazenado o id
    id_modelo_escolhido = questionary.select(
        "Escolha o modelo para apagar", opcoes_para_escolher,
    ).ask()
    # Chamar função para apagar
    apagar(id_modelo_escolhido)


def consultar_modelos():
    # Buscar no banco de dados os modelos para listarmos para o usuário
    modelos = obter_todos_modelos()
    if len(modelos) == 0:
        print("Nenhum modelo cadastrado")
        return

    # Criar a tabela (que apresentaremos os registros) com seu cabeçalho
    tabela = Table(title="Lista de Modelos")
    tabela.add_column("Código")
    tabela.add_column("Marca")
    tabela.add_column("Nome")

    for modelo in modelos:
        tabela.add_row(str(modelo.id), modelo.marca.nome, modelo.nome)

    console = Console()
    console.print(tabela)


def inserir_modelo():
    marca_escolhida = escolher_marca()
    if marca_escolhida is None:
        return

    nome = questionary.text("Digite o nome do modelo").ask()
    cadastrar(marca_escolhida.id, nome)
    print("Cadastrado com sucesso")

# tela (✔ cadastrar, editar, ✔ apagar, ✔ consultar)
# repositorio (✔ insert, ✔ update, ✔ delete, ✔ select)
# ✔ entidade
# ✔ banco dados