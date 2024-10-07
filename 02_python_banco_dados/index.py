import questionary
from marcas import menu_marcas
from modelos import menu_modelos
from proprietarios import menu_proprietarios
from cores import menu_cores  # Importando o menu de cores

def menu():
    opcoes = [
        "Marcas",
        "Modelos",
        "Cores",  # Adicionando a opção para Cores
        "Proprietários",
        "Sair"
    ]
    menu_escolhido = ""
    while menu_escolhido != "Sair":
        menu_escolhido = questionary.select(
            "Escolha o menu desejado", opcoes
        ).ask()
        if menu_escolhido == "Marcas":
            menu_marcas()
        elif menu_escolhido == "Modelos":
            menu_modelos()
        elif menu_escolhido == "Cores":  # Chamando o menu de cores
            menu_cores()
        elif menu_escolhido == "Proprietários":  # Chamando o menu de cores
            menu_proprietarios()


if __name__ == "__main__":
    menu()
