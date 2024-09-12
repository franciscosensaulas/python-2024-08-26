import time


def exemplo_for01():
    # https://dontpad.com/franciscosensaulas/python
    # indice = 0
    # while indice < 5:
    #     nome = input("Digite o nome: ")
    #     indice = indice + 1

    # Repete de 0 até 4
    # for (var i = 0; i < 5; i = i + 1)
    for i in range(0, 5):
        nome = input("Digite o nome: ")


def exemplo_for02():
    # for decrementando em -1
    for i in range(23, -1, -1): # hora
        for j in range(59, -1, -1): # minuto
            for k in range(59, -1, -1):
                print(i, ":", j, ":", k, sep="")
                time.sleep(1)
    # 23:59:59
    # 23:59:58
    # 23:59:57
    # 23:59:00
    # 23:58:59
    # 00:00:00


def exemplo_for03():
    quantidade = int(input("Digite a quantidade de colaboradores para calcular a folha de pagamento: "))
    for i in range(0, quantidade):
        nome = input("Digite o nome: ")
        quantidade_horas = int(input("Digite a quantidade de horas trabalhadas: "))
        valor_hora = float(input("Digite o valor hora: "))
        salario_bruto = quantidade_horas * valor_hora
        print(f"Nome: {nome} Salário bruto: R$ {salario_bruto:.2f}")

# 



if __name__ == "__main__":
    exemplo_for03()