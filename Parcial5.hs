
module Parcial5 where 
import Data.Char

-- EJERCICIO 1 
cantMinuscula :: String -> Int
cantMinuscula "" = 0
cantMinuscula (x:xs)
    |esMin x = 1 + cantMinuscula xs
    |otherwise = cantMinuscula xs

-- EJERCICIO 2
maximoCambios :: [String] -> String
maximoCambios [x] = x
maximoCambios (x:y:xs)
    |cantMinuscula x <= cantMinuscula y = maximoCambios (y:xs)
    |otherwise = maximoCambios (x:xs)

-- EJERCICIO 3
desplazar :: Char -> Int -> Char 
desplazar letra n
    |noEsLetra letra abecedario = letra
    |n > 0 && n <= 25 && cantLetrasHastaZ < n = desplazar 'a' (n - cantLetrasHastaZ - 1)
    |n < 0 && n >= (-25) && cantLetrasHastaA < -n = desplazar 'z' (n + cantLetrasHastaA + 2)
    |n == 0 = letra
    |otherwise && n > 0 = desplazar sigLetra (n-1)
    |otherwise && n < 0 = desplazar antLetra (n+1)
        where cantLetrasHastaZ = 25 - (charANat letra)
              cantLetrasHastaA = (charANat letra) - 1
              sigLetra = natAChar (charANat letra + 1)
              antLetra = natAChar (charANat letra - 1)
              abecedario = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

noEsLetra :: Char -> [String] -> Bool
noEsLetra _ [] = True
noEsLetra x (y:ys)
    |x == head y = False
    |otherwise = noEsLetra x ys

distanciaDeZ :: String -> Int
distanciaDeZ xs
    |xs == "z" = 0
    |otherwise = 1 + distanciaDeZ [siguienteLetra]
        where siguienteLetra = natAChar (charANat (head xs) + 1)

distanciaDeA :: String -> Int
distanciaDeA xs
    |xs == "a" = 0
    |otherwise = 1 + distanciaDeA [letraAnterior]
        where letraAnterior = natAChar (charANat (head xs) - 1)

-- EJERCICIO 4
codificar :: String -> Int -> String
codificar "" _ = ""
codificar (x:xs) n 
    |esMin x = desplazar x n : codificar xs n
    |otherwise = x : codificar xs n


-- EJERCICIO 5
decodificar :: String -> Int -> String
decodificar "" _ = ""
decodificar (x:xs) n 
    |esMin x = desplazar x (-n) : decodificar xs n
    |otherwise = x : decodificar xs n


-- //////////////// AUXILIARES ///////////////////
esMin :: Char -> Bool
esMin a = ord a >= ord 'a' && ord a <= ord 'z'
charANat :: Char -> Int
charANat a | esMin a = (ord a) - (ord 'a')
natAChar :: Int -> Char
natAChar n | 0 <= n && n <= 25 = chr ((ord 'a' )+n)
natAChar1 :: Int -> Char
natAChar1 n | (-25) <= n && n < 0 = chr ((ord 'z' )+n)