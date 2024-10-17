# Guardar la opción del usuario
# Versión 1.0
# Fecha: 04/10/2024
# Autor: Lopez Buelna Angel Gusatavo

def opcionUsuario():
    while True:
        try:
            #Guardar la selección del usuario
            opcion_usuario = int(input("Seleccione una opción del 0 - 6: "))
            print("Usted seleccionó: " + str(opcion_usuario))
            return opcion_usuario
            #En caso de que no seleccioné algún valor númerico
        except ValueError:
            print("Por favor, introduzca un número válido entre 0 y 6.")