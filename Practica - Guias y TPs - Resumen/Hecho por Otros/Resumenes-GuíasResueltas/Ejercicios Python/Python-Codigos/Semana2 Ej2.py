import datetime
class Persona:
    def __init__(self, nombre, apellido, fecha_nacimiento):
        self.nombre=nombre
        self.apellido=apellido
        self.fecha_nacimiento=fecha_nacimiento
        ...
    def mostrar(self):
        print(f"{self.nombre} {self.apellido} tiene {self._calcular_edad()} ")
    def _calcular_edad(self) :
        hoy=datetime.date.today()
        return (hoy.year-self.fecha_nacimiento.year)-((self.fecha_nacimiento.month,fecha_nacimiento.day)>(hoy.month,hoy.day))
        

if (__name__ == "__main__"):
    fecha_nacimiento=datetime.date(2004,3,29)
    P1=Persona("Joaco","Cornalis",fecha_nacimiento)
    P1.mostrar()