import System.Win32 (COORD(xPos))
-- EJERCICIO 1
longitud:: [Int] -> Int
longitud xs
    |xs == [] = 0
    |otherwise = 1 + longitud (tail xs)

ultimo:: [Int] -> Int
ultimo [x] = x
ultimo xs = ultimo (tail xs)


principio:: [t] -> [t] -- tail a la inversa
principio (x:[]) = []
principio (x : xs) = x : principio xs

auxReverso:: [t] -> t
auxReverso [x] = x
auxReverso xs = auxReverso (tail xs)

reverso:: [t] -> [t]
reverso [x] = [x]
reverso xs = auxReverso xs : reverso(principio xs)


-- EJERCICIO 2 
pertenece:: Eq t => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) = x == y || pertenece x ys

todosIguales:: Eq t => [t] -> Bool
todosIguales (x:[]) = True
todosIguales (x:xs) = x == head xs && todosIguales xs

todosDistintos:: Eq t => [t] -> Bool
todosDistintos [x] = True
todosDistintos (x:xs)
    |pertenece x xs = False
    |otherwise = todosDistintos xs

hayRepetidos:: Eq t => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    |pertenece x xs = True
    |otherwise = hayRepetidos xs

quitar:: Eq t => t -> [t] -> [t]
{--quitar x xs
    |hayRepetidos xs == False = xs
    |otherwise = quitar x (tail xs)--}
quitar _ [] = []
quitar n (x:xs) 
    |n == x = xs
    |otherwise = x : quitar n xs

quitarTodos:: Eq t => t -> [t] -> [t]
-- quitarTodos _ [] = [] (Innecesario)
quitarTodos x xs
    |pertenece x xs = quitarTodos x (quitar x xs)
    |otherwise = xs

eliminarRepetidos:: Eq t => [t] -> [t]
eliminarRepetidos xs 
    |hayRepetidos xs == False = xs
    |otherwise = head xs : eliminarRepetidos(quitarTodos (head xs) xs)

auxRepetidos:: Num t => Eq t => t -> [t] -> t --Cuenta los números repetidos en una lista de un x en lista
auxRepetidos x xs
    |pertenece x xs = 1 + auxRepetidos x (quitar x xs) 
    |otherwise = 0 

mismosElementos:: Eq t => [t] -> [t] -> Bool
mismosElementos xs ys
    |(xs == [] && ys /= []) || (xs /= [] && ys == []) = False
    |xs == [] && ys == [] = True
    |pertenece (head xs) ys == True = mismosElementos xsSinX ysSinX
    |otherwise = False
        where xsSinX = quitarTodos(head xs) xs
              ysSinX = quitarTodos(head xs) ys

-- EJERCICIO 3
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + (sumatoria xs)

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN x (y:xs) = (x+y) : sumarN x xs 

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [x] = [x+x]
sumarElPrimero xs = sumarN (head xs) xs 

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [x] = [x+x]
sumarElUltimo (x:xs) = (x + ultimo xs) : sumarElUltimo xs

pares:: [Int] -> [Int]
pares [] = []
pares (x:xs)
    |mod x 2 == 0 = x : pares xs
    |otherwise = pares xs

multiplosDeN:: Int -> [Int] -> [Int]
multiplosDeN _ [] = []
multiplosDeN x (y:xs) 
    |mod y x == 0 = y : multiplosDeN x (xs)
    |otherwise = multiplosDeN x xs

ordenar :: [Int] -> [Int]
ordenar [x] = [x]
ordenar xs = maximo xs : ordenar (quitar (maximo xs) xs)

maximo:: [Int] -> Int --Eliminar todos los menores hasta que quede el mayor
maximo (x:[]) = x
maximo (x:(y:xs))
    | x >= y = maximo (x :xs)
    |otherwise = maximo (y:xs)

-- EJERCICIO 4
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:(y:xs))
    |x == y && x == ' ' = sacarBlancosRepetidos (y:xs)
    |otherwise = x : sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Int
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:y:xs)
    |y == ' ' && x /= ' ' = 1 + contarPalabras (sacarBlancosRepetidos (x:xs))
    |otherwise = contarPalabras (x:xs)