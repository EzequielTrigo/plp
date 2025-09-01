foldNat :: Num (a)=>(a-> b -> b) -> b -> [a] -> b
foldNat _ z [] = z
foldNat f z (x:xs) = f x (foldNat f z xs)

potencia :: [Int] -> Int -> [Int]
potencia xs y = foldNat (\x rec-> x^y : rec) [] xs 