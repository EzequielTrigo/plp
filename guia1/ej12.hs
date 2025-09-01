data AB a = Nil | Bin (AB a) a (AB a)

foldAB :: (b-> a -> b -> b) -> b -> AB a -> b
foldAB f c Nil = c
foldAB f c (Bin der r izq) = f (foldAB f c der) r (foldAB f c izq) 

recAB :: (b -> AB a -> a -> b -> AB a -> b) -> b -> AB a ->b
recAB _ c Nil = c
recAB f c (Bin der r izq) = f (rec der) der r (rec izq) izq
    where rec = recAB f c

esNil :: AB a -> Bool
esNil t =
    case t of
        Nil -> True
        _ -> False

altura :: AB a -> Int
altura tree = foldAB (\x v y -> if x > y then x + 1 else y + 1) 0 tree

cantNodos :: AB a -> Int
cantNodos tree = foldAB (\x v y -> x + y + 1) 0 tree