import time
import os


def exemplo_while01():
    indice = 0
    # Enquanto o indice for menor ou igual a 10, repetirá
    while indice <= 10:
        # Apresentar o indice para o usuário
        print(indice)
        # Incrementar a variável indice em 1
        indice = indice + 1


def exemplo_while02():
    indice = 10
    while indice >= 0:
        print(indice)
        # Delay de 1 segundo
        time.sleep(1)

        # Decrementar a variável indice em 1
        indice = indice - 1
    print("Feliz ano novo")


def exemplo_while03():
    indice = 0
    quantidade_souza = 0

    while indice < 3:
        nome = input("Digite o nome: ")
        sobrenome = input("Digite o sobrenome: ")

        if sobrenome.lower() == "souza":
            quantidade_souza = quantidade_souza + 1

        nome_completo = nome + " " + sobrenome
        print("Nome completo: ", nome_completo)

        # Delay de 1s
        time.sleep(1)
        os.system("cls")
        

        indice = indice + 1
    
    print("Quantidade de pessoas Souza: ", quantidade_souza)


def exemplo_while_descobrir_media():
    # Solicitar 5 idades, apresentar soma e média das idades
    indice = 0
    soma_idades = 0 # Acumulador das idades
    while indice < 5:
        idade = int(input("Digite a idade: "))
        # somar a idade atual informada com a soma das idades
        soma_idades = soma_idades + idade

        indice = indice + 1
    
    media = soma_idades / 5
    print("Soma das idades: ", soma_idades)
    print("Média: ", media)


def exemplo_while_descobrir_maior_valor():
    # Solicitar 4 valores e apresentar o maior deles
    indice = 0
    maior_valor = 0
    nome_produto_maior_valor = ""

    while indice < 4:
        produto = input("Digite o nome do produto: ")
        valor = float(input("Digite o valor: "))

        if valor > maior_valor:
            maior_valor = valor
            nome_produto_maior_valor = produto

        indice = indice + 1

    print("O produto ", nome_produto_maior_valor, " contém o maior valor R$ ", maior_valor)


def exemplo_while_descobrir_menor_valor():
    # Solicitar 3 valores e apresentar o menor deles
    indice = 0
    menor_valor = 99999999999999999
    
    while indice < 3:
        valor = float(input("Digite o valor: "))

        if valor < menor_valor:
            menor_valor = valor

        indice = indice + 1

    print("Menor valor: ", menor_valor)


# https://dontpad.com/franciscosensaulas/python
def exemplo_while_condicao_atrelada_ao_usuario():
    nome_produto = ""
    quantidade_hortifrute = 0
    quantidade_limpeza = 0
    quantidade_frios = 0

    while nome_produto.lower() != "sair":
        nome_produto = input("Digite o nome do produto (digite sair para encerrar): ").strip()
        # Verificar se o nome do produto é sair, deve encerrar a execução do while
        if nome_produto == "sair":
            break

        categoria = input("Digite a categoria do produto: ").strip()
        categoria_minuscula = categoria.lower()

        while categoria_minuscula != "limpeza" and categoria_minuscula != "hortifrute" and categoria_minuscula != "frios":
            print("Categoria inválida:")
            
            categoria = input("Digite a categoria do produto: ").strip()
            categoria_minuscula = categoria.lower()

        if categoria_minuscula == "limpeza":
            quantidade_limpeza = quantidade_limpeza + 1
        elif categoria_minuscula == "hortifrute":
            quantidade_hortifrute = quantidade_hortifrute + 1
        elif categoria_minuscula == "frios":
            quantidade_frios = quantidade_frios + 1
    
    print("Quantidade Frios: ", quantidade_frios)
    print("Quantidade Hortifrute: ", quantidade_hortifrute)
    print("Quantidade Limpeza: ", quantidade_limpeza)


def exemplo_while_garantir_input_preenchido_corretamente():
    # Solicitar o nome de 5 jogos, sendo que o nome deve conter no mínimo 3 caracteres e no máximo 50
    indice = 0
    while indice < 5:
        nome = input("Digite o nome do jogo [" + str(indice + 1) + "/5]: ").strip()
        while len(nome) < 3 or len(nome) > 50:
            print("Nome deve conter no mínimo 3 caracteres e no máximo 50 caracteres")
            nome = input("Digite o nome do jogo [" + str(indice + 1) + "/5]: ").strip()
        indice = indice + 1


def exemplo_while_perguntar_para_usuario_quantidade_desejada():
    # Perguntar a quantidade que o usuário deseja cadastrar
    indice = 0
    soma_produtos = 0
    quantidade_desejada = int(input("Digite a quantidade que deseja cadastrar: "))
    while indice < quantidade_desejada:
        nome = input("Digite o nome: ")
        quantidade = int(input("Digite um quantidade: "))
        preco_unitario = float(input("Digite um preço unitário: "))

        valor = quantidade * preco_unitario
        # Calcular a soma de todos os produtos
        soma_produtos = soma_produtos + valor

        print("Valor: ", valor)
        indice = indice + 1
    
    print("Total: ", soma_produtos)


# def exemplo_while_descobrir_maior_valor_de_string():
    # Solicitar o nome de 5 produtos e apresentar o produto que contém o maior nome
#    pass

# def exemplo_while_com_try_catch():
#    pass


exemplo_while_perguntar_para_usuario_quantidade_desejada()