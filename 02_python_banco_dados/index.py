import questionary
from marcas import menu_marcas
from modelos import menu_modelos
from proprietarios import menu_proprietarios
from cores import menu_cores
from versoes import menu_versoes  # Importando o menu de cores

def menu():
    opcoes = [
        "Marcas",
        "Modelos",
        "Cores",  # Adicionando a opção para Cores
        "Proprietários",
        "Versões",
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
        elif menu_escolhido == "Versões":
            menu_versoes()


if __name__ == "__main__":
    menu()
