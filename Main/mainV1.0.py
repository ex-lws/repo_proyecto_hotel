#Main del sistema de gestión de habitaciones
#Versión 1.0
#Fecha: 04/10/2024
#Autor: Reyes Cruz Luis Alberto

#Correciones: 


#Modulos
from menu import mostrarOpciones
from opcion_usuario import opcionUsuario
#from lista_habitaciones import mostrarHabitaciones

#Funciones importadas

mostrarOpciones()
opcion_usuario = opcionUsuario()
print (opcion_usuario)

if (opcion_usuario == 1):
    print ("Opción 1.")