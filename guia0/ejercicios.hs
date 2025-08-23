
valorAbsoluto :: Float -> Float
valorAbsoluto a = if (a<0)
                then (-a)
                else a

bisiesto :: Int  -> Bool
bisiesto a = if (mod a 4 ==0)
                then if(mod a 100==0)
                    then if(mod a 400==0)
                         then True
                         else False
                    else True 
                else False

factorial :: Int -> Int
factorial 1 = 1
factorial a = a * factorial (a-1)

menorFactorPrimoDesde :: Int -> Int -> Int
menorFactorPrimoDesde a b = if (mod a b == 0)
                            then b
                            else menorFactorPrimoDesde a (b+1)

cantidaDeDivisoresPrimos :: Int -> Int
cantidaDeDivisoresPrimos 1 = 0
cantidaDeDivisoresPrimos a = 1 + cantidaDeDivisoresPrimos (div a (menorFactorPrimoDesde a 2))

inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso a = Just (1 / a)

aEntero :: Either Int Bool -> Int
aEntero (Left a) = 1
aEntero  (Right b) = 0

data AB a = Nil | Bin (AB a) a (AB a)  deriving Show


vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

negar :: Bool  -> Bool
negar False = True
negar True = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin izq v der)= Bin (negacionAB izq) (negar v) (negacionAB der)