-- EJERCICIO 1
atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes _ [] 0 = 0
atajaronSuplentes _ goles totalgolestorneo = totalgolestorneo - sumarLista goles

sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = x + sumarLista xs

-- EJERCICIO 2
equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos ((a,b):xs) = not (porteroIgualAClub b clubes) && not repetidos
     where clubes = listaClubes((a,b):xs)
           repetidos = repetidoLista (pasarALista ((a,b):xs))

porteroIgualAClub :: String -> [String] -> Bool -- Verifica que el nombre del portero no sea nombre de club, da True si el nombre del portero es de algún club
porteroIgualAClub _ [] = False
porteroIgualAClub x (y:xs)
    |x == y = True
    |otherwise = porteroIgualAClub x xs

listaClubes :: [(String, String)] -> [String]
listaClubes [] = []
listaClubes ((a,b):xs) = a : listaClubes xs

pasarALista :: [(String, String)] -> [String]
pasarALista [] = []
pasarALista ((a,b): xs) = a : b : pasarALista xs

apareceLista :: String -> [String] -> Bool
apareceLista _ [] = False
apareceLista x (y:ys)
    |x == y = True
    |otherwise = apareceLista x ys

repetidoLista :: [String] -> Bool -- Da True si hay algun repetido
repetidoLista [] = False
repetidoLista (x:xs)
    |apareceLista x xs = True
    |otherwise = repetidoLista xs


-- EJERCICIO 3
porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
--porcentajeDeGoles _ [x] [y] = 100
porcentajeDeGoles portero (x:xs) (y:ys)
    |portero == snd x = division (y*100) golestotales
    |otherwise = porcentajeDeGoles portero proximoPortero proximoGoles
        where golestotales = sumarLista (y:ys)
              proximoPortero = ultimoaprimero (x:xs)
              proximoGoles = ultimoaprimero (y:ys)

ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

borraUltimo :: [t] -> [t]
borraUltimo [x] = []
borraUltimo (x:xs) = x : borraUltimo xs

ultimoaprimero :: [t] -> [t]
ultimoaprimero [] = []
ultimoaprimero xs = ultimo xs : borraUltimo xs

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


-- EJERCICIO 4
vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida (x:xs) (y:ys)
    |y == menorDeTodos (y:ys) = snd x
    |otherwise = vallaMenosVencida proximoPortero proximoGoles
        where proximoPortero = ultimoaprimero (x:xs)
              proximoGoles = ultimoaprimero (y:ys)
        
menorDeTodos :: [Int] -> Int
menorDeTodos [a] = a 
menorDeTodos (x:y:xs)
    |x >= y = menorDeTodos (y:xs)
    |otherwise = menorDeTodos (x:xs)