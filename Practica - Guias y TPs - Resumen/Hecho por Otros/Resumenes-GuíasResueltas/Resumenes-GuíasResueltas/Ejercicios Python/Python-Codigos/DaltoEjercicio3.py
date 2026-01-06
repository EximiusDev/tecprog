class Animal():
    def Comer(self):
        print("El animal está comiendo...")
        
class Mamifero(Animal):
    def Amamantar(self):
        print("El animal está tomando la teta")

class Ave(Animal):
    def Volar(self):
        print("El animal está volando")

class Murcielago(Mamifero,Ave):
    pass

M=Murcielago()
M.Comer()
M.Amamantar()
M.Volar()
print(Murcielago.mro())