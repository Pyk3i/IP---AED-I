import ParcialEquipos
import Test.HUnit

--main = runTestTT test 

testSuplentes = test [
 "Caso normal" ~: atajaronSuplentes [("Club1", "ArqueroSup1"), ("Club2", "ArqueroSup2")] [5,4] 17 ~?= 8,
 "Caso base (Cero PJs)" ~: atajaronSuplentes [("Club1", "ArqueroSup1"), ("Club2", "ArqueroSup2")] [] 0 ~?= 0
 ] 

testEquiposValidos = test [
 "Entrada valida" ~: equiposValidos [("Club1", "Arquero1"), ("Club2", "Arquero2"), ("Club3", "Arquero3")] ~?= True,
 "Club Repetido" ~: equiposValidos [("Club1", "Arquero1"), ("Club2", "Arquero2"), ("Club2", "Arquero3")] ~?= False,
 "Arquero Repetido" ~: equiposValidos [("Club1", "Arquero1"), ("Club2", "Arquero1"), ("Club3", "Arquero3")] ~?= False,
 "Arquero con nombre de Club" ~: equiposValidos[("Club1", "Arquero1"), ("Club2", "Club1"), ("Club3", "Arquero3")] ~?= False
 ]

testPorcentaje = test [
 "Caso Base" ~: porcentajeDeGoles "Arquero1" [("Club1", "Arquero1")] [10] ~?= 100.0,
 "Caso cualquiera" ~: porcentajeDeGoles "Arquero1" [("Club1", "Arquero1"), ("Club2", "Arquero2"), ("Club3", "Arquero3")] [40,20,20] ~?= 50.0
 ]

testVallaMenosVencida = test [
 "Caso Base" ~: vallaMenosVencida [("Club1", "Arquero1")] [13] ~?= "Arquero1",
 "Caso Cualquiera" ~: vallaMenosVencida [("Club1", "Arquero1"), ("Club2", "Arquero2"), ("Club3", "Arquero3")] [13,8,10] ~?= "Arquero2"
 ]