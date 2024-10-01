class Marca:
    def __init__(self, id: int, nome: str, cnpj: str):
        self.id = id
        self.nome = nome        
        self.cnpj = cnpj


class Modelo:
    def __init__(self, id: int, id_marca: int, nome: str):
        self.id = id
        self.id_marca = id_marca
        self.nome = nome