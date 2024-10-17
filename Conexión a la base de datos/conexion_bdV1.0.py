# Main del sistema de gestión de habitaciones
# Versión 1.0
# Fecha: 04/10/2024
# Autor: Palacios Cantú José Jair 

import psycopg2
from datetime import datetime
import pytz

def insertar_datos(cliente, habitacion, reservacion, pago):
    cursor = None  # Inicializar cursor
    conn = None    # Inicializar conexión

    try:
        conn = psycopg2.connect(
            dbname='reservaciones',
            user='postgres',
            password='postgres',
            host='localhost'
        )
        cursor = conn.cursor()

        # Obtener la zona horaria para el timestamp with time zone
        tz = pytz.timezone('America/New_York')  # Cambia a tu zona horaria

        # Convertir las fechas
        fecha_reservacion = datetime.now(tz)  # timestamp with time zone
        fecha_pago = datetime.now(tz)  # timestamp with time zone

        # Convertir check_in y check_out a timestamp without time zone
        check_in = datetime.strptime(reservacion['check_in'], '%Y-%m-%d %H:%M:%S')
        check_out = datetime.strptime(reservacion['check_out'], '%Y-%m-%d %H:%M:%S')

        # Insertar datos en la tabla de cliente
        query_cliente = """
        INSERT INTO cliente (
            nombres, 
            apellido_materno, 
            apellido_paterno, 
            correo, 
            telefono, 
            direccion
        )
        VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_cliente;
        """
        cursor.execute(query_cliente, (
            cliente['nombres'],
            cliente['apellido_paterno'],
            cliente['apellido_materno'],
            cliente['correo'],
            cliente['telefono'],
            cliente['direccion']
        ))
        id_cliente = cursor.fetchone()[0]

        # Insertar datos en la tabla de habitacion
        query_habitacion = """
        INSERT INTO habitacion (
            numero_habitacion, 
            tipo_habitacion, 
            precio_noche, 
            estado
        )
        VALUES (%s, %s, %s, %s) RETURNING id_habitacion;
        """
        cursor.execute(query_habitacion, (
            habitacion['numero_habitacion'],
            habitacion['tipo_habitacion'],
            habitacion['precio_noche'],
            habitacion['estado']
        ))
        id_habitacion = cursor.fetchone()[0]

        # Insertar datos en la tabla de reservación
        query_reservacion = """
        INSERT INTO reservacion (
            check_in,
            check_out,
            fecha_reservacion,
            total,
            id_cliente,
            id_habitacion
        )
        VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_reservacion;
        """
        cursor.execute(query_reservacion, (
            check_in,  # timestamp without time zone
            check_out,  # timestamp without time zone
            fecha_reservacion,  # timestamp with time zone
            reservacion['total'],
            id_cliente,
            id_habitacion
        ))
        id_reservacion = cursor.fetchone()[0]

        # Insertar datos en la tabla de pago
        query_pago = """
        INSERT INTO pago (
            fecha_pago,
            monto_pagado,
            metodo_pago,
            id_reservacion
        )
        VALUES (%s, %s, %s, %s) RETURNING id_pago;
        """
        cursor.execute(query_pago, (
            fecha_pago,  # timestamp with time zone
            pago['monto_pagado'],
            pago['metodo_pago'],
            id_reservacion  # Asegúrate de pasar id_reservacion aquí
        ))

        id_pago = cursor.fetchone()[0]

        # Guardar cambios
        conn.commit()
        print("Cliente, habitación, reservación y pago insertados con éxito.")
        
    except Exception as e:
        print(f"Ocurrió un error: {e}")
        conn.rollback()  # Deshacer cambios en caso de error
    finally:
        if cursor:
            cursor.close()  # Asegúrate de cerrar el cursor solo si está abierto
        if conn:
            conn.close()  # Asegúrate de cerrar la conexión solo si está abierta
