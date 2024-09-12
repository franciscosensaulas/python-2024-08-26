texto = "     Batatinha quando nassi e vivel "

# tirar espaços do começo
def remover_espacos_comeco():
    print("Texto original: '" + texto + "'")
    # Remover os espaços da esquerda da string (left strip)
    print("Texto modificado: '" + texto.lstrip() + "'")


# tirar espaços do final
def remover_espacos_final():
    print("Texto original: '" + texto + "'")
    # Remover os espaços da direita da string (right strip)
    print("Texto modificado: '" + texto.rstrip() + "'")


def remover_espacos_comeco_final():    
    print("Texto original: '" + texto + "'")
    # Remover os espaços da direita e da esquerda da string
    print("Texto modificado: '" + texto.strip() + "'")


# substituir parte por outra parte
def substituir_texto():
    print("Texto original: '" + texto + "'")
    novo_texto = texto.replace("vivel", "viveu").replace("nassi", "nasci")
    print("Texto modificado: '" + novo_texto + "'")


def substituir_exemplo():
    # 'R$ 2.302,10 ' => 2302.10
    valor = input("Digite o valor: ")
    valor = valor.replace("R$", "") # substituir o 'R$' por nada
    valor = valor.replace(" ", "") # substituir o espaço por nada
    valor = valor.replace(".", "") # substituir o ponto por nada
    valor = valor.replace(",", ".") # substituir a vírgula por ponto
    print(valor)
    numero_real = float(valor)


def substituir_data_completa():
    data_texto = "Blumenau, 26 de agosto de 2024."
    data_texto = data_texto.replace("Blumenau,", "")
    data_texto = data_texto.replace("agosto", "08")
    data_texto = data_texto.replace("de", "/")
    data_texto = data_texto.replace(" ", "")
    data_texto = data_texto.replace(".", "")
    print(data_texto)
    # 26/08/2024


def obter_tamanho_string():
    texto_flor = "A flor é vermelha "
    print("Texto:", texto_flor)
    # Descobrir o tamanho do texto
    tamanho_texto_flor = len(texto_flor)
    print("Tamanho:", tamanho_texto_flor)


def quebrar_string():
    data = "26/12/2024"
    data_completa = data.split("/")
    dia = data_completa[0]
    mes = data_completa[1]
    ano = data_completa[2]
    print(dia)
    print(mes)
    print(ano)

def quebrar_data_hora():
    data_hora = "05/03/2011 15:32:24"
    data_hora_completa = data_hora.strip().split(" ")
    data_completa = data_hora_completa[0].split("/")
    hora_completa = data_hora_completa[1].split(":")

    dia = data_completa[0]
    mes = data_completa[1]
    ano = data_completa[2]
    hora = hora_completa[0]
    minuto = hora_completa[1]
    segundo = hora_completa[2]

    print(dia, "/", mes, "/", ano, " ", hora, ":", minuto, ":", segundo)


def transformar_letra_minuscula():
    texto = "Olá mundO"
    texto_caixa_baixa = texto.lower() # olá mundo
    print(texto_caixa_baixa)


def transformar_letra_maiscula():
    texto = "Olá mundO"
    texto_caixa_alta = texto.upper() # olá mundo
    print(texto_caixa_alta)


transformar_letra_minuscula()
transformar_letra_maiscula()

# https://dontpad.com/franciscosensaulas/python