import Parcial4 (ultimo)

--EJERCICIO 1

fibonacci:: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci(n-2)

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
{--esCapicua:: Int -> Bool
esCapicua n
    | n < 100 && mod n 10 == div n 10 = True
    | n > 100 = --}

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

raizDe2Aprox:: Int -> Float
raizDe2Aprox n = sucesion n - 1

-- EJERCICIO 13
fDobleSum :: Int -> Float -> Float
fDobleSum 1 m = m
fDobleSum n m = f2 n m + f2 (n-1) m
--    |p == 1 = f2 m 1
--    |m == 1 = 0
--    |otherwise = f2 p m + f2 p (m-1) 


-- EJERCICIO 14
sumaPotencias:: Int -> Int -> Int -> Int
sumaPotencias q 1 m = auxiliarSumPot q 1 m
sumaPotencias q n m = q^(n+m) + auxiliarSumPot q (n-1) m

auxiliarSumPot:: Int -> Int -> Int -> Int
auxiliarSumPot q n 1 = q^(n+1)
auxiliarSumPot q n m = q^(n+m) + auxiliarSumPot q n (m-1)

-- EJERCICIO 15
auxiliarSumRac:: Float -> Float -> Float --(Sumatoria de un numerador fijo)
auxiliarSumRac p q
    |q == 1 = p
    |otherwise = p/q + auxiliarSumRac p (q-1)

sumaNaturales:: Float -> Float
sumaNaturales 1 = 1
sumaNaturales n = n + sumaNaturales (n-1)

sumaRacionales:: Float -> Float -> Float
sumaRacionales p q
    |p == 1 = auxiliarSumRac 1 q
    |otherwise = auxiliarSumRac p q + sumaRacionales (p-1) q 

-- EJERCICIO 16
menorDivisor:: Int -> Int
menorDivisor n
    |n == 1 = 1
    |otherwise = menorDivisorDesde n 2

menorDivisorDesde:: Int -> Int -> Int
menorDivisorDesde n m
    |mod n m == 0 = m
    |otherwise = menorDivisorDesde n (m+1)

esPrimo:: Int -> Bool
esPrimo n = n == menorDivisor n


{--sonCoprimos:: Int -> Int -> Bool
sonCoprimos 1 1 = True
sonCoprimos m n --} 

listaDivisoresDesde :: Int -> Int -> [Int] -- Me da la lista de divisores de n de manera decreciente
listaDivisoresDesde 0 _ = []
listaDivisoresDesde m n
    |n `mod` m == 0 = m : listaDivisoresDesde (m-1) n
    |otherwise = listaDivisoresDesde (m-1) n

siguientePrimo:: Int -> Int
siguientePrimo n
    |esPrimo(n+1) = n+1
    |otherwise = siguientePrimo(n+1)

nEsimoPrimo:: Int -> Int
nEsimoPrimo n
    |n == 1 = 2
    |otherwise = siguientePrimo(nEsimoPrimo(n-1))

-- EJERCICIO 17
fibAux :: Int -> Int -> Int -> Bool
fibAux n fibanterior fib
    |n == fib = True
    |n < fib = False
    |otherwise = fibAux n fib (fib+fibanterior)

esFibonacci:: Int -> Bool
esFibonacci n = fibAux n 0 1

-- EJERCICIO 18
{--mayorDigitoPar :: Int -> Int
mayorDigitoPar x 
    |x < 10 && mod x 2 == 0 = x
    |odd x = -1
    |ultimoDigito <= penultimoDigito = mayorDigitoPar (mod (eliminaDigitoImpar x) 10) 
    |ultimoDigito > penultimoDigito =  mayorDigitoPar (mod (eliminaDigitoImpar x) 10) * 10 + ultimoDigito
        where ultimoDigito = iesimoDigito (eliminaDigitoImpar x) 1
              penultimoDigito = iesimoDigito (eliminaDigitoImpar x) 2

hayDigitoImpar :: Int -> Bool
hayDigitoImpar x
    |x == 0 = False
    |odd ultimoDigito = True
    |even ultimoDigito = hayDigitoImpar (mod x (10^(cantDigitos x - 1)))
        where ultimoDigito = iesimoDigito x 1

eliminaDigitoImpar :: Int -> Int
eliminaDigitoImpar x
    |odd ultimoDigito = eliminaDigitoImpar (mod x (10^(cantDigitos x - 1)))
    |even ultimoDigito && hayDigitoImpar x = eliminaDigitoImpar (mod x (10^(cantDigitos x - 1))) * 10 + ultimoDigito
    |otherwise = x
        where ultimoDigito = iesimoDigito x 1 --}