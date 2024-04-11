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

--sumaUltimosDigitos 

--comparar:: Int -> Int -> Int
-- Necesito sumaUltimosDigitos primero para hacerlo 
