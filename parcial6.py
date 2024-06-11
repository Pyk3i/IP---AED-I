# EJ 1
def filtrar_codigos_primos(codigos_barra: list[int]) -> list[int]:
    res : list[int] = []
    for i in range(len(codigos_barra)):
        codigo = codigos_barra[i]
        if es_primo(codigo):
            res.append(codigo)
    return res

def es_primo(numero: int) -> bool:
    ultimos_digitos = corregir_num(numero)
    divisores : list[int] = []
    for i in range(1, ultimos_digitos + 1):
        if ultimos_digitos % i == 0:
            divisores.append(i)
    return len(divisores) == 2

def corregir_num(numero: int) -> int: ## EN CASO DE QUE HAYA 00# o 0## COMO ULTIMOS TRES DIGITOS, DEVUELVE SOLO # O ##
    nuevo_num : int = 0
    ultimos_tres_dig = int(str(numero)[len(str(numero)) - 3:])
    if str(numero)[0] == 0 and str(numero)[1] == 0:
        nuevo_num = int(str(numero)[2:])
    elif str(numero)[0] == 0:
        nuevo_num = int(str(numero)[1:])
    else:
        nuevo_num = ultimos_tres_dig
    return nuevo_num

# EJ 2
prueba = [("comida", 10), ("comida", 30), ("vacunas", 7), ("vacunas", 20), ("antibioticos", 5), ("antibioticos", 15), ("alcohol", 10), ("alcohol", 20)]
def stock_productos(stock_cambios: list[tuple[str, int]]) -> dict[str, tuple[int, int]]:
    res : dict[str, tuple[int, int]] = {}
    productos = []
    for i in range(len(stock_cambios)):
        producto = stock_cambios[i][0]
        res[producto] = min_y_max_producto(producto, stock_cambios)
    return res

def min_y_max_producto(producto: str, lista_tuplas: list[tuple[str, int]]) -> tuple[int, int]:
    extremos : list[int, int] = [0,0]
    for i in range(len(lista_tuplas)): #PONE ALGUNO DE LOS VALORES DE PRODUCTO EN AMBAS PARTE DE RES PARA COMPARAR LUEGO
        tupla_producto = lista_tuplas[i]
        if tupla_producto[0] == producto:
            extremos[0] = tupla_producto[1]
            extremos[1] = tupla_producto[1]
    for j in range(len(lista_tuplas)):
        tupla = lista_tuplas[j]
        if tupla[1] < extremos[0] and tupla[0] == producto:
            extremos[0] = tupla[1]
        elif tupla[1] > extremos[1] and tupla[0] == producto:
            extremos[1] = tupla[1]
    res : tuple[int, int] = (extremos[0], extremos[1])
    return res
    
# EJ 3
grilla_prueba = [['b','a','a','a','b','a','a'],
                 ['b','a','a','a','b','b','a'],
                 ['a','a','b','a','b','a','a'],
                 ['b','a','b','b','b','a','a'],
                 ['a','a','b','b','b','a','a'],
                 ['a','a','a','b','b','a','a'],
                 ['a','a','a','b','b','a','a'],
                 ['a','a','a','a','b','b','a']]
def un_responsable_por_turno(grilla_horaria: list[list[str]]) -> list[tuple[bool, bool]]:
    res : list[tuple[bool, bool]] = []
    bool_mañana : list[bool] = []
    bool_tarde : list[bool] = []
    turno_mañana : list[list[str]] = []
    turno_tarde : list[list[str]] = []
    for i in range(len(grilla_horaria[0])): # TURNO MAÑANA
        fila1 = grilla_horaria[0]
        fila2 = grilla_horaria[1]
        fila3 = grilla_horaria[2]
        fila4 = grilla_horaria[3]
        turno_mañana.append([fila1[i], fila2[i], fila3[i], fila4[i]])
    for j in range(len(grilla_horaria[0])): # TURNO TARDE
        fila5 = grilla_horaria[4]
        fila6 = grilla_horaria[5]
        fila7 = grilla_horaria[6]
        fila8 = grilla_horaria[7]
        turno_tarde.append([fila5[j], fila6[j], fila7[j], fila8[j]])
    for m in range(len(turno_mañana)):
        if todos_iguales(turno_mañana[m]):
            bool_mañana.append(True)
        else:
            bool_mañana.append(False)
    for n in range(len(turno_tarde)):
        if todos_iguales(turno_tarde[n]):
            bool_tarde.append(True)
        else:
            bool_tarde.append(False)
    for x in range(len(bool_mañana)):
        res.append((bool_mañana[x], bool_tarde[x]))
    
    return res
        

def todos_iguales(lista: list[str]) -> bool:
    elem = lista[0]
    for i in range(len(lista)):
        if elem != lista[i]:
            return False
    return True

# EJ 4
animales_prueba = ["perro","perro","caballo","perro","perro","caballo","perro","conejo","gato","perro","tortuga"]
def subsecuencia_mas_larga(tipos_pacientes_atendidos: list[str]) -> int:
    res : int = 0
    lista_subsecuencias = subsecuencias(tipos_pacientes_atendidos)
    longitud_subsecuencias = len_subsecuencias(lista_subsecuencias)
    for i in range(len(longitud_subsecuencias)):
        if longitud_subsecuencias[i] == mayor_que_todos(longitud_subsecuencias):
            res = lista_subsecuencias[i][0]
            return res

def mayor_que_todos(lista: list[int]) -> int:
    res : int = 0
    for i in range(len(lista)):
        if lista[i] > res:
            res = lista[i]
    return res

def len_subsecuencias(lista: list[list[int]]) -> list[int]:
    res : list[int] = []
    for i in range(len(lista)):
        res.append(len(lista[i]))
    return res

def subsecuencias(lista: list[str]) -> list[tuple[int, int]]:
    animales : list[str] = ["perro", "gato"]
    temp : list[int] = []
    res : list[list[int]] = []
    for i in range(len(lista)):
        if lista[i] in animales:
            temp.append(i)
        if lista[i] not in animales:
            res.append(temp)
            temp = []
    return res