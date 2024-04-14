todoMenor:: (Float , Float) -> (Float , Float) -> Bool
todoMenor (a,b) (c,d) = a < c && b < d
 -- Con fst y snd
 -- todoMenor p q = fst p < fst q && snd p < snd q

posPrimerPar:: (Int , Int , Int) -> Int
posPrimerPar (x, y, z) 
    | mod x 2 == 0 = 1
    | mod y 2 == 0 = 2
    | mod z 2 == 0 = 3
    | otherwise = 4

bisiesto:: Int -> Bool
bisiesto a = mod a 4 == 0 
-- O, también: bisiesto a = mod a 100 == 0 && mod a 400 == 0

absoluto:: Float -> Float
absoluto x 
    | x < 0 = -x
    | otherwise = x

distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = absoluto((a-d)) + absoluto((b-e)) + absoluto((c-f))
-- (Puedo hacer guardas pero es más pesados, mejor usar una funciòn que me ayude con los negativos)

maximoabsoluto:: Float -> Float -> Float
maximoabsoluto x y 
    | absoluto(x) < absoluto(y) = absoluto(y)
    | otherwise = absoluto(x)

maximo3:: Float -> Float -> Float -> Float
maximo3 x y z
    | x > y && x > z = x
    | y > x && y > z = y
    | otherwise = z

algunoEs0:: Float -> Float -> Float -> Float -> Int
algunoEs0 a b c d
    | a / b == 0 = 1
    | c / d == 0 = 2
    | otherwise = 3

ambosSon0:: Int -> Int -> Int -> Int -> Bool --Tengo que hacerlo con pattern matching y otro con guardas
ambosSon0 a b c d = div a b == 0 && div c d == 0

ambosSon0_v2:: Int -> Int -> Int -> Int -> Bool
ambosSon0_v2 a b c d 
    | div a b == 0 && div c d == 0 = True
    | otherwise = False

mismoIntervalo:: Float -> Float -> Bool
mismoIntervalo a b 
    | a <= 3 && b <= 3 = True
    | 3 < a && a <= 7 && 3 < b && b <= 7 = True
    | a > 7 && b > 7 = True
    | otherwise = False

esMultiploDe:: Int -> Int -> Bool
esMultiploDe a b = a > 0 && b > 0 && mod a b == 0

digitoUnidades:: Int -> Int
digitoUnidades a
    | a > -10 && a < 0 = -a
    | a < 10 && a > 0 = a
    | a >= 10 =  a - (div a 10 * 10)
    | a <= -10 = -a - (div (-a) 10 * 10)
    | otherwise = 0

digitoDecenas:: Int -> Int
digitoDecenas a
    | a > -10 && a < 10 = 0
--    | a < 100 && a >= 10 = div a 10 
--    | a > -100 && a <= -10 = div (-a) 10 
    | a >= 10 = digitoUnidades(div a 10)
    | a <= -10 = digitoUnidades(div (-a) 10)  

estanRelacionados:: Int -> Int -> Bool
estanRelacionados a b = mod (a*a) (a*b) == 0

prodInt:: (Float , Float) -> (Float , Float) -> Float
prodInt (a,b) (c,d) = a*c + b*d

distanciaPuntos:: (Float , Float) -> (Float , Float) -> Float
distanciaPuntos (a,b) (c,d) = sqrt((c-a)*(c-a) + (d-b)*(d-b))

sumaTernas:: (Int , Int , Int) -> Int
sumaTernas (a, b, c) = a + b + c

crearPar:: Float -> Float -> (Float, Float)
crearPar a b = (a,b)

-- (Ejercicio 5)

f:: Int -> Int
f n
    |n <= 7 = n*n
    |n > 7 = 2*n - 1

g:: Int -> Int
g n
    |mod n 2 == 0 = div n 2
    |otherwise = 3*n + 1

todosMenores:: (Int, Int, Int) -> Bool
todosMenores (a, b, c) = f a > g a && f b > g b && f c > g c

-- Ejercicio 8
sumaUltimosDosDigitos:: Int -> Int
sumaUltimosDosDigitos x = mod (abs x) 10 + mod (div (abs x) 10) 10

comparar:: Int -> Int -> Int
comparar a b
    |sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
    |sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
    |sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0

-- sumarSoloMultiplos:: (Int , Int , Int) -> Int -> Int