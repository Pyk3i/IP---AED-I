## GUIA 7
import math
import random
import numpy as np

## PARTE 1
## EJ 1

def pertenece (elemento: int, lista: list[int]) -> bool:
##    return elemento in lista
    for i in range(0, len(lista) + 1, 1):
        if elemento == lista[i]:
            return True
        elif (i+1) == len(lista):
            return False

## EJ 2        
def divideATodos(s: list[int], e: int) -> bool:
    for i in range(0, len(s), 1):
        if s[i] / e != math.floor(s[i] / e):
            return False
        elif i == len(s):
            return True

## EJ 3        
def sumaTotal(s: list[int]) -> int:
    x = 0
    for i in range(0, len(s) + 1, 1):
        x = x + s[i]
        if (i+1) == len(s):
            return x

## EJ 4
def ordenados(s: list[int]) -> bool:
    for i in range(len(s)):
        if i == len(s) - 1:
            return True
        elif s[i] > s[i+1]:
            return False

## EJ 5
def longitud7(p: list[str]) -> bool:
    for i in range(0, len(p), 1):
        if len(p[i]) > 7:
            return True
        elif i == len(p):
            return False

## EJ 6
def esPalindromo(frase: str) -> bool:
    return frase[len(frase): 0: -1] + frase[0] == frase

## EJ 7 
def fortalezaPassword (contraseña: str) -> str:
    if len(contraseña) < 5:
        return print("ROJA")
    elif len(contraseña) > 8 and hayNum(contraseña) and hayMayusc(contraseña) and hayMin(contraseña):
        return print("VERDE")
    else:
        return print("AMARILLA")
    
def hayMin(frase: str) -> bool:
    for i in range(len (frase)):
        if str.islower(frase[i]):
            return True
    return False

def hayNum (frase: str) -> bool:
    for i in range(len (frase)):
        if str.isnumeric(frase[i]):
            return True
    return False

def hayMayusc(frase: str) -> bool:
    for i in range(len(frase)):
        if str.isupper(frase[i]):
            return True
    return False

## EJ 8
def movimientos(movimientos: list[tuple]) -> int:
    saldo = 0
    for i in range(len (movimientos)):
        tupla = movimientos[i]
        if tupla[0] == 'I':
            saldo = saldo + tupla[1]
        else:
            saldo = saldo - tupla[1]
    return saldo

## EJ 9
def tresVocales(frase: str) -> bool:
    lista = []
    for i in range(len(frase)):
        if str.lower(frase[i]) in vocales and (not (str.lower(frase[i]) in lista)):
            lista.append(frase[i])
    if len(lista) >= 3:
        return True
    else:
        return False

## PARTE 2

vocales = ['a','e','i','o','u']
# 1 
def borrarPosPares(lista: list[int]) -> list[int]:
    for i in range(len(lista)):
        if i % 2 == 0:
            lista[i] = 0
    return lista

# 2
def borrarPosParesV2(lista: list[int]) -> list[int]:
    nuevaLista = []
    for i in range(len(lista)):
        if i % 2 == 0:
            nuevaLista.append(0)
        else:
            nuevaLista.append(lista[i])
    return nuevaLista

# 3
def eliminaVocales(frase: str) -> str:
    res = ""
    for i in range(len(frase)):
        res = res + (borrarVocales (pasarStrAList (frase)))[i]
    return res

def pasarStrAList(frase: str) -> list[str]:
    lista = []
    for i in range(len(frase)):
        lista.append(frase[i])
    return lista

def borrarVocales(lista: list[chr]) -> list[chr]:
    for i in range(len(lista)):
        if str.lower(lista[i]) in vocales:
            lista[i] = ''
    return lista

# 4
def reemplazaVocales(s: list[chr]) -> list[chr]:
    vocales = ['a','e','i','o','u']
    for i in range(len(s)):
        if s[i] in vocales:
            s[i] = '_'
        else:
            s[i] = s[i]
    return s

def daVueltaStr(s: list[chr]) -> list[chr]:
    s = s[::-1]
    return s

def eliminarRepetidos(lista: list[chr]) -> list[chr]:
    letras = []
    repetidos = []
    for i in range(len(lista)):
        if (not lista[i] in letras):
            letras.append(lista[i])
        else:
            repetidos.append(lista[i])
    for i in range(len(repetidos)):
        lista.remove(repetidos[i])
    return lista

# EJ 3
def aprobado(notas: list[int]) -> int:
    promedio = 0
    for i in range(len(notas)):
        if notas[i] < 4:
            return 3
        elif notas[i] >= 4:
            promedio = promedio + notas[i]
    if promedio / (len(notas)) >= 7:
        return 1
    elif (promedio / (len(notas)) >= 4) and (promedio / (len(notas)) < 7):
        return 2
    elif (promedio / len(notas)) < 4:
        return 3

# EJ 4
# 1
def nombresEstudiantes() -> list[str]:
    nombres = []
    entrada = ""
    while (1 != 0):
        nombre = input('Nombre: ')
        if nombre == 'listo':
            return nombres
        nombres.append(nombre)

# 2
def historialSUBE() -> list[tuple]:
    paso = ""
    historial = []
    while (1 != 0):
        entrada1 = input("¿Que va a hacer? \n")
        if entrada1 == "C":
            carga = input("Ingrese monto: ")
            historial.append((entrada1, carga))
            paso = entrada1
        elif entrada1 == "D":
            descontar = input("Ingrese monto: ")
            historial.append((entrada1, descontar))
            paso == entrada1
        else:
            return historial

# 3
def sieteYMedio() -> str:
    puntaje = 0
    historial = []
    while(1 != 0):
        juego = input('¿Sacar otra carta o plantarse? (s/p): ')
        if juego == 's':
            carta = random.randint(1,12)
            while carta == 8 or carta == 9:
                carta = random.randint(1,12)
            if carta in [10,11,12]:
                puntaje = puntaje + 0.5
                historial.append(carta)
            else:
                puntaje = puntaje + carta
                historial.append(carta)
        if juego == 'p':
            if puntaje > 7.5:
                return print("Perdiste\n", historial)
            else:
                return print("Ganaste\n", historial)

# EJ 5
# 1
def perteneceACadaUnoV1(s: list[list[int]], e: int, res :list[bool]):
    for i in range(len(s)):
        res.append(pertenece(e, s[i]))

# 2
def perteneceACadaUnoV2(s: list[list[int]], e: int, res :list[bool]):
    res.clear() #limpia la lista en caso de tener algun elemento
    for i in range(len(s)):
        res.append(pertenece(e, s[i]))
    return res

# 3
def esMatriz(s: list[list[int]]) -> bool:
    if len(s) == 0:
        return False
    for i in range(len(s)):
        if len(s[0]) == 0 or (len(s[i]) != len(s[0])):
            return False
    return True

# 4
def filasOrdenadas(m: list[list[int]], res: list[bool]):
    res.clear()
    for i in range(len(m)):
        res.append(ordenados(m[i]))
#    return res

# 5
def matrizMultiplicada(d: int, p: int):
    matriz = np.random.random((d, d))
    res = np.zeros([d,d])
    for m in range(p):
        for i in range(d):
            for j in range(d):
                for k in range(d):
                    res[i][j] = res[i][j] + (matriz[i][k] * matriz[k][j])
    return res

def pruebaMultiplicacion(p: int):
    matriz = np.array([[1,2],[2,1]])
    res = np.zeros([2,2])
    for m in range(p):
        for i in range(2):
            for j in range(2):
                for k in range(2):
                    res[i][j] = res[i][j] + (matriz[i][k] * matriz[k][j])
    return res

a = np.array([[1,2],[2,1]])