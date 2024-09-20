#Lista de habitaciones en el hotel Kaligula 
#Versión 1.2
#Fecha: 02/09/2024
#Autor: Ángel Gustavo Lopéz Buelna

#Correciones: Cambios a la estructura del diccionarios de habitaciones, se colcoaron diccionarios por cada habitación para almacenar características y precios
#Se agregaron los precios correspondientes de cada habitación y sus respectivas características.

#Número de habitación = numero
#Tipo de habitación = tipo

lista_habitaciones = {

    'Habitacion 101' : {
        'Tipo:' : 'Sencilla', 
        'Caractersíticas' : ['TV', 'Baño', 'Cama king'], 
        'Precio' : 450},

    'Habitacion 102' : {
        'Tipo:' : 'Sencilla', 
        'Caractersíticas' : ['TV', 'Baño', 'Cama queen'], 
        'Precio' : 400},

    'Habitacion 103' : {
        'Tipo:' : 'Sencilla', 
        'Caractersíticas' : ['TV', 'Baño', 'Cama individual'], 
        'Precio' : 350},

    'Habitacion 104' : {
        'Tipo:' : 'Sencilla', 
        'Caractersíticas' : ['TV', 'Baño', 'Cama individual'], 
        'Precio' : 350},

    'Habitacion 105' : {
        'Tipo:' : 'Doble', 
        'Caractersíticas' : ['TV', 'Baño amplio', 'Comedor', 'Dos camas king', 'Wi-Fi'], 
        'Precio' : 850},

    'Habitacion 106' : {
        'Tipo:' : 'Doble', 
        'Caractersíticas' : ['TV', 'Baño amplio', 'Comedor', 'Dos camas individuales', 'Wi-Fi'], 
        'Precio' : 830},

    'Habitacion 201' : {
        'Tipo:' : 'Suite', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi', 'Comedor','Cama king y sofá cama', 'Wi-Fi', 'Sistema de sonido'], 
        'Precio' : 1600},

    'Habitacion 202' : {
        'Tipo:' : 'Suite', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi', 'Comedor','Cama queen y sofá cama', 'Wi-Fi', 'Sistema de sonido'], 
        'Precio' : 1500},

    'Habitacion 203' : {
        'Tipo:' : 'Suite', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi', 'Comedor','Cama individual y sofá cama', 'Wi-Fi', 'Sistema de sonido'], 
        'Precio' : 1400},

    'Habitacion 204' : {
        'Tipo:' : 'Familiar', 
        'Caractersíticas' : ['TV grande', 'Baño amplio', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
        'Precio' : 1700},

    'Habitacion 205' : {
        'Tipo:' : 'Familiar', 
        'Caractersíticas' :  ['TV grande', 'Jacuzzi', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
        'Precio' : 1800},

    'Habitacion 206' : {
        'Tipo:' : 'Familiar', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'], 
        'Precio' : 1900},

    'Habitacion 301' : {
        'Tipo:' : 'Deluxe', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'], 
        'Precio' : 2600},

    'Habitacion 302' : {
        'Tipo:' : 'Deluxe', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama queen' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'], 
        'Precio' : 2500},

    'Habitacion 303' : {
        'Tipo:' : 'Deluxe', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama queen' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'],
        'Precio' : 2500},

    'Habitacion 304' : {
        'Tipo:' : 'Suite precidencial', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'],
        'Precio' : 3400},

    'Habitacion 305' : {
        'Tipo:' : 'Suite precidencial', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'], 
        'Precio' : 3400},

    'Habitacion 306' : {
        'Tipo:' : 'Suite precidencial', 
        'Caractersíticas' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'], 
        'Precio' : 3400},

}

#Mostrar todas las habitaciones disponibles en el hotel Kaligula

for numero, tipo in lista_habitaciones.items():
    print (f'Número: {numero}, Características y precio: {tipo}')
