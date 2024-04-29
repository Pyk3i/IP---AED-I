import Test.HUnit
import Parcial
import Parcial (personaConMasAmigos)


main = runTestTT tests

-- "nombre" ~: (funcion parametros) ~?= resultado_esperado

tests = test [
  "componentes repetidas" ~: (relacionesValidas [("ana", "ana")]) ~?= False,
  "tupla repetida" ~: (relacionesValidas [("ana", "pedro"), ("ana", "pedro")]) ~?= False,
  "tupla repetida invertida" ~: (relacionesValidas [("ana", "pedro"), ("pedro", "ana")]) ~?= False,
  "todas diferentes" ~: (relacionesValidas [("ana", "pedro"), ("ana", "carlos")]) ~?= True
  ]

testpersonas = test [
    "una tupla valida" ~: (personas [("juan", "pedro")]) ~?= ["juan", "pedro"],
    "tuplas diferentes" ~: (personas [("juan", "pedro") , ("martin", "ana")]) ~?= ["juan", "pedro", "martin", "ana"],
    "tuplas con nombres repetidos" ~: (personas [("juan", "ana") , ("juan", "pedro"), ("ana", "martin")]) ~?= ["juan", "pedro", "ana","martin"],
    "lista vacia" ~: (personas []) ~?= []
  ]

testamigosDe = test [
  "lista vacia" ~: (amigosDe "_" []) ~?= [],
  "caso valido" ~: (amigosDe "juan" [("juan", "ana") , ("juan", "pedro"), ("ana", "martin")]) ~?= ["ana", "pedro"],
  "no tiene amigos" ~: (amigosDe "andres" [("juan", "ana") , ("juan", "pedro"), ("ana", "martin")]) ~?= []
  ]

testpersonaConMasAmigos = test [
  "caso valido" ~: (personaConMasAmigos [("juan", "ana") , ("juan", "pedro"), ("juan", "martin")]) ~?= "juan",
  "empate" ~: (personaConMasAmigos [("juan", "ana") , ("juan", "pedro"), ("ana", "martin")]) ~?= "ana",
  "empate con una tupla" ~: (personaConMasAmigos [("juan", "ana")]) ~?= "ana"
  ]
-- -- EJEMPLOS

-- USUARIO1 = "JUAN"
-- USUARIO2 = "NATALIA"
-- USUARIO3 = "PEDRO"

-- RELACION1_2 = (USUARIO1, USUARIO2)
-- RELACION1_1 = (USUARIO1, USUARIO1)
-- RELACION1_3 = (USUARIO1, USUARIO3)


-- -- FUNCIONES PARA TESTING, NO BORRAR
-- -- EXPECTANY PERMITE SABER SI EL ELEMENOT QUE DEVUELVE LA FUNCIÓN ES ALGUNO DE LOS ESPERADOS
-- EXPECTANY ACTUAL EXPECTED = ELEM ACTUAL EXPECTED ~? ("EXPECTED ANY OF: " ++ SHOW EXPECTED ++ "\N BUT GOT: " ++ SHOW ACTUAL)


-- -- SONIGUALES PERMITE VER QUE DOS LISTAS SEAN IGUALES SI NO IMPORTA EL ORDEN
-- QUITAR :: (EQ T) => T -> [T] -> [T]
-- -- REQUIERE X PERTENECE A Y
-- QUITAR X (Y:YS)
-- | X == Y = YS
-- | OTHERWISE = Y : QUITAR X YS

-- INCLUIDO :: (EQ T) => [T] -> [T] -> BOOL
-- INCLUIDO [] L = TRUE
-- INCLUIDO (X:C) L = ELEM X L && INCLUIDO C (QUITAR X L)

-- SONIGUALES :: (EQ T) => [T] -> [T] -> BOOL
-- SONIGUALES XS YS = INCLUIDO XS YS && INCLUIDO YS XS 
