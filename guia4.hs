
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

f2:: Int -> Float -> Float
f2 n q
    |n == 1 = q
    |otherwise = q^n + f2 (n-1) q

f3:: Int -> Float -> Float
f3 n q
    |n == 1 = q^2 + q
    |otherwise = q^(2*n) + q^(2*n - 1) + f3 (n-1) q

f4:: Int -> Float -> Float
f4 n q
    |n == 1 = q+1
    |otherwise = f2 (2*n) q - f2(n-1) q

-- EJERCICIO 11
{--
problema eAprox{n:Z} R {
requiere:{n >= 0}
asegura: {res= sumatoria de 1/i! hasta n}
}
--}

factorial:: Int -> Int
factorial n
    |n == 0 = 1
    |otherwise = n * (factorial (n-1))

eAprox:: Int -> Float
eAprox n
    |n == 0 = 1
    |otherwise = 1/fromIntegral(factorial(n)) + eAprox(n-1) 

e = eAprox (10)

-- EJERCICIO 12
{--
problema sucesion{n:Z} :R {
requiere: {n > 0}
asegura: {res = la sucesión an}
}

problema raizDe2Aprox {m:Z} :R {
    requiere:{m > 0}
    asegura: {res = sucesion(m) ~~ sqrt(2)}
}--} 

sucesion:: Int -> Float
sucesion n
    |n == 1 = 2
    |otherwise = 2 + 1/sucesion(n-1) 
--    |otherwise = 2 + (1/(sucesion n-1))

raizDe2Aprox:: Int -> Float
raizDe2Aprox n = sucesion n - 1

-- EJERCICIO 14
sumaPotencias:: Int -> Int -> Int -> Int
sumaPotencias q n m
    |n == 1 && m == 1 = q^2
--    |otherwise = q^(n + m) + sumaPotencias q n (m-1)

-- EJERCICIO 13
{-- fDobleSum :: Float -> Float -> Float
fDobleSum p m
    |p == 1 = f2 m 1
--    |m == 1 = 0
    |otherwise = f2 p m + f2 p (m-1) 
--}
-- EJERCICIO 16
-- menorDivisor:: Int -> Int
-- menorDivisor n
-- (Necesito función auxiliar (menorDivisorDesde m n) desde el 2 hacia arriba)