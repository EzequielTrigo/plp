data RoseTree a = Rose a [RoseTree a] deriving (Show)

foldRT :: ([b] -> a -> b) ->(a -> b) -> RoseTree a -> b 
foldRT f c (Rose a []) = c a
foldRT f c (Rose val xs)= f ((map (foldRT f c)) xs) val  

hojas ::  RoseTree a -> [RoseTree a]
hojas = foldRT (\xs y -> (foldr (\x rec -> x ++ rec) [] xs) ) (\x -> [Rose x []])

altura :: RoseTree a -> Int
altura tree = foldRT (\xs _ -> maximum xs + 1 ) (const 1) tree