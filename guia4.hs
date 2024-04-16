
--EJERCICIO 1

fibonacci:: Int -> Int
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | n >= 2 = fibonacci(n - 1) + fibonacci(n - 2)

-- EJERCICIO 2

parteEntera:: Float -> Int
parteEntera n
    |n >= 0 && n < 1 = 0
    |n >= 1 = 1 + parteEntera(n-1)
    |n < 0 && n > -1 = 0
    |n <= -1 = -1 + parteEntera(n+1)

-- EJERCICIO 3
esDivisible:: Int -> Int -> Bool
esDivisible x y
    |x == y = True
    |x < y = False
    |x > y = esDivisible (x-y) y
-- que pasa si x le resto muchas veces x

-- EJERCICIO 4
sumaImpares:: Int -> Int
sumaImpares x
    |x == 1 = 1
    |x > 1 = sumaImpares(x - 1) + (2*x - 1)

-- EJERCICIO 5
medioFact:: Int -> Int
medioFact n
    |n <= 0 = 1
    |n >= 1 = n * medioFact(n-2)

-- EJERCICIO 6
sumaDigitos:: Int -> Int
sumaDigitos n
    |n >= 0 && n < 10 = n
    |n >= 10 = sumaDigitos(div n 10) + mod n 10


-- EJERCICIO 7
todosDigitosIguales:: Int -> Bool
todosDigitosIguales n
    |n < 10 = True
--    |n >= 10 = mod (div n 10) 10 == todosDigitosIguales(mod n 10)

-- EJERCICIO 8
cantDigitos:: Int -> Int
cantDigitos n
    |n < 10 && n >= 0 = 1
    |n >= 10 = 1 + cantDigitos(div n 10)

iesimoDigito:: Int -> Int -> Int
iesimoDigito n i
    |cantDigitos n == i = mod n 10
    |otherwise = iesimoDigito (div n 10) i

-- EJERCICIO 9
--esCapicua:: Int -> Bool
