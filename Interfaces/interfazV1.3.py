#Lista de habitaciones en el hotel Kaligula - Interfaz
#Versión 1.2
#Fecha: 08/09/2024
#Autor: Luis Alberto Reyes Cruz

#Correciones: Cambios realizados en la tipografía, en pro de mejor legibilidad. Arial 12

import tkinter as tk
from tkinter import messagebox

#Lista de habitaciones con sus respectivas características. (VERSION 1.2)

lista_habitaciones = {

    'Habitacion 101' : {
        'Tipo' : 'Sencilla', 
        'Características' : ['TV', 'Baño', 'Cama king'], 
        'Precio' : 450},

    'Habitacion 102' : {
        'Tipo' : 'Sencilla', 
        'Características' : ['TV', 'Baño', 'Cama queen'], 
        'Precio' : 400},

    'Habitacion 103' : {
        'Tipo' : 'Sencilla', 
        'Características' : ['TV', 'Baño', 'Cama individual'], 
        'Precio' : 350},

    'Habitacion 104' : {
        'Tipo' : 'Sencilla', 
        'Características' : ['TV', 'Baño', 'Cama individual'], 
        'Precio' : 350},

    'Habitacion 105' : {
        'Tipo' : 'Doble', 
        'Características' : ['TV', 'Baño amplio', 'Comedor', 'Dos camas king', 'Wi-Fi'], 
        'Precio' : 850},

    'Habitacion 106' : {
        'Tipo' : 'Doble', 
        'Características' : ['TV', 'Baño amplio', 'Comedor', 'Dos camas individuales', 'Wi-Fi'], 
        'Precio' : 830},

    'Habitacion 201' : {
        'Tipo' : 'Suite', 
        'Características' : ['TV grande', 'Jacuzzi', 'Comedor','Cama king y sofá cama', 'Wi-Fi', 'Sistema de sonido'], 
        'Precio' : 1600},

    'Habitacion 202' : {
        'Tipo' : 'Suite', 
        'Características' : ['TV grande', 'Jacuzzi', 'Comedor','Cama queen y sofá cama', 'Wi-Fi', 'Sistema de sonido'], 
        'Precio' : 1500},

    'Habitacion 203' : {
        'Tipo' : 'Suite', 
        'Características' : ['TV grande', 'Jacuzzi', 'Comedor','Cama individual y sofá cama', 'Wi-Fi', 'Sistema de sonido'], 
        'Precio' : 1400},

    'Habitacion 204' : {
        'Tipo' : 'Familiar', 
        'Características' : ['TV grande', 'Baño amplio', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
        'Precio' : 1700},

    'Habitacion 205' : {
        'Tipo' : 'Familiar', 
        'Características' :  ['TV grande', 'Jacuzzi', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'],
        'Precio' : 1800},

    'Habitacion 206' : {
        'Tipo' : 'Familiar', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Dos camas individuales' , 'Wi-Fi', 'Sistema de sonido', 'Juegos de actividades para niños'], 
        'Precio' : 1900},

    'Habitacion 301' : {
        'Tipo' : 'Deluxe', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'], 
        'Precio' : 2600},

    'Habitacion 302' : {
        'Tipo' : 'Deluxe', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama queen' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'], 
        'Precio' : 2500},

    'Habitacion 303' : {
        'Tipo' : 'Deluxe', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama queen' , 'Wi-Fi', 'Sistema de sonido', 'Mini bar', 'Calefacción'],
        'Precio' : 2500},

    'Habitacion 304' : {
        'Tipo' : 'Suite precidencial', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'],
        'Precio' : 3400},

    'Habitacion 305' : {
        'Tipo' : 'Suite precidencial', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'], 
        'Precio' : 3400},

    'Habitacion 306' : {
        'Tipo' : 'Suite precidencial', 
        'Características' : ['TV grande', 'Jacuzzi y baño', 'Comedor','Cama king' , 'Wi-Fi de alta velocidad', 'Sistema de sonido premium', 'Mini bar', 'Calefacción', 'Balcón'], 
        'Precio' : 3400},

}

#Métodos para mostrar las habitaciones

def mostrar_habitaciones():
    

    for numero, detalles in lista_habitaciones.items():
        informacion = f'Número: {numero}\nTipo: {detalles['Tipo']}\nCaracterísticas: {', '.join(detalles['Características'])}\nPrecio: ${detalles['Precio']}\n'
        text_area.insert(tk.END, informacion + "\n", "Estilo")

def limpiar_texto():
    text_area.delete('1.0', tk.END)

#Ventana principal

ventana = tk.Tk()
ventana.title("Lista de Habitaciones")

#Botones

boton_mostrar = tk.Button(ventana, text="Mostrar habitaciones", command=mostrar_habitaciones)
boton_mostrar.pack(pady=10)

boton_limpiar = tk.Button(ventana, text="Limpiar", command=limpiar_texto)
boton_limpiar.pack(pady=10)


#Área para mostrar la información del diccionario

text_area = tk.Text(ventana, width=50, height=20)
text_area.pack(pady=10)

#Estilo


text_area.tag_configure("Estilo", font=("Arial", 12))

#Bucle de tkinter

ventana.mainloop()
