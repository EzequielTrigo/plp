normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)

curryf ::  ((a,b)->c) -> (a->b->c)
curryf f a b = f (a,b)

uncurryf :: (a->a->a) ->(a,a)->a
uncurryf f (a,b) = f a b