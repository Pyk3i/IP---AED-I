module Parcial4 where


-- Ejercicio 1
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int  -> Float
porcentajeDeVotosAfirmativos _ _ 0 = 0
porcentajeDeVotosAfirmativos _ xs t = division (sumarLista xs*100) t

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

sumarLista:: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = x + sumarLista xs

-- Ejercicio 2
formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = False
formulasInvalidas xs = repetidosLista (pasarLista xs)

pasarLista :: [(String, String)] -> [String]
pasarLista [] = []
pasarLista ((a,b):xs) = a : b : pasarLista xs

apareceLista :: (Eq t) => t -> [t] -> Bool
apareceLista _ [] = False
apareceLista x (y:ys)
    |x == y = True
    |otherwise = apareceLista x ys

repetidosLista :: (Eq t) => [t] -> Bool
repetidosLista [] = False
repetidosLista (x:xs)
    |apareceLista x xs = True
    |otherwise = repetidosLista xs

-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
--porcentajeDeVotos _ _ [] = 0.0
porcentajeDeVotos vice (x:xs) (y:ys)
    |vice == snd x = division (y*100) votosTotales
--    |otherwise = porcentajeDeVotos vice xs ys -- ////// NO SIRVE, BORRA LOS ELEMENTOS ANTERIORES DE LA LISTA /////
    |otherwise = porcentajeDeVotos vice proximoVice proximoVoto
        where votosTotales = sumarLista (y:ys)
              proximoVice = ultimoaprimero (x:xs)
              proximoVoto = ultimoaprimero (y:ys)

ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

eliminarUltimo :: [t] -> [t]
eliminarUltimo [x] = []
eliminarUltimo (x:xs) = x : eliminarUltimo xs

ultimoaprimero :: [t] -> [t]
ultimoaprimero xs = ultimo xs : eliminarUltimo xs

-- Ejercicio 4
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado [x] [y] = fst x
menosVotado (x:xs) (y:ys)
    |todosRepetidos (y:ys) = "Ninguno"
    |y == votomenor = fst x
    |otherwise = menosVotado xs ys
        where votomenor = menorLista (y:ys)
{--    |otherwise = menosVotado proximoPresidente proximoVoto
              proximoPresidente = ultimoaprimero (x:xs)
              proximoVoto = ultimoaprimero (y:ys)--}

menorLista :: [Int] -> Int
menorLista [x] = x
menorLista (x:y:zs)
    |x >= y = menorLista (y:zs)
    |otherwise = menorLista (x:zs)

todosRepetidos :: (Eq t) => [t] -> Bool
todosRepetidos [x] = True
todosRepetidos (x:y:xs)
    |x == y = todosRepetidos (y:xs)
    |otherwise = False