from queue import LifoQueue as Pila
from queue import Queue as Cola
import random
# EJ 1
# 1
def contar_lineas(nombre: str) -> int:
    contador = 0
    archivo = open(nombre, 'r', encoding = "utf-8")
    for line in archivo:
        contador += 1
    archivo.close()
    return contador

# 2
def existe_palabra(nombre: str, palabra: str) -> bool:
    archivo = open(nombre, 'r', encoding = "utf-8")
    for line in archivo:
        if palabra in line:
            return True
    return False

# 3
def cant_apariciones(nombre_archivo: str, palabra: str) -> int:
    archivo = open(nombre_archivo, 'r', encoding = "utf-8")
    contador = 0
    for line in archivo:
        contador += cant_aparicionesAux(palabra, line)
    return contador

def cant_aparicionesAux(palabra: str, linea: str) -> int:
    contador = 0
    for i in range(len(linea)):
        if palabra in linea:
            contador += 1
            linea = linea.replace(palabra, "", 1)
    return contador

# EJ 2
def clonar_sin_comentarios(nombre_archivo: str) -> str:
    archivo = open(nombre_archivo, 'r', encoding = "utf-8")
    for line in archivo:
        if not(es_comentario(line)):
            res = print(line)
    return res

def es_comentario(linea: str):
    for i in range(len(linea)):
        if linea[0] == '#':
            return True
        elif linea[i] == '#' and linea[i-1::-1] == ' '*i:
            return True
    return False

# EJ 3
def invertir_linea(nombre_archivo: str):
    archivo = open(nombre_archivo, 'r+', encoding = "utf-8")
    archivo_nuevo = open('reverso.txt', 'w', encoding = "utf-8")
    lista = archivo.readlines()
    for i in range(len(lista) - 1 , -1, -1):
        archivo_nuevo.write(lista[i])
        archivo_nuevo.write('\n')
    archivo.close()
    archivo_nuevo.close()

# EJ 4
def agregar_frase_al_final(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo, 'r+', encoding = "utf-8")
    lista = archivo.readlines()
    for i in range(len(lista)):
        if i == len(lista) - 1:
            archivo.write('\n')
            archivo.write(frase)
    archivo.close()

# EJ 5
def agregar_frase_al_principio(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo, 'r+', encoding = "utf-8")
    lineas = archivo.readlines()

# EJ 6
def listar_palabras_de_archivo(nombre_archivo: str) -> list[str]:
    archivo = open(nombre_archivo, 'rb')
    binario = archivo.read()
    print(type(binario))
    print(binario)
    archivo.close()
    
    #lista = []
    #for i in range(len(binario)):
     #   if hay_mayus(binario[i]) and hay_minus(binario[i]) and hay_num(binario[i]) and (' ' in binario) and ('_' in binario) and len(binario[i]) >= 5:
      #      lista.append(binario[i])
    #archivo.close()

def hay_mayus(palabra: str) -> bool:
    lista = []
    palabra2 = ""
    for i in (len(palabra)):
        lista.append(chr(i))
    for i in range(len(lista)):
        palabra2 += lista[i]

    for i in range(len(palabra)):
        if palabra[i] >= 'A' and palabra[i] <= 'Z':
            return True
    return False

def hay_minus(palabra: str) -> bool:
    for i in range(len(palabra)):
        if palabra[i] >= 'a' and palabra[i] <= 'z':
            return True
    return False

def hay_num(palabra: str) -> bool:
    for i in range(len(palabra)):
        if palabra[i] >= '0' and palabra[i] <= '9':
            return True
    return False

# EJ 7
def calcular_promedio_por_estudiante(nombre_archivo_notas: str, nombre_archivos_promedio: str):
    archivo = open(nombre_archivo_notas, 'r', encoding = "utf-8")
    #lista = lista_notas(nombre_archivo_notas)
    csv = open(nombre_archivos_promedio, 'w')
    libretas = libretas_universitarias(nombre_archivo_notas)
    for i in range(len(libretas)):
        csv.write(libretas[i])
        csv.write(', ')
        csv.write(str(promedio_estudiante(nombre_archivo_notas, libretas[i])))
        csv.write('\n')
    archivo.close()
    csv.close()

def promedio_estudiante(nombre_archivo: str, lu:str) -> float:
    notas = lista_notas(nombre_archivo)
    suma = 0
    contador = 0
    for i in range(len(notas)):
        linea = notas[i]
        if linea[0] == lu:
            suma = suma + int(linea[3])
            contador = contador + 1
    return suma/contador

    
def libretas_universitarias(nombre_archivo: str):
    libretas = []
    archivo = open(nombre_archivo, 'r', encoding = "utf-8")
    linea = lista_notas(nombre_archivo)
    for i in range(len(linea)):
        lista = linea[i]
        if lista[0] not in libretas:
            libretas.append(lista[0])
    archivo.close()
    return libretas

def lista_notas(nombre_archivo: str) -> list[list[str]]:
    archivo = open(nombre_archivo, 'r', encoding = "utf-8")
    res = []
    lista = archivo.readlines()
    for i in range(1,len(lista)):
        res.append(separar_valores(lista[i]))
    archivo.close()
    return res

def separar_valores(linea: str) -> list[str]:
    lista = []
    for i in range(len(linea)):
        if linea[i] == ',' and len(lista) == 0:
            lista.append(linea[:i])
        elif linea[i] == ',' and len(lista) < 3:
            lista.append(linea[suma_lista(lista) + (2*len(lista)):i])
        elif len(lista) == 3:
            lista.append(linea[i+1:i+3])
    return lista

def suma_lista(lista: list[str]) -> int:
    palabra = ""
    for i in range(len(lista)):
        palabra = palabra + lista[i]
    return len(palabra)

# PARTE 2 PilaS
# EJ 8
def generar_nros_al_azar(cantidad: int, desde: int, hasta:int) -> Pila[int]:
    pila = Pila()
    contador = 0
    while contador != cantidad:
        numero = random.randint(desde, hasta)
        pila.put(numero)
        contador = contador + 1
    return pila

# EJ 9
def lista_a_pila(lst: list) -> Pila:
    pila = Pila()
    for i in range(len(lst) - 1, -1, -1):
        pila.put(lst[i])
    return pila

def cantidad_de_elementos(p: Pila) -> int:
    lista = []
    pila = lista_a_pila(p)
    contador = 0
    while contador != len(p):
        lista.append(pila.get())
        contador = contador + 1
    for i in range(len(lista) - 1, -1, -1):
        pila.put(lista[i])
    return len(lista)

# EJ 10
def buscar_el_maximo(p: Pila[int]) -> int:
    max = 0
    pila = lista_a_pila(p)
    while pila.empty() == False:
        numero = pila.get()
        if numero > max:
            max = numero
    return max

# EJ 11
def esta_bien_balanceada(s: str) -> bool:
    p_abiertos = Pila()
    for i in range(len(s)):
        if s[i] == '(':
            p_abiertos.put('(')
        elif s[i] == ')' and p_abiertos.empty() == True:
            return False
        elif s[i] == ')':
            p_abiertos.get()
    return p_abiertos.empty()

# EJ 12
def evaluar_expresion(s: str) -> float:
    operandos = Pila()
    operadores = lista_a_pila(numeros_en_str(s))
    lista_operandos = ['+', '-', '*', '/']
    for i in range(len(s) - 1, -1, -1):
        if s[i] in lista_operandos:
            operandos.put(s[i])
    while operandos.empty() == False:
        signo = operandos.get()
        if signo == '+':
            operacion = int(operadores.get()) + int(operadores.get())
            operadores.put(operacion)
        elif signo == '-':
            operacion = int(operadores.get()) - int(operadores.get())
            operadores.put(operacion)
        elif signo == '/':
            operacion = int(operadores.get()) / int(operadores.get())
            operadores.put(operacion)
        elif signo == '*':
            operacion = int(operadores.get()) * int(operadores.get())
            operadores.put(operacion)
    print(operadores.get())

def numeros_en_str(palabra: str) -> list[str]:
    lista = []
    num = ''
    for i in range(len(palabra)):
        if palabra[i].isnumeric() == True and palabra[i+1].isnumeric() == False:
            num = num + palabra[i]
            lista.append(num)
            num = ''
        if palabra[i].isnumeric() == True and palabra[i+1].isnumeric() == True:
            num = num + palabra[i]
    return lista

# PARTE 3
# COLAS
# EJ 13
def generar_nros_al_azar_cola(cantidad: int, desde:int, hasta:int) -> Cola:
    pila = generar_nros_al_azar(cantidad, desde, hasta)
    cola = Cola()
    while pila.empty() == False:
        elemento = pila.get()
        cola.put(elemento)
    return cola

# EJ 14
def cantidad_elementos(c: Cola) -> int:
    lista = []
    cola = lista_a_pila(c)
    for i in range(len(c)):
        lista.append(cola.get())
    return len(lista)

def lista_a_cola(lista: list) -> Cola:
    cola = Cola()
    for i in range(len(lista)):
        cola.put(lista[i])
    return cola

# EJ 16
def armar_secuencia_de_bingo() -> Cola[int]:
    cola = Cola()
    numeros = []
    while len(numeros) != 100:
        bola = random.randint(0,99)
        if bola not in numeros:
            cola.put(bola)
            numeros.append(bola)
    return cola

# EJ 17
def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    aciertos = 0
    jugadas = 0
    while aciertos != 12:
        bola = bolillero.get()
        if bola in carton:
            aciertos = aciertos + 1
            jugadas = jugadas + 1
        else:
            jugadas = jugadas + 1
    if aciertos == 12:
        return jugadas
    
def promedio_bingo(carton: list[int], n: int) -> float:
    jugadas_x_partida = []
    jugadas_totales = 0
    while len(jugadas_x_partida) != n:
        jugadas_x_partida.append(jugar_carton_de_bingo(carton, armar_secuencia_de_bingo()))
    for i in range(n):
        jugadas_totales = jugadas_totales + jugadas_x_partida[i]
    return jugadas_totales / len(jugadas_x_partida)

# EJ 17
def n_pacientes_urgentes(c: Cola[(int, str, str)]) -> int:
    cola_pacientes = lista_a_cola(c)
    pacientes_urgentes = []
    while cola_pacientes.empty() == False:
        paciente = cola_pacientes.get()
        if paciente[0] in [1,2,3]:
            pacientes_urgentes.append(paciente)
    return len(pacientes_urgentes)

def generador_pacientes(n: int) -> list[(int, str, str)]: 
    lista = []
    contador = 0
    while contador != n:
        numero = random.randint(1,10)
        lista.append((numero, 'a', 'b'))
        contador = contador + 1
    return lista

# EJ 18
def atencion_al_cliente(c: Cola[(str, int, bool, bool)]) -> Cola[(str, int, bool, bool)]:
    prioridad_1 = lista_a_cola(prioridad1(c))
    prioridad_2 = lista_a_cola(prioridad2(c))
    prioridad_3 = lista_a_cola(prioridad3(c))
    prioridad_4 = lista_a_cola(prioridad4(c))
    cola_ordenada = Cola()
    while prioridad_1.empty() == False:
        cola_ordenada.put(prioridad_1.get())
    while prioridad_2.empty() == False:
        cola_ordenada.put(prioridad_2.get())
    while prioridad_3.empty() == False:
        cola_ordenada.put(prioridad_3.get())
    while prioridad_4.empty() == False:
        cola_ordenada.put(prioridad_4.get())
    return cola_ordenada.queue

def prioridad1(lst: list[(str,int,bool,bool)]):
    lista = []
    for i in range(len(lst) -1, -1, -1): #Va del último hasta el primero para que lista[0] sea el que llegó primero
        cliente = lst[i][0]
        if cliente[2] == True and cliente[3] == True:
            lista.append(cliente)
    return lista

def prioridad2(lst: list[(str,int,bool,bool)]):
    lista = []
    for i in range(len(lst) -1, -1, -1):
        cliente = lst[i][0]
        if cliente[2] == False and cliente[3] == True:
            lista.append(cliente)
    return lista

def prioridad3(lst: list[(str,int,bool,bool)]):
    lista = []
    for i in range(len(lst) -1, -1, -1):
        cliente = lst[i][0]
        if cliente[2] == True and cliente[3] == False:
            lista.append(cliente)
    return lista

def prioridad4(lst: list[(str,int,bool,bool)]):
    lista = []
    for i in range(len(lst) -1, -1, -1):
        cliente = lst[i][0]
        if cliente[2] == False and cliente[3] == False:
            lista.append(cliente)
    return lista

def clientes(n: int):
    clientes = []
    contador = 0
    while contador != n:
        bool1 = random.randint(1,2)
        bool2 = random.randint(1,2)
        if bool1 == 1 and bool2 == 1:
            clientes.append([('nombre', 'DNI', True, True)])
            contador = contador + 1
        if bool1 == 2 and bool2 == 2:
            clientes.append([('nombre', 'DNI', False, False)])
            contador = contador + 1
        if bool1 == 1 and bool2 == 2:
            clientes.append([('nombre', 'DNI', True, False)])
            contador = contador + 1
        if bool1 == 1 and bool2 == 1:
            clientes.append([('nombre', 'DNI', False, True)])
            contador = contador + 1
    return clientes