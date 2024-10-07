from typing import List
from banco_dados import conectar
from entidades import Proprietario

def obter_todos_proprietarios() -> List[Proprietario]:
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("SELECT id, nome, cpf_cnpj, data_nascimento, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento FROM proprietarios")
    registros = cursor.fetchall()
    conexao.close()

    proprietarios : List[Proprietario] = []
    for registro in registros:
        id = registro[0]
        nome = registro[1]
        cpf_cnpj = registro[2]
        data_nascimento = registro[3]
        email = registro[4]
        celular = registro[5]
        estado = registro[6]
        cidade = registro[7]
        bairro = registro[8]
        logradouro = registro[9]
        cep = registro[10]
        numero = registro[11]
        complemento = registro[12]

        proprietario = Proprietario(id, nome, cpf_cnpj, data_nascimento, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento)
        proprietarios.append(proprietario)
    return proprietarios



def cadastrar(nome, cpf_cnpj, data_nascimento, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO proprietarios (nome, cpf_cnpj, data_nascimento, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (nome, cpf_cnpj, str(data_nascimento), email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento))
    conexao.commit()
    conexao.close()


def atualizar(nome, cpf_cnpj, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("UPDATE proprietarios SET nome = %s, cpf_cnpj = %s, email = %s, celular = %s, estado = %s, cidade = %s, bairro = %s, logradouro = %s, cep = %s, numero = %s, complemento = %s", (nome, cpf_cnpj, email, celular, estado, cidade, bairro, logradouro, cep, numero, complemento))
    conexao.commit()
    conexao.close()



def apagar(id: int):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute("DELETE FROM proprietarios WHERE id = %s", (id,))
    conexao.commit()
    conexao.close()