#Lista de habitaciones en el hotel Kaligula - Interfaz
#Versión 1.0
#Fecha: 06/09/2024
#Autor: Yancarlo Isaac Alegría Morga

#Correciones: 

import tkinter as tk
from tkinter import messagebox

#Lista de habitaciones con sus respectivas características. (VERSION 1.2)

lista_habitaciones = {
    'Habitacion 101': {
        'Tipo': 'Sencilla',
        'Caractersíticas': ['TV', 'Baño', 'Cama king'],
        'Precio': 450
    },
    
}

#Métodos para mostrar las habitaciones

def mostrar_habitaciones():
    

    for habitacion, detalles in lista_habitaciones.items():
        info = f"{habitacion}\nTipo: {detalles['Tipo']}\nCaracterísticas: {', '.join(detalles['Caractersíticas'])}\nPrecio: {detalles['Precio']}\n"
        text_area.insert(tk.END, info + "\n")

        
def limpiar_texto():
    text_area.delete('1.0', tk.END)

#Ventana principal

ventana = tk.Tk()
ventana.title("Lista de Habitaciones")

#Botones

boton_mostrar = tk.Button(ventana, text="Mostrar Habitaciones", command=mostrar_habitaciones)
boton_mostrar.pack(pady=10)


#Área para mostrar la información del diccionario

text_area = tk.Text(ventana, width=50, height=20)
text_area.pack(pady=10)

#Bucle de tkinter

ventana.mainloop()
