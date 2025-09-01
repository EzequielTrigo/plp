genLista :: a -> (a -> a) -> Integer -> [a]
genLista n f 0 = []
genLista n f i = (f n) : genLista (f n) f (i-1)

desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta desde hasta = if (hasta < desde) then error "hasta debe ser mayor que desde"
                         else genLista desde (\x -> x+1) (hasta-desde)