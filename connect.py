import mysql.connector

cnx = mysql.connector.connect(user="tecmysql", password="devmysql", host="localhost", database="rafaelanao")
cursor = cnx.cursor()
# Obter a lista de tabelas
cursor.execute("SHOW TABLES")
tabelas = cursor.fetchall()

campos_das_tabelas = {}

for tabela in tabelas:
    cursor.execute("SHOW TABLES")
    tabelas = cursor.fetchall()  # Recupera todas as tabelas

    campos_das_tabelas = {}  # Dicionário para armazenar tabelas e seus campos

    # Itera sobre cada tabela e obtém seus campos
    for tabela in tabelas:
        nome_tabela = tabela[0]  # Nome da tabela
        cursor.execute(f"SHOW COLUMNS FROM {nome_tabela}")  # Obtém as colunas da tabela
        campos = cursor.fetchall()  # Recupera todos os campos da tabela
        campos_das_tabelas[nome_tabela] = [campo[0] for campo in campos]
