foldNat :: (Eq a, Num a) => (a-> a) -> a -> a -> a
foldNat _ z 0 = z
foldNat f z n = f (foldNat f z (n-1))

potencia :: Int -> Int -> Int
potencia x y = foldNat (\z -> z * x) 1 y 