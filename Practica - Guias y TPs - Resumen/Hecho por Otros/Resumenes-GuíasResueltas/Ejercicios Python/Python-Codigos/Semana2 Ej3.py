import datetime
class Alumno: 
    def __init__(self,nombre,dni,fecha_nacimiento):
        self.nombre=nombre
        self.dni=dni
        self.fecha_nacimiento=fecha_nacimiento
        

    def _calcular_edad(self) :
        hoy=datetime.date.today()
        return (hoy.year-self.fecha_nacimiento.year)-((self.fecha_nacimiento.month,self.fecha_nacimiento.day)>(hoy.month,hoy.day))
    
class Carrera:
    def __init__(self,nombre):
        self.nombre=nombre
        self.Alumnos=[]
        self.Inscripciones=[]
    def CargarAlumno(self,A1,fecha):
        self.Alumnos.append(A1)
        self.Inscripciones.append(fecha)
        
    def VerNombre(self):
        return self.nombre
    def MostrarAlumnos(self):
        print("Alumnos: ")
        for i in range(0,len(self.Alumnos)):
            print(f"{self.Alumnos[i].nombre}  -  {self.Inscripciones[i]}")
            
    
         
class Facultad():
    def __init__(self,nombre):
        self.nombre=nombre
        self.Carreras=[]
    def AgregarCarrera(self,Carrera1):
        self.Carreras.append(Carrera1)
    def MostrarCarrerasYAlumnos(self):
        print(f"Facultad: {self.nombre}")
        for i in self.Carreras:
            print(f"Carrera: {i.nombre}")
            i.MostrarAlumnos()
    
if (__name__ == "__main__"):
    
    A1=Alumno("Alumno1",45507817,datetime.date(2004,3,13))
    A2=Alumno("Alumno2",45503514,datetime.date(2004,1,2))
    C1=Carrera("Ingeniería en Informática")
    C2=Carrera("Ingeniería en Recursos Hídricos")
    C1.CargarAlumno(A1,datetime.date(2021,12,1))
    C1.CargarAlumno(A2,datetime.date(2021,12,3))
    F1=Facultad("FICH")
    F1.AgregarCarrera(C1)
    F1.AgregarCarrera(C2)
    F1.MostrarCarrerasYAlumnos() 
    