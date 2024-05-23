## EJERCICIO 7
import math

def pertenece (elemento: int, lista: list[int]) -> bool:
##    return elemento in lista
    for i in range(0, len(lista) + 1, 1):
        if elemento == lista[i]:
            return True
        elif (i+1) == len(lista):
            return False
        
def divideATodos(s: list[int], e: int) -> bool:
    for i in range(0, len(s), 1):
        if s[i] / e != math.floor(s[i] / e):
            return False
        elif i == len(s):
            return True
        
def sumaTotal(s: list[int]) -> int:
    x = 0
    for i in range(0, len(s) + 1, 1):
        x = x + s[i]
        if (i+1) == len(s):
            return x

def ordenados(s: list[int]) -> bool:
    for i in range(0, len(s), 1):
        if i == len(s):
            return True
        elif s[i] > s[i+1]:
            return False

def longitud7(p: list[str]) -> bool:
    for i in range(0, len(p), 1):
        if len(p[i]) > 7:
            return True
        elif i == len(p):
            return False

##def esPalindromo(frase: str) -> bool:

def inversoPalabra(frase: str) -> str:
    for i in range(len(frase)):
        res = (frase[len(frase) -1 - i])
    return res