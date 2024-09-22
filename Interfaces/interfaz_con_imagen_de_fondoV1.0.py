#Lista de habitaciones en el hotel Kaligula - Interfaz con imagen
#Versión 1.0
#Fecha: 21/09/2024
#Autor: Guillermo Lopez Gonzalez

#Correciones: Primera versión

import tkinter as tk
from PIL import Image, ImageTk

#Creación de la ventana
ventana = tk.Tk()
ventana.title("Interfaz con Imagen de Fondo")
#El tamaño es de 800x600
ventana.geometry("800x600")

#Atributos de la libería PIL
imagen = Image.open("C:\\Users\\guich\\Downloads\\Imagen para interfaz - Lista de habitaciones.jpg")
imagen = imagen.resize((800, 600)) 
imagen_fondo = ImageTk.PhotoImage(imagen)

#Colocación mediante el objeto canvas
canvas = tk.Canvas(ventana, width=800, height=600)
canvas.pack(fill="both", expand=True)
canvas.create_image(0, 0, image=imagen_fondo, anchor="nw")

#Etiqueta encima de la imagen
label = tk.Label(ventana, text="Interfaz con imagen de fondo - Prueba 1", bg="white")
label_window = canvas.create_window(400, 300, anchor="center", window=label)

ventana.mainloop()
