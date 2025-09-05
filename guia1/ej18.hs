paresDeNat :: [(Int,Int)]
paresDeNat = [(x,y) | c <- [0..], x <- [0..c], y <- [0..c], (x + y) == c]