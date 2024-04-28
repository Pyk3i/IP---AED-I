relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs)
    |perteneceListadeTupla x xs || perteneceListadeTupla (inversoTupla x) xs = False
    |otherwise = relacionesValidas xs

personas :: [(String, String)] -> [String]
personas [] = []
personas ((a,b):xs)
    |relacionesValidas ((a,b):xs) = quitarRepetidos ( a : b : personas xs )

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe x ((a,b):xs)
    |relacionesValidas((a,b):xs) && x == a = quitarRepetidos (b : amigosDe x xs)
    |relacionesValidas((a,b):xs) && x == b = quitarRepetidos (a : amigosDe x xs)
    |otherwise && relacionesValidas((a,b):xs) = quitarRepetidos (amigosDe x xs) 

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo"
personaConMasAmigos xs
    |relacionesValidas xs = masRepetido (pasarTuplaALista xs)

    
-- ////////// AUXILIARES ////////////
masRepetido:: [String] -> String
masRepetido (x:[]) = x
masRepetido (x:xs)
    |repeticionesX <= repeticionesY && x /= head xs = masRepetido (quitarMenosRepetidos (x:xs))
    |repeticionesX >= repeticionesY && x /= head xs = masRepetido (quitarMenosRepetidos (x:xs))
    |otherwise = x
        where repeticionesX = repeticionesListaDe x (x:xs)
              repeticionesY = repeticionesListaDe (distintoMasCercano x (x:xs)) (x:xs)


quitarMenosRepetidos :: [String] -> [String]
quitarMenosRepetidos [] = []
quitarMenosRepetidos (x:xs)
    |repeticionesX < repeticionesY = quitarRepetidosDe x (x:xs)
    |repeticionesX > repeticionesY = quitarRepetidosDe (distintoMasCercano x xs) (x:xs)
    |otherwise = quitarRepetidosDe x (x:xs)
        where repeticionesX = repeticionesListaDe x (x:xs)
              repeticionesY = repeticionesListaDe (distintoMasCercano x xs) xs

compararRepeticiones :: [String] -> String --Compara repeticiones con el proximo elemento distinto de x
compararRepeticiones (x:xs)
    |repeticionesListaDe x (x:xs) < repeticionesListaDe (distintoMasCercano x xs) (x:xs) = distintoMasCercano x (x:xs)
    |otherwise = x

repeticionesListaDe:: String -> [String] -> Int
repeticionesListaDe _ [] = 0
repeticionesListaDe x (y:xs)
    |x == y = 1 + repeticionesListaDe x xs
    |otherwise = repeticionesListaDe x xs


distintoMasCercano :: String -> [String] -> String
distintoMasCercano _ [] = ""
distintoMasCercano x (y:xs)
    |x /= y = y
    |otherwise = distintoMasCercano x xs

pasarTuplaALista :: [(String, String)] -> [String]
pasarTuplaALista [(x,y)] = [x,y]
pasarTuplaALista ((a,b):xs) = a : b : pasarTuplaALista xs

contarAmigos :: String -> [(String , String)] -> Int
contarAmigos _ [] = 0
contarAmigos x ((a,b):xs)
    |perteneceTupla x (a,b) && relacionesValidas ((a,b):xs) = 1 + contarAmigos x xs
    |otherwise && relacionesValidas((a,b):xs) = contarAmigos x xs

quitarRepetidos:: [String] -> [String]
quitarRepetidos [] = []
quitarRepetidos (x:xs)
    |perteneceLista x xs = quitarRepetidos xs
    |otherwise = x : quitarRepetidos xs

perteneceTupla :: String -> (String, String) -> Bool
perteneceTupla x (a,b)
    |x == a || x == b = True
    |otherwise = False

perteneceListadeTupla:: (String , String) -> [(String , String)] -> Bool
perteneceListadeTupla (_,_) [] = False
perteneceListadeTupla y (x:xs)
    |y == x = True
    |otherwise = perteneceListadeTupla y xs

inversoTupla :: (String, String) -> (String , String)
inversoTupla (a,b) = (b,a)

perteneceLista :: String -> [String] -> Bool -- Auxiliar para verificar que el nombre está en una lista
perteneceLista _ [] = False
perteneceLista x (y:xs)
    |x == y = True
    |otherwise = perteneceLista x xs

quitarRepetidosDe:: String -> [String] -> [String]
quitarRepetidosDe _ [] = []
quitarRepetidosDe x (y:xs)
    |x == y = quitarRepetidosDe x xs
    |otherwise = y : quitarRepetidosDe x xs