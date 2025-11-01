listasQueSuman :: Int -> [[Int]]
listasQueSuman 0 = [[]]
listasQueSuman n =
  [ k : resto
  | k <- [1..n]
  , resto <- listasQueSuman (n - k)
  ] 

listasDeEnterosPositivos :: [[Int]]
listasDeEnterosPositivos = [x | n<-[1..], x <- listasQueSuman n]