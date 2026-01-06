class Estudiante:
    def __init__(self,nombre,edad,grado) :
        self.nombre=nombre
        self.edad=edad
        self.grado=grado
    def Estudiar(self):
        print(f"El estudiante {self.nombre} está estudiando")
        
nombre=(input("Ingrese su nombre "))
edad=(input("Ingrese su edad "))
grado=(input("Ingrese su grado "))

E1=Estudiante(nombre,edad,grado)
accion=input()
if(accion.lower()=="estudiar"):
    E1.Estudiar()