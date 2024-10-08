from typing import Optional
import questionary
from entidades import Marca, Modelo
from repositorios.marca_repositorio import obter_todas_marcas
from repositorios.modelo_repositorio import obter_modelos_filtrados_por_id_marca, obter_todos_modelos


def escolher_marca() -> Optional[Marca]:
    marcas = obter_todas_marcas()
    if len(marcas) == 0:
        print("Nenhuma marca cadastrada")
        return None
    
    opcoes_marcas_para_escolher = []
    for marca in marcas:
        opcao = questionary.Choice(marca.nome, marca)
        opcoes_marcas_para_escolher.append(opcao)
    
    marca_escolhida = questionary.select(
        "Escolha a marca", opcoes_marcas_para_escolher,
    ).ask()
    return marca_escolhida


def escolher_modelo_da_marca(id_marca: int) -> Optional[Modelo]:
    modelos = obter_modelos_filtrados_por_id_marca(id_marca)
    if len(modelos) == 0:
        print("Nenhum modelo cadastrado")
        return None
    
    opcoes_para_escolher = []
    for modelo in modelos:
        opcao = questionary.Choice(modelo.nome, modelo)
        opcoes_para_escolher.append(opcao)
    # Perguntar para o usuário qual o modelo que deseja apagar,
    # quando usuário escolher o modelo será armazenado o modelo
    modelo_escolhido = questionary.select(
        "Escolha o modelo", opcoes_para_escolher,
    ).ask()
    return modelo_escolhido