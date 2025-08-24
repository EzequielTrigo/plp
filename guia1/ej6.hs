recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna _ [] = [] 
sacarUna x (y:ys) = if x==y then ys else y : sacarUna x ys

sacarUnaRec :: Eq a=> a-> [a] -> [a]
sacarUnaRec aSacar ys = recr (\x xs accum-> if (x==aSacar) then xs else x:accum) [] ys
--b por el corte, no deja, pero se podria usando un acumulador del tipo (Bool,[])