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
#def sudoku_valido(sudoku: list[list[int]]) -> bool:

def verifica_columna(n : int, m: list[list[int]]) -> bool:
    contador = 0
    for i in range(len(m)):
        fila = m[i]
        if fila[i] == n:
            for j in range(len(fila)): ## Ver como bajar hacia la siguiente fila
