#Lista de habitaciones en el hotel Kaligula 
#Versión 1.1
#Fecha: 01/09/2024
#Autor. Luis Alberto Reyes Cruz

#Correciones: Cambios a la estructura del ciclo for, especificamente los keys and values
#Se agregaron más carácterísticas a las habitaciones mediantes listas dentro de los diccionarios

#Número de habitación = numero
#Tipo de habitación = tipo

lista_habitaciones = {
    'Habitacion 101' : ['Sencilla', 'TV', 'Baño', 'Cama king'],
    'Habitacion 102' : ['Sencilla', 'TV', 'Baño', 'Cama queen'],
    'Habitacion 103' : ['Sencilla', 'TV', 'Baño', 'Cama individual'],
    'Habitacion 104' : ['Sencilla', 'TV', 'Baño', 'Cama individual'],
    'Habitacion 105' : ['Doble', 'TV', 'Baño amplio', 'Comedor', 'Dos camas king', 'Wi-Fi'],
    'Habitacion 106' : ['Doble', 'TV', 'Baño amplio', 'Comedor', 'Dos camas individuales', 'Wi-Fi'],
    'Habitacion 201' : ['Suite', 'TV grande', 'Jacuzzi', 'Comedor','Cama king y sofá cama', 'Wi-Fi', 'Sistema de sonido'],
    'Habitacion 202' : ['Suite', 'TV grande', 'Jacuzzi', 'Comedor','Cama queen y sofá cama', 'Wi-Fi', 'Sistema de sonido'],
    'Habitacion 203' : ['Suite', 'TV grande', 'Jacuzzi', 'Comedor','Cama individual y sofá cama', 'Wi-Fi', 'Sistema de sonido'],
    'Habitacion 204' : ['Familiar', 'TV grande', 'Baño amplio', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
    'Habitacion 205' : ['Familiar', 'TV grande', 'Baño amplio', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
    'Habitacion 206' : ['Familiar', 'TV grande', 'Baño amplio', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
    'Habitacion 301' : ['Deluxe', 'TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'],
    'Habitacion 302' : ['Deluxe', 'TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'],
    'Habitacion 303' : ['Deluxe', 'TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'],
    'Habitacion 304' : ['Suite precidencial', 'TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'],
    'Habitacion 305' : ['Suite precidencial', 'TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'],
    'Habitacion 306' : ['Suite precidencial', 'TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'],
}

#Mostrar las habitaciones disponibles en el hotel Kaligula

for numero, tipo in lista_habitaciones.items():
    print (f'Número de habitación: {numero}, Tipo de habitación: {tipo}')
