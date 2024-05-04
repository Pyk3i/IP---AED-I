import Test.HUnit
import Parcial4

testPorcentajeAfirmativo = test [
 "Todos votos en blanco" ~: porcentajeDeVotosAfirmativos [("a", "b"), ("c","d")] [0,0] 30 ~?= 0,
 "No hay votos" ~: porcentajeDeVotosAfirmativos [("a", "b"), ("c","d")] [0,0] 0 ~?= 0,
 "No hay votos en blanco" ~: porcentajeDeVotosAfirmativos [("a", "b"), ("c","d")] [20,30] 50 ~?= 100,
 "Caso genérico" ~: porcentajeDeVotosAfirmativos [("a", "b"), ("c","d")] [10,20] 60 ~?= 50
 ]

testFormulasInvalidas = test [
 "Formula Valida" ~: formulasInvalidas [("a", "b"), ("c", "d")] ~?= False,
 "Formula Repetida" ~: formulasInvalidas [("a", "d"), ("a", "d")] ~?= True,
 "Presidente Repetido" ~: formulasInvalidas [("a", "b"), ("a", "d")] ~?= True,
 "Vice Repetido" ~: formulasInvalidas [("a", "b"), ("c", "b"), ("d", "e")] ~?= True
 ]

testPorcentajeVotos = test [
 "Un solo vice" ~: porcentajeDeVotos "b" [("a", "b")] [76] ~?= 100,
 "Vice sin votos" ~: porcentajeDeVotos "d" [("a", "b"), ("c","d")] [100,0] ~?= 0,
 "Caso genérico" ~: porcentajeDeVotos "b" [("a", "b"), ("c","d")] [100,25] ~?= 80
 ]

testMenosVotado = test [
 "Una sola formula" ~: menosVotado [("a", "b")] [100] ~?= "a",
 "Caso generico" ~: menosVotado [("a", "b"), ("c","d"), ("e","f")] [67,24,8] ~?= "e",
 "Empate" ~: menosVotado [("a", "b"), ("c","d")] [50,50] ~?= "Ninguno"
 ]