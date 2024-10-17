#Recoger datos a la base de datos 
#Versión 1.0
#Fecha: 11/10/2024
#Autor: Lopez Gonzalez Guillermo

def mostrar_instrucciones_reservacion():
    print ("==================")
    print ("Ingresa los siguientes datos:")
    print ("==================")

def recoger_datos():
    # Información necesaria para generar un reporte de reservación:

    # Recoger información del cliente
    print("--Información del cliente--")
    nombres_cliente = input("Nombre o nombres del cliente: ")
    apellido_paterno_cliente = input("Apellido paterno del cliente: ")
    apellido_materno_cliente = input("Apellido materno del cliente: ")
    correo_cliente = input("Correo electrónico del cliente: ")
    telefono_cliente = input("Teléfono del cliente: ")
    direccion_cliente = input("Dirección de cliente: ")

    # Recoger información de la habitación
    print("--Información de la habitación--")
    numero_habitacion = input("Número de habitación: ")
    tipo_habitacion = input("Tipo de la habitación: ")
    precio_noche_habitacion = input("Precio por noche: ")
    estado_habitacion = input("Disponibilidad: ")

    # Recoger información sobre la reservación
    print("Información propia del reporte--")
    check_in = input("Fecha de check in: ")
    check_out = input("Fecha de check out: ")
    fecha_reservacion = input("Fecha de reservación: ")
    precio_total = input("Monto total: ")

    # Recoger información sobre el método de pago
    fecha_pago = input("Fecha de pago: ")
    monto_pagado = input("Monto abonado: ")
    metodo_pago = input("Método de pago: ")

    #Retornamos los datos guardados con diccionarios dentro de diccionarios
    
    return {
        'cliente': {
            'nombres': nombres_cliente,
            'apellido_paterno': apellido_paterno_cliente,
            'apellido_materno': apellido_materno_cliente,
            'correo': correo_cliente,
            'telefono': telefono_cliente,
            'direccion': direccion_cliente
        },
        'habitacion': {
            'numero_habitacion': numero_habitacion,
            'tipo_habitacion': tipo_habitacion,
            'precio_noche': precio_noche_habitacion,
            'estado': estado_habitacion
        },
        'reservacion': {
            'check_in': check_in,
            'check_out': check_out,
            'fecha_reservacion': fecha_reservacion,
            'total': precio_total
        },
        'pago': {
            'fecha_pago': fecha_pago,
            'monto_pagado': monto_pagado,
            'metodo_pago': metodo_pago
        }
    }
