# Função
def exemplo01():
    # Variáveis
    # string: armazena uma cadeia de caracteres
    nome = "Batatinha"
    # int: armazena número inteiro
    quantidade = 80
    # float: armazena número real
    preco_unitario = 5.20
    
    total = quantidade * preco_unitario
    
    print("Nome:", nome)
    print("Quantidade:", quantidade)
    print("Preço unitário: ", preco_unitario)
    print("Total: ", total)

    # camelCase
    # PascalCase
    # kebab-case
    # snake_case


def exemplo_descobrir_percentual():
    quantidade_total_produtos = 500
    quantidade_rtx_4090 = 10
    # 500           100
    # 12
    percentual = (quantidade_rtx_4090 * 100)/ quantidade_total_produtos
    print("Percentual RTX 4090: ", percentual)


def exemplo_entrada_dados01():
    # input é uma função que retorna uma string
    nome = input("Digite o nome: ")
    sobrenome = input("Digite o sobrenome: ")

    # Concatenar o nome e sobrenome armazenando na variável nome_completo
    nome_completo = nome + " " + sobrenome

    print(nome_completo)


def exemplo_calculadora_somar():
    # Converter a entrada do usuário que é uma string para int
    numero1 = int(input("Digite o número 1: "))
    numero2 = int(input("Digite o número 2: "))
    soma = numero1 + numero2
    print("Soma:", soma)


def exemplo_pedido():
    nome = input("Digite o nome do produto: ")
    quantidade = int(input("Digite a quantidade: "))
    preco_unitario = float(input("Digite o preço unitário: "))

    total = quantidade * preco_unitario

    print("Total: ", total)

exemplo_pedido()