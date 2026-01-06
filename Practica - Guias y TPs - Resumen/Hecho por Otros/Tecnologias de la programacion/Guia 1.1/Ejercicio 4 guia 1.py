import math
peso = float(input("Introduce tu peso en kilogramos: "))
altura = float(input("Introduce tu altura en metros: "))
indice = peso/math.pow(altura,2)
if (indice<18.5):
    print(indice, ", Peso inferior al normal")
elif(18.5<=indice<25):
    print(indice, ", Normal")
elif(25<=indice<30):
    print(indice, ", Peso superior al normal")
else:
    print(indice, ", Obesidad")
