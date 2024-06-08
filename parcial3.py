# EJ 1
historial_1 = 'ssrvvvvsvvsvvv'
historial_2 = 'ssrvvrrvvsvvsxrvvv'
def verificar_transacciones(s: str) -> int:
    saldo : str = 0
    for i in range(len(s)):
        if s[i] == 'r':
            saldo += 350
        elif s[i] == 's':
            print('Saldo: ', saldo)
        elif s[i] == 'x' or (i + 1) == len(s):
            return print('Saldo: ', saldo)
        else:
            if saldo - 56 < 0:
                return print('Saldo insuficiente. Saldo:', saldo)
            else:
                saldo = saldo - 56

# EJ 2
s = [(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)]
def valor_minimo(s: list[tuple[int]]) -> float:
    res : float = 0
    for i in range(len(s)):
        tupla = s[i]
        if tupla[0] < res:
            res = tupla[0]
    return res

# EJ 3
cotizaciones = {"YPF" : [(1,10), (15,3), (31,100)], "ALUA" : [(1,0), (20,50), (31,30)]}
def valores_extremos(cotizaciones_diarias: dict[str, list[tuple[int, float]]]) -> dict[str, list[tuple[float, float]]]:
    empresas : list[str] = list(cotizaciones_diarias.keys())
    cotizaciones : list[tuple[int, float]] = list(cotizaciones_diarias.values())
    extremos : dict[str, list[tuple[float, float]]] = {}
    for i in range(len(cotizaciones)):
        extremos[empresas[i]] = min_y_max(cotizaciones[i])
    return extremos

def min_y_max(lista: list[tuple[int, float]]) -> tuple[float]:
    min = lista[0][1]
    max = lista[0][1]
    for i in range (len(lista)):
        tupla = lista[i]
        if tupla[1] > max:
            max = tupla[1]
        elif tupla[1] < min:
            min = tupla[1]
    return (min, max)

# EJ 4
m = [
[1, 2, 3, 4, 5, 5, 7, 8, 9],
[9, 8, 7, 6, 4, 5, 3, 2, 1],
[0, 0, 0, 0, 0, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 4, 0, 0, 0],
[0, 0, 0, 0, 6, 0, 0, 0, 0],
[0, 0, 0, 5, 0, 0, 0, 0, 0],
[0, 0, 4, 0, 0, 0, 0, 0, 0],
[0, 3, 0, 0, 0, 0, 0, 0, 0],
[2, 0, 0, 0, 0, 0, 0, 0, 0]
]

def sudoku_valido(sudoku: list[list[int]]) -> bool:
    lista_columnas = columnas(sudoku)
    if repetidos_en_lista(sudoku) or repetidos_en_lista(lista_columnas):
        return False
    return True


def columnas(filas: list[list[int]]) -> list[list[int]]:
    posicion : int = 0
    res : list[list[int]] = []
    temp : list[int] = []
    while len(res) != len(filas):
        for i in range(len(filas)):
            fila = filas[i]
            temp.append(fila[posicion])
            if len(temp) == len(fila):
                res.append(temp)
                temp = []
                posicion += 1
    return res

def hay_repetidos(lista: list[int]) -> bool: #distintos de 0
    contador = 0
    distintos_de_cero = 0
    for i in range(len(lista)):
        elem = lista[i]
        if elem != 0:
            distintos_de_cero += 1
        for j in range(len(lista)):
            if elem == lista[j] and lista[j] != 0 and elem != 0:
                contador += 1
    return contador != distintos_de_cero

def repetidos_en_lista(listas: list[list[int]]) -> bool:
    for i in range(len(listas)):
        lista = listas[i]
        if hay_repetidos(lista):
            return True
    return False
