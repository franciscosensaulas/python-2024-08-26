class Marca:
    def __init__(self, id: int, nome: str, cnpj: str):
        self.id = id
        self.nome = nome        
        self.cnpj = cnpj


class Modelo:
    def __init__(self, id: int, marca: Marca, nome: str):
        self.id = id
        self.marca = marca
        self.nome = nome
