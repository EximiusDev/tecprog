segundos = int(input("Introduce el número de segundos: "))
horas = int(segundos/3600)
minutos = int((segundos-horas*3600)/60)
segundos = segundos - horas*3600 - minutos*60
print(horas,":",minutos,":",segundos)