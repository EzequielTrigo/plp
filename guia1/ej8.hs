sumarCadaElemento :: Num a=>[a] -> [a] -> [a]
sumarCadaElemento _ [] = []
sumarCadaElemento [] _ = []
sumarCadaElemento (x:xs) (y:ys) = (x+y) : sumarCadaElemento xs ys

sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat xs ys  = zipWith (\x y -> sumarCadaElemento x y) xs ys

--trasponer