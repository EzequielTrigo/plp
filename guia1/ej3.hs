foldSum :: [Int] -> Int
foldSum = foldr (+) 0

foldElem :: Int -> [Int] -> Bool
foldElem x = foldr (\elemento bool-> (elemento==x)||bool) False

foldConcat :: [a] -> [a] -> [a]
foldConcat xs = foldr (\y accum-> y:accum) xs 

foldFilter :: (a -> Bool) -> [a] -> [a]
foldFilter pred = foldr (\x res -> if (pred x) then x:res else res) []

foldMapa :: (a -> b) -> [a] -> [b]
foldMapa func = foldr (\x res -> (func x):res) []

mejorSegún :: (a -> a -> Bool) -> [a] -> a
mejorSegún esMejor xs= foldr1 (\x y-> if (esMejor x y) then x else y) xs 

sumaParcial :: Num a => [a] -> [a]
sumaParcial = foldl (\ys x -> case ys of
                              (y:_) -> ys ++ [x + last ys] 
                              [] -> [x]) []

sumaAlt :: Num a=> [a] -> a 
sumaAlt xs = foldr (-) 0 (xs)

sumaAltInversa :: Num a => [a] -> a 
sumaAltInversa xs =(foldl (flip(-)) 0 (xs))

--permutaciones :: [a] -> [[a]]
--permutaciones [x,y] = [[x,y],[y,x]]
--permutaciones (y:ys) = concatMap (\xs -> permutaciones (tail xs)) y
--reveer punto 4



