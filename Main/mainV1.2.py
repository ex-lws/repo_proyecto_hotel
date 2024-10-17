# Main del sistema de gestión de habitaciones
# Versión 1.0
# Fecha: 04/10/2024
# Autor: Reyes Cruz Luis Alberto

from lista_habitaciones import mostrarHabitaciones
from menu import mostrarOpciones
from opcion_usuario import opcionUsuario
from reservacion import mostrar_instrucciones_reservacion
from reservacion import recoger_datos
from conexion_bd import insertar_datos
from estado_habitacion import menu_disponibilidad


def main():

    #Funciones importadas
    while True:
        mostrarOpciones()
        opcion_usuario = opcionUsuario()

        #Operaciones

        if opcion_usuario == 0:
            print ("--Su objetivo es realizar las reservaciones que el húesped solicita.--")

        elif opcion_usuario == 1:
            print("--Mostrando habitaciones.--")
            mostrarHabitaciones()

        elif opcion_usuario == 2:
            print("--Entrando al menu de consulta de disponibilidad de las habitaciones.--")
            menu_disponibilidad()

        elif opcion_usuario == 3:
            print("--Iniciando reporte de reserveación.--")
            mostrar_instrucciones_reservacion()
            datos_reservacion = recoger_datos()
            print(datos_reservacion)
            insertar_datos(datos_reservacion['cliente'], datos_reservacion['habitacion'], datos_reservacion['reservacion'], datos_reservacion['pago'])
        
        elif opcion_usuario == 4:
            print("--Mostrando los reportes de reservación.--")
        
        elif opcion_usuario == 5:
            print("--Mostrando estadísticas operacionales.--")    
        
        elif opcion_usuario == 6:
            print("--Saliendo del sistema...--")
            break

main()