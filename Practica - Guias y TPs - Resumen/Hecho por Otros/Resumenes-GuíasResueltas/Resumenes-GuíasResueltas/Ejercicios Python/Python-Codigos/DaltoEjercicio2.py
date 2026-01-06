class Persona:
    def __init__(self,nombre,edad):
        self.nombre=nombre
        self.edad=edad
    def VerNombre(self):
        return self.nombre
    def VerEdad(self):
        return self.edad

class Estudiante(Persona):
    def __init__(self,nombre,edad,grado):
        super().__init__(nombre,edad)
        self.grado=grado
    def VerGrado(self):
        return self.grado
    
E1=Estudiante("Carlos",18,"2do") 
print(f"El estudiante {E1.VerNombre()} de {E1.VerEdad()} años se encuentra en el {E1.VerGrado()} año de la carrera")