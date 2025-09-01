data Polinomio a = X
                 | Cte a
                 | Suma (Polinomio a) (Polinomio a)
                 | Prod (Polinomio a) (Polinomio a)

evaluar ::  Int -> Polinomio Int -> Int
evaluar x (X) = x
evaluar x (Cte y)=y
evaluar x (Suma (y) (z))= (evaluar x y ) + (evaluar x z)
evaluar x (Prod (y) (z))= (evaluar x y ) * (evaluar x z)