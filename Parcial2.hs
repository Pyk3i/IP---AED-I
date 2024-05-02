-- EJERCICIO 1
votosEnBlanco:: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco xs v n
    |votos == votosTotales && entradaValida= 0
    |votos < votosTotales && entradaValida = n - votos
        where votos = sumarLista v
              votosTotales = n
              elementosLista = contarElementos xs
              elementosVotos = contarElementos v
              entradaValida = formulasValidas xs && elementosLista == elementosVotos && votos >= 0

sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = x + sumarLista xs

contarElementos:: [t] -> Int
contarElementos [] = 0
contarElementos (x:xs) = 1 + contarElementos xs

-- EJERCICIO 2
formulasValidas :: [(String, String)] -> Bool
formulasValidas [] = False
formulasValidas ((a,b) : xs)
    |a == b = False
    |repetidosLista (tuplaALista ((a,b):xs)) ||repetidosLista (tuplaALista ((a,b):xs)) = False
    |otherwise = True

repetidosLista :: [String] -> Bool
repetidosLista [] = False
repetidosLista (x:xs) 
    |perteneceLista x xs = True
    |otherwise = repetidosLista xs

tuplaALista :: [(String, String)] -> [String]
tuplaALista [] = []
tuplaALista ((a,b) : xs) = a : b : tuplaALista xs

perteneceLista:: String -> [String] -> Bool
perteneceLista _ [] = False
perteneceLista x (y:xs)
    |x /= y = perteneceLista x xs
    |otherwise = True

-- EJERCICIO 3
porcentajeDeVotos:: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos a (x:xs) (y:ys)
    |a == fst x && entradaValida = division (y*100) votos
    |otherwise && entradaValida = porcentajeDeVotos a proximaFormula proximovoto
        where votos = sumarLista (y:ys)
              elementosLista = contarElementos (x:xs)
              elementosVotos = contarElementos (y:ys)
              entradaValida = formulasValidas (x:xs) && elementosLista == elementosVotos && votos > 0
              proximaFormula = ultimoLista (x:xs) : headInverso (x:xs)
              proximovoto = ultimoLista (y:ys) : headInverso (y:ys)

headInverso :: [t] -> [t]
headInverso [x] = []
headInverso (x:xs) = x : headInverso xs

ultimoLista :: [t] -> t
ultimoLista [x] = x
ultimoLista (x:xs) = ultimoLista xs

enumerarElemento :: Int -> [t] -> t --De derecha a izquierda
enumerarElemento x (y:xs)
    |x == contarElementos (y:xs) = y
    |otherwise = enumerarElemento x xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)


--EJERCICIO 4 
proximoPresidente:: [(String, String)] -> [Int] -> String
proximoPresidente (x:xs) (y:ys)
    |entradaValida && y == elementoMayor (y:ys) = fst x
    |otherwise && entradaValida = proximoPresidente proximaFormula proximoVoto

        where votos = sumarLista (y:ys)
              elementosLista = contarElementos (x:xs)
              elementosVotos = contarElementos (y:ys)
              entradaValida = formulasValidas (x:xs) && elementosLista == elementosVotos && votos > 0
              proximaFormula = ultimoLista (x:xs) : headInverso (x:xs)
              proximoVoto = ultimoLista (y:ys) : headInverso (y:ys)

elementoMayor :: [Int] -> Int
elementoMayor [a] = a
elementoMayor (x:y:xs)
    |x < y = elementoMayor (y:xs)
    |otherwise = elementoMayor (x:xs)