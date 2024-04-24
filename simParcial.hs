relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False
relacionesValidas [(x , y)]
    |x == y = False
    |otherwise = True
relacionesValidas[(a , b) , (c , d)]
    |fst (a,b) == fst (c,d) && snd (a,b) == snd (c,d) = False
    |fst (a,b) == snd (c,d) && snd (a,b) == fst (c,d) = False
    |otherwise = True

personas :: [(String, String)] -> [String]
personas [] = ["nadie"]
personas [(x , y)]
    |relacionesValidas [(x , y)] = [x , y]
personas [(a , b) , (c , d)]
    |relacionesValidas lista = quitarRepetidos([a,b,c,d]) 
        where lista = [(a,b) , (c,d)]

quitarRepetidos:: [String] -> [String]
quitarRepetidos [] = []
quitarRepetidos (x:xs)
    |perteneceLista x xs = quitarRepetidos xs
    |otherwise = x : quitarRepetidos xs


perteneceLista :: String -> [String] -> Bool -- Auxiliar para verificar que el nombre está en una lista
perteneceLista _ [] = False
perteneceLista x (y:xs)
    |x == y = True
    |otherwise = perteneceLista x xs

amigosDe :: String -> [(String, String)] -> [String]
amigosDe "nadie" [] = ["nadie"]
amigosDe x [(y , z)]
    |relacionesValidas [(y,z)] && x == y = [z]
    |relacionesValidas [(y,z)] && x == z = [y]
{--amigosDe x [(a,b) , (c,d)]
    |not perteneceLista x --}


personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo" 