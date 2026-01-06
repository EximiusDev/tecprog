class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad=edad
    def nom(self):
        return self.nombre
    def edad(self):
        return self.edad
# Completar
class Principal:
    def __init__(self):
        pass # Borrar y completar
    def ejecutar(self):
        p1=Persona("Manu",19)
        p2=Persona("Tomas",22)
        # Completar
        # Imprimir la identidad de los objetos
        print(f"Identidad de {p1.nom()}: {id(p1)}") # Completar
        print(f"Identidad de {p2.nom()} : {id(p2)}")
        # Verificar si los objetos son iguales
        if (p1 is p2):
            print("Tienen igual identidad")
        else: print("Tienen distinta identidad")            
if (__name__ == "__main__"):
    principal = Principal()
    principal.ejecutar()
