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


class Cor:
    def __init__(self, id: int, nome: str):
        self.id = id
        self.nome = nome

        
class Proprietario:
    def __init__(self, id: int, nome: str, cpf_cnpj: str, data_nascimento: str, email: str,
                celular: str, estado: str, cidade: str, bairro: str, logradouro: str,
                cep: str, numero: str, complemento: str):
        self.id = id
        self.nome = nome
        self.cpf_cnpj = cpf_cnpj
        self.data_nascimento = data_nascimento
        self.email = email
        self.celular = celular
        self.estado = estado
        self.cidade = cidade
        self.bairro = bairro
        self.logradouro = logradouro
        self.cep = cep
        self.numero = numero
        self.complemento = complemento


class Versao:
    def __init__(self, id: int, modelo: Modelo, nome: str, motor: str) -> None:
        self.id = id
        self.modelo = modelo
        self.nome = nome
        self.motor = motor


class Veiculo:
    def __init__(
        self, 
        id: int, 
        proprietario: Proprietario, 
        versao: Versao,
        cor: Cor, 
        preco_inicial: float,
        preco_fipe: float,
        km: int,
        chassi: str,
        placa: str,
        renavam: str,
        ano_fabricacao: int,
        ano_modelo: int,
        novo: bool,
    ):
        self.id = id
        self.proprietario = proprietario
        self.versao = versao
        self.cor = cor
        self.preco_inicial = preco_inicial
        self.preco_fipe = preco_fipe
        self.km = km
        self.chassi = chassi
        self.placa = placa
        self.renavam = renavam
        self.ano_fabricacao = ano_fabricacao
        self.ano_modelo = ano_modelo
        self.novo = novo
