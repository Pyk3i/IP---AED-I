# EJ 1
def ultima_aparicion(s: list[int], e: int) -> int:
    ult_posicion : int = 0
    for i in range(len(s)):
        if s[i] == e:
            ult_posicion = i
    return ult_posicion

# EJ 2
s = [-1,4,0,4,3,0,100,0,-1,-1]
t = [0,100,5,0,100,-1,5]

def elementos_exclusivos(s: list[int], t: list[int]) -> list[int]:
    elem_exclusivos : list[int] = []
    for i in range(len(s)):
        if not pertenece(s[i], t) and not pertenece(s[i], elem_exclusivos):
            elem_exclusivos.append(s[i])
    for i in range(len(t)):
        if not pertenece(t[i], s) and not pertenece(t[i], elem_exclusivos):
            elem_exclusivos.append(t[i])
    return elem_exclusivos


def pertenece(e: int, s: list[int]) -> bool:
    for i in range(len(s)):
        if s[i] == e:
            return True
    return False

# EJ 3
aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
ingles = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

def contar_traducciones_iguales(ing: dict[str, str], ale: dict[str, str]) -> int:
    keys_ing = list(ing.keys())
    keys_ale = list(ale.keys())
    contador = 0
    for i in range(len(keys_ing)):
        for j in range(len(keys_ale)):
            if keys_ing[i] == keys_ale[j] and ing[keys_ing[i]] == ale[keys_ale[j]]:
                contador = contador + 1
    return contador

# EJ 4
lista = [-1,0,4,100,100,-1,-1]
def convertir_a_diccionario(lista: list[int]) -> dict[int, int]:
    keys_lista = []
    diccionario = {}
    for i in range(len(lista)):
        if not pertenece(lista[i], keys_lista):
            diccionario[lista[i]] = cant_apariciones(lista[i], lista)
    return diccionario


def cant_apariciones(e: int, l: list[int]) -> int:
    contador = 0
    for i in range(len(l)):
        if e == l[i]:
            contador = contador + 1
    return contador