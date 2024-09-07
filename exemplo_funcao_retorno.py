# solicitar nome do usuário, min 3, max 50
# solicitar sobrenome do usuário, min 3, max 100
# solicitar idade do usuário, min 0, max 128

# Função sem retorno
def exemplo_funcao():
    nome : str = solicitar_nome()
    sobrenome : str = solicitar_sobrenome()
    idade : int = solicitar_idade()
    print("Nome: ", nome, "\nSobrenome: ", sobrenome, "\nIdade:", idade)


# Função com retorno do tipo int
def solicitar_idade() -> int:
    idade = 0
    eh_idade_valida = False
    while eh_idade_valida == False:
        try:
            idade = int(input("Digite a idade: "))

            if idade < 0:
                print("Idade deve ser entre maior ou igual a 0 anos")
            elif idade > 128:
                print("Idade deve ser entre menor ou igual a 128 anos")
            else:
                eh_idade_valida = True
        except Exception as e:
            print("Idade deve ser um número inteiro válido")
    return idade


# Função com retorno do tipo string
def solicitar_sobrenome() -> str:
    sobrenome = input("Digite o sobrenome: ").strip()
    while len(sobrenome) < 3 or len(sobrenome) > 100:
        print("Sobrenome deve conter no mínimo 3 caracteres e no máximo 100")
        sobrenome = input("Digite o sobrenome: ").strip()
    return sobrenome


# Função com retorno do tipo string
def solicitar_nome() -> str:
    nome = input("Digite o nome: ").strip()
    while len(nome) < 2 or len(nome) > 50:
        print("Nome deve conter no mínimo 2 caracteres e no máximo 50")
        nome = input("Digite o nome: ").strip()
    return nome



if __name__ == "__main__":
    exemplo_funcao()