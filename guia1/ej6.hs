recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna _ [] = [] 
sacarUna x (y:ys) = if x==y then ys else y : sacarUna x ys

sacarUnaRec :: Eq a=> a-> [a] -> [a]
sacarUnaRec aSacar ys = 
    recr (\x xs accum-> if (x==aSacar) then xs else x:accum) [] ys

--b como no tenes el resto de la lista no podes reconstruirla

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado agregar ys =
     recr (\x xs accum -> if (agregar>x) then x:accum else agregar:x:xs) [agregar] ys