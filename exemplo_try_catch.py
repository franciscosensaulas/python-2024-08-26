


def exemplo_try_catch_conversao_inteiro():
    # Tentar fazer alguma coisa
    try:
        numero = int(input("Digite um número: "))
        print("Número: ", numero)
    # Caso ocorrer algum erro executará este código
    except Exception as ex:
        # ex é uma variável que contém os dados do erro que ocorreu
        print("Valor informado não é um número inteiro válido")

    # Encerra o programa sem impactar o usuário
    print("Fim do programa")


VERMELHO = "\033[31m"
VERDE = "\033[32m"
AMARELO = "\033[33m"
COR_NORMAL = "\033[0m"  # RESET to default color

def exemplo_try_catch_conversao_float():
    nome = ""
    while len(nome) < 3 or len(nome) > 100:
        nome = input("Digite o nome do colaborador: ").strip()
        if len(nome) < 3:
            print(VERMELHO, "Erro: Nome deve conter no mínimo 3 caracteres", COR_NORMAL)
        elif len(nome) > 100:
            print(VERMELHO, "Erro: Nome deve conter no máximo 100 caracteres", COR_NORMAL)

    quantidade_horas = 0
    while quantidade_horas <= 0 or quantidade_horas > 300:
        try:
            quantidade_horas = int(input("Digite a quantidade de horas: "))
            if quantidade_horas <= 0:
                print(VERMELHO, "Erro: Quantidade de horas deve ser no mínimo 1 hora", COR_NORMAL)
            elif quantidade_horas > 300:
                print(VERMELHO, "Erro: Quantidade de horas deve ser no máximo 300 horas", COR_NORMAL)
        except Exception as ex:
            print(VERMELHO, "Erro: Quantidade de horas digitadas não é um número inteiro válido", COR_NORMAL)

    valor_hora = 0
    while valor_hora < 1.00 or valor_hora > 1000:
        try:
            valor_hora = float(input("Digite o valor hora: ").replace(",", "."))
            if valor_hora < 1:
                print(VERMELHO, "Erro: valor hora deve ser no mínimo 1,00", COR_NORMAL)
            elif valor_hora > 1000:
                print(VERMELHO, "Erro: valor hora deve ser no máximo 1000,00", COR_NORMAL)
        except Exception as ex:
            print(VERMELHO, "Erro: valor hora digitado não é um número real válido", COR_NORMAL)
    
    salario_bruto = quantidade_horas * valor_hora
    print(VERDE, "Salário bruto:", salario_bruto, COR_NORMAL)
    

exemplo_try_catch_conversao_float()
