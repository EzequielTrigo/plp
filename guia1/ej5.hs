elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares xs  =
     snd (foldr (\x (contador, res)-> if (mod contador 2)==1 then (contador+1,res) else (contador+1, x:res)) (1,[]) xs)

--la otra no es estructurada porque utiliza otra lista o no, preguntar