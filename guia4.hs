
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

-- EJERCICIO 10
f1:: Int -> Int
f1 n
    |n == 0 = 1
    |otherwise = 2^n + f1(n-1)

f2:: Int -> Int -> Int
f2 n q
    |n == 1 = q
    |otherwise = q^n + f2 (n-1) q

{-- f3:: Int -> Int -> Int
f3 n q
    |--}

-- EJERCICIO 13
fDobleSum:: Int -> Int -> Int
fDobleSum m p
    |p == 1 = f2 m 1
--    |m == 1 = 0
    |otherwise = f2 p m + f2 p (m-1) 

-- EJERCICIO 16
-- menorDivisor:: Int -> Int
-- menorDivisor n
-- (Necesito función auxiliar (menorDivisorDesde m n) desde el 2 hacia arriba)
