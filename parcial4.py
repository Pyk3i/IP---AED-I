# EJ 1
s = [-1, 1, 1, 5, -7, 1, 3]
def ind_nesima_aparicion(s: list[int], n: int, elem: int) -> int:
    contador : int = 0
    res : int = 0
    for i in range(len(s)):
        if s[i] == elem:
            contador += 1
        if contador == n:
            res = i
            return res
    res = -1
    return res

# EJ 2
s1 = [1, 3, 0, 1,4,6]
s2 = [4, 0, 2, 3,5,7]
def mezclar(s1: list[int], s2: list[int]) -> list[int]:
    res : list[int] = []
    indice = 0
    while indice < len(s1):
        res.append(s1[indice])
        res.append(s2[indice])
        indice += 1
    return res

# EJ 3
caballos= ["linda", "petisa", "mister", "luck" ]
carreras= {"carrera1":["linda", "petisa", "mister", "luck"],
            "carrera2":["petisa", "mister", "linda", "luck"]}
def posiciones_por_caballo(caballos: list[str], carreras: dict[str, list[str]]) -> dict[str, list[int]]:
    res : dict[str, list[int]] = {}
    lista_carreras = list(carreras.values())
    for i in range(len(caballos)):
        res[caballos[i]] = posiciones_de_caballo(caballos[i], lista_carreras)
    return res

def posiciones_de_caballo(caballo: str, carreras: list[list[str]]) -> list[int]:
    posiciones : list[int] = [0]*len(carreras[0])
    for i in range(len(carreras)):
        carrera = carreras[i]
        for j in range(len(carrera)):
            if caballo == carrera[j]:
                posiciones[j] += 1
    return posiciones 

# EJ 4
m = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
def matriz_capicua(m: list[list[int]]) -> bool:
    inverso = filas_inversas(m)
    return m == inverso

def filas_inversas(m: list[list[int]]) -> list[list[int]]:
    res : list[list[int]] = []
    temp : list[int] = []
    for i in range(len(m)):
        fila = m[i]
        for j in range(len(fila) -1, -1, -1):
            temp.append(fila[j])
        res.append(temp)
        temp = []
    return res