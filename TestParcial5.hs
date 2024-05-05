import Test.HUnit
import Parcial5

testCantMinuscula = test [
 "Todas Minusculas" ~: cantMinuscula "texto de prueba" ~?= 13,
 "Todas Mayusculas" ~: cantMinuscula "TEXTO DE PRUEBA" ~?= 0,
 "Texto con Min y Mayus" ~: cantMinuscula "Texto De Prueba" ~?= 10,
 "Texto Vacio" ~: cantMinuscula "" ~?= 0,
 "Texto con no letras" ~: cantMinuscula "-.:;34" ~?= 0
 ]

testMaximoCambios = test [
 "Caso Base" ~: maximoCambios ["Texto"] ~?= "Texto",
 "Caso genérico" ~: maximoCambios ["Texto", "TEXTO", "texto"] ~?= "texto",
 "No Minuscula" ~: maximoCambios ["TEXTO", "TEXTO2"] ~?= "TEXTO2",
 "Empate" ~: maximoCambios ["texto1", "texto2", "texto3"] ~?= "texto3"
 ]

testDesplazar = test [
 "No hay saltos (Sentido A-Z)" ~: desplazar 'a' 3 ~?= 'd',
 "No hay saltos (Sentido Z-A)" ~: desplazar 'z' (-3) ~?= 'w',
 "Desplazamiento Maximo sin Saltos (A-Z)" ~: desplazar 'a' 25 ~?= 'z',
 "Desplazamiento Maximo sin Saltos (Z-A)" ~: desplazar 'z' (-25) ~?= 'a',
 "Desplazamiento con Salto (A-Z)" ~: desplazar 'y' 3 ~?= 'b',
 "Desplazamiento con Salto (Z-A)" ~: desplazar 'b' (-3) ~?= 'y' 
 ]

testCodificarMensaje = test [
    "Codifica Sin Saltos (No Mayus)" ~: codificar "abcdefg" 1 ~?= "bcdefgh",
    "Codifica Sin Saltos (Con Mayus)" ~: codificar "abcDEFG" 1 ~?= "bcdDEFG",
    "Codifica Con Saltos (No Mayus)" ~: codificar "wxyz" 4 ~?= "abcd",
    "Codifica Con Saltos (Con Mayus)" ~: codificar "wxYZ" 4 ~?= "abYZ",
    "Codifica (Todo Mayus)" ~: codificar "ABCD" 4 ~?= "ABCD",
    "Codifica Con Simbolos" ~: codificar "ab23cd4:," 1 ~?= "bc23de4:,",
    "Codifica pero No Hay Texto" ~: codificar "" 7 ~?= ""
    ]

testDecodificarMensaje = test [
    "Decodifica Sin Saltos (No Mayus)" ~: decodificar "bcdefgh" 1 ~?= "abcdefg",
    "Decodifica Sin Saltos (Con Mayus)" ~: decodificar "bcdDEFG" 1 ~?= "abcDEFG",
    "Decodifica Con Saltos (No Mayus)" ~: decodificar "abcd" 4 ~?= "wxyz",
    "Decodifica Con Saltos (Con Mayus)" ~: decodificar "abYZ" 4 ~?= "wxYZ",
    "Decodifica (Todo Mayus)" ~: decodificar "ABCD" 4 ~?= "ABCD",
    "Decodifica Con Simbolos" ~: decodificar "bc23de4:," 1 ~?= "ab23cd4:,",
    "Decodifica pero No Hay Texto" ~: decodificar "" 7 ~?= ""
    ]