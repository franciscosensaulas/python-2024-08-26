def exemplo_if_01():
    # Solicitar o número para o usuário
    numero = int(input("Digite um número: "))
    # Verificar se o número informado é o 10
    if numero == 10:
        print("Dez")
    elif numero == 11: # Senão verificar se o número é o 11 
        print("Onze")
    elif numero == 12:
        print("Doze")
    else: # senão
        print("Outro número")

# Operador relacional
# Igual                 ==
# Menor                 <
# Menor ou igual        <=
# Maior                 >
# Maior ou igual        >=
# Diferente             !=


def exemplo_if_02():
    numero = int(input("Digite o número: "))
    if numero > 0:
        print("Positivo")
    elif numero == 0:
        print("Neutro")
    else:
        print("Negativo")


def exemplo_if_03():
    numero = int(input("Digite o número: "))
    # Verificando se o resto da divisão é 0 (número par)
    if numero % 2 == 0:
        print("Número par")
    else:
        print("Número ímpar")

# Operador lógico
# E         and
# Ou        or

# Tabela Verdade E
# V e V => V
# F e V => F
# V e F => F
# F e F => F

# https://dontpad.com/franciscosensaulas/python
def exemplo_if_04():
    # Preço por produto: R$ 1500,00
    # Qtd: 10 => desconto 100,00
    # Qtd: 20 => desconto 250,00
    # Qtd: 30 => desconto 500,00
    # Qtd: 40 => desconto 790,00
    preco_unitario = 1_500.00
    quantidade = int(input("Digite a quantidade: "))

    if quantidade < 10:
        desconto = 0
    elif quantidade >= 10 and quantidade <= 19:
        desconto = 100.00
    elif quantidade >= 20 and quantidade < 30:
        desconto = 250.00
    elif quantidade >= 30 and quantidade < 40:
        desconto = 500.00
    else:
        desconto = 790.00
    total = (quantidade * preco_unitario) - desconto
    print("Preço unitário:", preco_unitario)
    print("Desconto:", desconto)
    print("Total:", total)


# Tabela verdade Ou
# V ou V => V
# F ou V => V
# V ou F => V
# F ou F => F
def exemplo_if_ou():
    categoria = input("Digite o nome da categoria: ").strip().lower()
    if categoria == "rpg" or categoria == "souls like":
        print("Curte um jogo difícil")
    else:
        print("Partiu minecraft")


exemplo_if_ou()