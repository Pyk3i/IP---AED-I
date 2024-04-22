-- EJERCICIO 1
longitud:: [Int] -> Int
longitud xs
    |xs == [] = 0
    |otherwise = 1 + longitud (tail xs)

ultimo:: [Int] -> Int
ultimo [x] = x
ultimo xs = ultimo (tail xs)

principio:: [t] -> [t] -- head a la inversa
principio [x] = [x]

reverso:: [t] -> [t]
reverso [x] = [x]



-- EJERCICIO 2 
pertenece:: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece x (y:ys) = x == y || pertenece x ys

hayRepetidos:: [Int] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    |pertenece x xs = True
    |otherwise = hayRepetidos xs

quitar:: Int -> [Int] -> [Int]
{--quitar x xs
    |hayRepetidos xs == False = xs
    |otherwise = quitar x (tail xs)--}
quitar _ [] = []
quitar n (x:xs) 
    |n == x = xs
--    |otherwise x : quitar n xs --ARREGLAR

maximo:: [Int] -> Int --Eliminar todos los menores hasta que quede el mayor
--maximo [x] = x
{--maximo xs
    |head xs <= head (tail xs) = head (tail xs)--}
maximo (x:[]) x
maximo (x:(y:xs))
    | x >= y = maximo x xs
    |otherwise maximo y: xs