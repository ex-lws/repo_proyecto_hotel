# Módulo para conectarse a la base de datos de PSQL
# Versión 1.0
# Fecha: 04/10/2024
# Autor: Palacios Cantú José Jair 

import psycopg2

def conectar_bd():
    try:
        conexion = psycopg2.connect(
            host="localhost",
            database="bd",
            user="postgres",
            password="admin",
            port = "5432" 
        )
        return conexion
    except Exception as e:
        print("Error al conectar a la base de datos:", e)
        return None
