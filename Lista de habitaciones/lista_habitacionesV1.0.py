#Lista de habitaciones en el hotel Kaligula 
#Versión 1.0
#Fecha: 01/09/2024
#Autor: José Jair Palacios Cantú

#Número de habitación = key
#Tipo de habitación = value

lista_habitaciones = {
    'Habitacion 101' : 'Sencilla',
    'Habitacion 102' : 'Sencilla',
    'Habitacion 103' : 'Sencilla',
    'Habitacion 104' : 'Sencilla',
    'Habitacion 105' : 'Doble',
    'Habitacion 106' : 'Doble',
    'Habitacion 201' : 'Triple',
    'Habitacion 202' : 'Triple',
    'Habitacion 203' : 'Triple',
    'Habitacion 204' : 'Cuadruple',
    'Habitacion 205' : 'Cuadruple',
    'Habitacion 206' : 'Cuadruple',
    'Habitacion 301' : 'Familiar',
    'Habitacion 302' : 'Familiar',
    'Habitacion 303' : 'Familiar',
    'Habitacion 304' : 'Suite',
    'Habitacion 305' : 'Suite',
    'Habitacion 306' : 'Suite',
}

#Mostrar las habitaciones disponibles en el hotel Kaligula

for key, values in lista_habitaciones.items():
    print (f'Número de habitación: {key}, Tipo de habitación: {values}')
