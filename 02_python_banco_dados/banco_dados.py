import mysql.connector


def conectar():
    conexao = mysql.connector.connect(
        # 127.0.0.1 (localhost) na nossa máquina, na máquina do DEV
        host="127.0.0.1", 
        port=3306,
        user="root",
        password="root",
        database="dev_motors"
    )
    return conexao
