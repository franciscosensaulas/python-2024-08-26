def exemplo_vetor01():
    nomes = [] # Criado um vetor vazio
    nomes.append("Alex") # Adicionando o nome 'Alex' na posição 0 do vetor nomes
    nomes.append("Joares") # Adicionado na posição 1
    nomes.append("Charley") # Adicionado na posição 2
    nomes.append("Pablo") # Adicionado na posição 3

    nomes.remove("Pablo") # Remover o Pablo

    print(nomes)


def exemplo_vetor02():
    nomes = []
    sobrenomes = []
    idades = []

    # Solicitando os dados para o usuário
    for i in range(0, 3):
        nomes.append(input("Digite o nome: "))
        sobrenomes.append(input("Digite o sobrenome: "))
        idades.append(int(input("Digite a idade: ")))
    
    # Apresentar os dados dos vetores
    print("Alunos: ")
    for i in range(0, 3):
        print("Nome:", nomes[i], sobrenomes[i], "tem", idades[i], "anos")
    
    maior_idade = 0
    nome_maior_idade = ""
    for i in range(0, 3):
        idade = idades[i]
        if idade > maior_idade:
            maior_idade = idade
            nome_maior_idade = nomes[i]
    
    print("Nome maior idade: ", nome_maior_idade)
    print("Maior idade: ", maior_idade)



if __name__ == "__main__":
    exemplo_vetor02()