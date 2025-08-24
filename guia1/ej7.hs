curryf ::  ((a,b)->c) -> (a->b->c)
curryf f a b = f (a,b)

uncurryf :: (a->b->c) ->(a,b)->c
uncurryf f (a,b) = f a b

mapPares :: (a->b->c) ->[(a,b)]->[c]
mapPares f xs = foldr (\x accum-> (uncurryf f x):accum) [] xs

armarPares :: [a] -> [b] -> [(a,b)]
armarPares [] _ = []
armarPares _ [] = []
armarPares(x:xs) (y:ys) = (x,y) : armarPares xs ys

mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f xs ys = mapPares f (armarPares xs ys)