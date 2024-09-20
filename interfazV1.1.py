#Lista de habitaciones en el hotel Kaligula - Interfaz
#Versión 1.1
#Fecha: 07/09/2024
#Autor: Ángel Gustavo Lopéz Buelna

#Correciones: Se agregó un botón para limpiar la información contenida en el diccionario original, además de diversos cambios en pro del despliegue de la información.

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
}

#Métodos para mostrar las habitaciones

def mostrar_habitaciones():
    

    for numero, detalles in lista_habitaciones.items():
        informacion = f'Número: {numero}\nTipo: {detalles['Tipo']}\nCaracterísticas: {', '.join(detalles['Características'])}\nPrecio: ${detalles['Precio']}\n'
        text_area.insert(tk.END, informacion + "\n")

def limpiar_texto():
    text_area.delete('1.0', tk.END)

#Ventana principal

ventana = tk.Tk()
ventana.title("Lista de Habitaciones")

#Botones

boton_mostrar = tk.Button(ventana, text="Mostrar Habitaciones", command=mostrar_habitaciones)
boton_mostrar.pack(pady=10)

boton_limpiar = tk.Button(ventana, text="Limpiar", command=limpiar_texto)
boton_limpiar.pack(pady=10)


#Área para mostrar la información del diccionario

text_area = tk.Text(ventana, width=50, height=20)
text_area.pack(pady=10)

#Bucle de tkinter

ventana.mainloop()
