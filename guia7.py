## GUIA 7
import math

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
    for i in range(0, len(s), 1):
        if i == len(s):
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
## EJ 1 
def borrarPares(lista: list[int]) -> list[int]:
    for i in range(len(lista)):
        if lista[i] % 2 == 0:
            lista[i] = 0
    return lista

## EJ 2
def borrarParesV2(lista: list[int]) -> list[int]:
    nuevaLista = []
    for i in range(len(lista)):
        if lista[i] % 2 == 0:
            nuevaLista.append(0)
        else:
            nuevaLista.append(lista[i])
    return nuevaLista

## EJ 3
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

## EJ 4
def reemplazaVocales(s: list[chr]) -> list[chr]:
    vocales = ['a','e','i','o','u']
    for i in range(len(s)):
        if s[i] in vocales:
            s[i] = '_'
        else:
            s[i] = s[i]
    return s