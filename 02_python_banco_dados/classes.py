from typing import List


# O que é uma classe: classe é uma forma de representar uma coisa do mundo real em um objeto
class Pessoa:
    # nome e id são parâmetros

    # __init__ é o que chamamos de construtor, tem como objetivo construir
    # um objeto com os dados necessários para o funcionamento correto
    def __init__(self, id: int, nome: str):
        # proprieades da classe 
        self.id = id
        self.nome = nome
        self.altura = 0.0
        self.idade = 0
        self.peso = 0.0


# https://dontpad.com/franciscosensaulas/python
class Produto:
    def __init__(self, id: int, nome: str, preco_unitario: float, quantidade: int):
        self.id = id
        self.nome = nome
        self.preco_unitario = preco_unitario
        self.quantidade = quantidade


def exemplo_com_lista_de_objetos():
    # criando uma lista de produtos, que será armazenado os objetos da classe Produto
    produtos: List[Produto] = []

    # instanciando um objeto de Produto chamado play_station 
    play_station = Produto(1, "PlayStation 5 Pro", 6999.99, 1)
    # Adicionar o produto na lista de produtos
    produtos.append(play_station)

    xbox_series_x = Produto(2, "Xbox Series X", 3500, 2)
    produtos.append(xbox_series_x)

    # for i in range(0, len(produtos)):
    #     produto = produtos[i]
    #     print(produto.nome)
    # Percorrendo a lista de produtos para apresentar
    for produto in produtos:
        total_produto = produto.preco_unitario * produto.quantidade
        print(produto.nome, total_produto)

# Criar uma classe chamada Aluno com id, nome, nota 1, nota2 e nota3
# Criar uma lista que contenha 3 alunos
# Apresentar o nome de cada aluno, média e se está aprovado ou não


def exemplo_com_classe():
    # instanciando um objeto chamado batatinha da classe Pessoa
    francisco = Pessoa(1, "Francisco")
    # Definindo o valor para a propriedade altura que pertence ao objeto francisco
    francisco.altura = 1.72
    francisco.peso = 120
    francisco.idade = 30
    print(f"Id: {francisco.id}")
    print(f"Nome: {francisco.nome}")
    print(f"Altura: {francisco.altura}")
    print(f"Peso: {francisco.peso}")
    print(f"Idade: {francisco.idade}\n")

    william = Pessoa(2, "William")
    print(f"Id: {william.id}")
    print(f"Nome: {william.nome}")
    print(f"Altura: {william.altura}")
    print(f"Peso: {william.peso}")
    print(f"Idade: {william.idade}")


if __name__ == "__main__":
    exemplo_com_lista_de_objetos()
