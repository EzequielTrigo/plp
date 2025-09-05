data AIH a = Hoja a | Bin (AIH a) (AIH a)

foldAIH :: (b -> b -> b) -> (a -> b) -> AIH a -> b
foldAIH f c (Hoja a) = c a
foldAIH f c (Bin der izq) = f (foldAIH f c der) (foldAIH f c izq) 

altura ::  AIH a -> Integer 
altura tree = foldAIH (\x y -> if x > y then x +1 else y+1 ) (\x -> 1) tree

tamaño :: AIH a -> Integer
tamaño tree = foldAIH (\x y -> x+y) (const 1) tree