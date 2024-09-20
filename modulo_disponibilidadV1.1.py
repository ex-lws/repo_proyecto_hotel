#Módulo para indicar la disponibilidad de una habitación 
#Versión 1.0

#Correciones: Se agregaron las habitaciones con las que cuenta el hotel, ademas del total de las mismas
#Fecha: 17/09/2024
#Autor: Yancarlo Isaac Alegría Morga

#Estados disponibles: Disponible, Ocupada, En mantenimiento, Fuera de serivicio.

#Descripción de estados:

#Disponible: Indica que una habitación está en óptimas condiciones para ser reservada por el húesped
#Ocupada: Indica que una habitación se encuentra reservada por algún húesped
#En mantenimiento: Indica que una habitación se encuentra en proceso de limpieza y pronto estará disponible
#Fuera de servicio: Indica que una habitación no se encuentra disponible para reservación ni para mantenimiento. Su disponibilidad es indefinida.

estados_habitacion = [
    'Disponible', 
    'Ocupada', 
    'En mantenimiento', 
    'Fuera de servicio'
    ]

numeros_habitaciones = [
    101, 102, 103, 104, 105, 106,
    201, 202, 203, 204, 205, 206,
    301, 302, 303, 304, 305, 306,
    ]

for estado in estados_habitacion:
    print (estado.title())
print ('Cantidad de estados para las habitaciones: ' + str(len(estados_habitacion)))

for numero in numeros_habitaciones:
    print ('Número de habitación: ' + str(numero))
print ('La cantidad de habitaciones que tiene el hotel es de: ' + str(len(numeros_habitaciones)))