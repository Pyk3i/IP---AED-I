import math

# EJERCICIO 1
def imprimir_hola_mundo():
    return print("Hola Mundo")

#def imprimir_un_verso(x):

def raizDe2():
    return round(math.sqrt(2), 4)

def factorial_de_dos():
    return math.factorial(2)

def problema_perimetro():
    return math.pi * 2

# EJERCICIO 2

def imprimir_saludo(nombre):
    return print("Hola",nombre)

def raiz_cuadrada_de(numero):
    return print(math.sqrt(numero))

def fahrenheit_a_celsius(temp_fahr):
    return print(((temp_fahr - 32)*5)/9)

def imprimir_dos_veces(estribillo):
    return print(estribillo*2)

def es_multiplo_de(n: int, m: int) -> bool:
    return (n % m) == 0

def esPar(numero: int) -> bool:
    return (es_multiplo_de(numero, 2))

def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    #Pizza = 8 porciones,
    return math.ceil((comensales*min_cant_de_porciones)/8)

# EJERCICIO 3
def alguno_es_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 or numero2 == 0

def ambos_son_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 and numero2 == 0

def es_nombre_largo(nombre: str) -> bool:
    return 3 <= len(nombre) and len(nombre) <= 8

def es_bisiesto(año: int) -> bool:
    return (año % 4) == 0 and (año % 100) != 0

# EJERCICIO 4
def peso_pino(tamaño: int) -> int:
    if tamaño <= 300:
        return tamaño * 3
    else:
        return 300*3 + (tamaño-300)*2
def es_peso_util(peso_pino: int) -> bool:
    return 400 <= peso_pino and peso_pino <=1000

def sirve_pino(tamaño_pino: int) -> bool:
    return es_peso_util(peso_pino(tamaño_pino))
  
#EJERCICIO 5
def devolverElDobleSiEsPar(numero: int) -> int:
    if (numero % 2) == 0:
        return numero*2
    else:
        return numero

def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if (numero % 2) == 0:
        return numero
    else:
        return numero + 1
    
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if numero % 9 == 0:
        return numero * 3
    elif numero % 3 == 0:
        return numero * 2
    else:
        return numero
    
def lindo_nombre(nombre: str) -> bool:
    if len(nombre) >= 5:
        return print("Tu nombre tiene muchas letras!")
    else:
        return print("Tu nombre tiene menos de 5 caracteres")
    
def vacaciones_o_trabajar(edad: int, sexo: str) -> str:
    if edad < 18 or (sexo == "F" and edad >= 65) or (sexo == "M" and edad >= 60):
        return print("Anda de vacaciones")
    else:
        return print("Anda a trabajar")

# EJERCICIO 6
def uno_al_diez() -> int:
    i = 1
    while i < 10:
        print(i)
        i = i + 1
    return print(i)

def pares_de_10_a_40() -> int:
    i = 2
    while i < 40:
        print (i)
        i = i + 2
    return print(i)

def eco():
    return "eco"*10

def cuentaRegresiva(numero: int):
    while numero > 1:
        print (numero)
        numero = numero - 1
    return print (numero, "\nDespegue")  

def viajeEnElTiempo (año_partida: int, año_llegada: int):
    while año_partida != año_llegada:
        print ("Viajó un año al pasado, estamos en el año: ", año_partida)
        año_partida = año_partida - 1
    return print("Viajó un año al pasado, estamos en el año: ", año_llegada)

def viajeEnElTiempoAC (año_partida: int):
    while año_partida > -384:
        if año_partida < 0:
            print("Viajó 20 años en el pasado, estamos en el año:", -año_partida, "a.C")
        else:
            print("Viajó 20 años en el pasado, estamos en el año:", año_partida, "D.C")
        año_partida = año_partida - 20
    return print("Llegamos a la época de Aristóteles, estamos en el año:", -año_partida, "a.C")

## EJERCICIO 7
def unoAlDiez():
    for i in range(1, 11, 1):
        print (i)
    return print()

def paresDiezACuarenta():
    for i in range(10, 41, 2):
        print(i)
    return print()

def ecoFor():
    for i in range(1, 10, 1):
        print ("eco")
    return print ("eco")
