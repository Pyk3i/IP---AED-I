from queue import Queue as Cola

# EJ 1
fila = Cola()
fila.put(("nombre1", "comun"))
fila.put(("nombre2", "vip"))
fila.put(("nombre3", "vip"))
fila.put(("nombre4", "comun"))

def cola_priorizando_vips(fila_clientes: Cola[(str, str)]) -> Cola[str]:
    temp : list [(str, str)]= []
    nombre_vips : list[str]= []
    nombre_comun : list[str] = []
    res : Cola[str] = Cola() 
    while fila_clientes.empty() == False:
        cliente = fila_clientes.get()
        if cliente[1] == "comun":
            nombre_comun.append(cliente[0])
            temp.append(cliente)
        else:
            nombre_vips.append(cliente[0])
            temp.append(cliente)
    for i in range(len(temp)): # Reconstruye la cola
        fila_clientes.put(temp[i])
    for j in range(len(nombre_vips)):
        res.put(nombre_vips[j])
    for k in range(len(nombre_comun)):
        res.put(nombre_comun[k])
    return res

# EJERCICIO 2
torneo_prueba = {"jugador1": "me desvio siempre", 
                 "jugador2": "me la banco y no me desvio",
                 "jugador3": "me la banco y no me desvio",
                 "jugador4": "me desvio siempre"}
def torneo_de_galllinas(estrategias: dict[str, str]) -> dict[str, int]:
    res : dict[str, int] = {}
    jugadores : list[str] = list(estrategias.keys())
    for i in range(len(jugadores)):
        jugador : str = jugadores[i]
        estrategia_jugador = estrategias[jugador]
        puntuacion : int = 0
        for j in range(len(jugadores)): # Calcula el puntaje de jugador según su estrategia
            if jugador != jugadores[j]:
                rival = jugadores[j]
                estrategia_rival = estrategias[rival]
                if estrategia_jugador == "me desvio siempre" and estrategia_jugador == estrategia_rival:
                    puntuacion -= 10
                elif estrategia_jugador == "me la banco y no me desvio" and estrategia_jugador == estrategia_rival:
                    puntuacion -= 5
                elif estrategia_jugador == "me desvio siempre" and estrategia_jugador != estrategia_rival:
                    puntuacion -= 15
                else:
                    puntuacion += 10
        res[jugador] = puntuacion
    return res

# EJ 3
tateti = [['X', 'X', 'O', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          ['O', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          ['X', 'X', 'O', ' ', 'O', ' ', ' ', ' ', ' ', ' '],
          ['O', 'X', ' ', ' ', 'O', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O'],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O'],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O']]
def quien_gano_el_tateti(tablero: list[list[chr]]) -> int:
    tateti_Ana : int = 0
    tateti_Beto : int = 0
    res : int = 0
    for i in range(len(tablero) - 2):
        fila = tablero[i]
        fila_siguiente1 = tablero[i+1]
        fila_siguiente2 = tablero[i+2]
        for j in range(len(fila)): ## VERIFICA TATETI, EN CASO DE HABERLO, ACTUALIZA tateti_Ana O tateti_Beto
            if fila[j] == 'X' and (fila[j] == fila_siguiente1[j]) and (fila[j] == fila_siguiente2[j]):
                tateti_Ana = 1
            elif fila[j] == 'O' and (fila[j] == fila_siguiente1[j]) and (fila[j] == fila_siguiente2[j]):
                tateti_Beto = 1
    # CHEQUEA QUE AMBAS VARIABLES SON IGUALES O DISTINTAS Y ACTUALIZA RES DEPENEDIENDO DE LA CONDICIÓN CUMPLIDA
    if tateti_Ana == 1 and tateti_Beto == 0:
        res = 1
    elif tateti_Ana == 0 and tateti_Beto == 1:
        res = 2
    elif tateti_Ana == 1 and tateti_Beto == 1:
        res = 3
    else:
        res = 0
    return res
    
def cuantos_sufijos_son_palindromos(texto: str) -> int:
    res : int = 0
    sufijos : list[str] = conjunto_sufijos(texto)
    for i in range(len(sufijos)):
        if sufijos[i] == texto_al_reves(sufijos[i]):
            res += 1
    return res

def conjunto_sufijos(texto: str) -> list[str]:
    res : list[str] = []
    while len(texto) > 0:
        res.append(texto)
        texto = texto[1:]
    return res

def texto_al_reves(texto: str) -> str:
    nuevo_texto = ""
    for i in range(len(texto) -1, -1, -1):
        nuevo_texto += texto[i]
    return nuevo_texto

def enlistar_palabras(texto: str) -> list[str]:
    letras = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
              'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','ñ','Ñ']
    numeros : list[str] = ['1','2','3','4','5','6','7','8','9','0']
    res : list[str] = []
    temp : str = ""
    for i in range(len(texto)):
        if texto[i] in letras or texto[i] in numeros:
            temp += texto[i]
        elif (texto[i] == ' ') and temp != "":
            res.append(temp)
            temp = ""
    if temp != "":
        res.append(temp)
    return res
