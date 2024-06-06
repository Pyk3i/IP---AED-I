# EJ 1
def acomodar(s: list[str]) -> list[str]:
    lista_LLA : list[str] = []
    lista_UP : list[str] = []
    for i in range(len(s)):
        if s[i] == "LLA":
            lista_LLA.append(s[i])
        else:
            lista_UP.append(s[i])
    lista_acomodada : list[str] = lista_UP + lista_LLA
    return lista_acomodada

# EJ 2
def pos_umbral(s: list[int], u: int) -> int:
    sumatoria : int = 0
    for i in range(len(s)):
        if s[i] > 0:
            sumatoria = sumatoria + s[i]
            if sumatoria > u:
                return i
    return -1

#EJ 3
m = [[3,4, 1  ,2, 1,2,3,4],
     [3,4, -5 ,6,-5,6,3,4],
     [3,4, 0,  1, 0,1,3,4]]

def columnas_repetidas(mat: list[list[int]]) -> bool:
    mitad1 = primera_mitad(mat)
    mitad2 = segunda_mitad(mat)
    contador = 0
    for i in range(len(mitad1)):
        for j in range(len(mitad2)):
            if pertenece_lista(mitad1[i], mitad2[j]):
                contador = contador + 1
    return contador == len(mitad1)

def primera_mitad(mat: list[list[int]]) -> list[list[int]]:
    mitad : list[list[int]]= []
    for i in range(len(mat)):
        fila : list[int] = mat[i]
        temp : list[int] = []
        for j in range(int((len(fila) / 2))): # Para que recorra la primera mitad de la fila
            temp.append(fila[j])
        mitad.append(temp)
        temp = []
    return mitad

def segunda_mitad(mat: list[list[int]]) -> list[list[int]]:
    mitad : list[list[int]]= []
    for m in range(len(mat)):
        fila : list[int] = mat[m]
        temp : list[int] = []
        for n in range(int((len(fila) / 2)), len(fila)): # Para que recorra la segunda mitad de la fila
            temp.append(fila[n])
        mitad.append(temp)
        temp = []
    return mitad

def pertenece_lista(l1: list[int], l2: list[int]) -> bool:
    for i in range(len(l1)):
        if l1[i] not in l2:
            return False
    return True

# EJ 4
naciones = ["arg", "aus", "nz", "sud"]
torneos = {2023:["nz", "sud", "arg", "aus"], 2022:["nz", "sud", "aus", "arg"]}

def cuenta_posiciones_por_nacion(naciones: list[str], torneos: dict[int, list[str]]) -> dict[str, list[int]]:
    hist_posiciones : dict[str, list[int]] = {}
    elem_torneos = list(torneos.values())
    for i in range(len(naciones)):
        hist_posiciones[naciones[i]] = sumar_en_listas(naciones[i], elem_torneos)
    return hist_posiciones

def sumar_en_listas(nacion: str, lista: list[list[int]]) -> list[int]:
    posiciones = [0]*(len(lista[0]))
    for i in range(len(lista)):
        elem = lista[i]
        for j in range(len(elem)):
            if nacion == elem[j]:
                posiciones[j] = posiciones[j] + 1
    return posiciones


