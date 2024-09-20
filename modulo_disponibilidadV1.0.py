#Módulo para indicar la disponibilidad de una habitación 
#Versión 1.0
#Autor: José Jair Palacios Cantú

#Correciones:
#Fecha: 16/09/2024

#Estados disponibles: Disponible, Ocupada, En mantenimiento, Fuera de serivicio.

#Descripción de estados:

#Disponible: Indica que una habitación está en óptimas condiciones para ser reservada por el húesped
#Ocupada: Indica que una habitación se encuentra reservada por algún húesped
#En mantenimiento: Indica que una habitación se encuentra en proceso de limpieza y pronto estará disponible
#Fuera de servicio: Indica que una habitación no se encuentra disponible para reservación ni para mantenimiento. Su disponibilidad es indefinida.

estados_habitacion = ['Disponible', 'Ocupada', 'En mantenimiento', 'Fuera de servicio']

for estado in estados_habitacion:
    print (estado.title())
print ('Cantidad de estados para las habitaciones: ' + str(len(estados_habitacion)))