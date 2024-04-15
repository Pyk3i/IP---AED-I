fibonacci:: Int -> Int
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | n >= 2 = fibonacci(n - 1) + fibonacci(n - 2)

parteEntera:: Float -> Int
parteEntera n
    |n >= 0 && n < 1 = 0
    |n >= 1 = 1 + parteEntera(n-1)
    |n < 0 && n > -1 = 0
    |n <= -1 = -1 + parteEntera(n+1)

esDivisible:: Int -> Int -> Bool
esDivisible x y
    |x == y = True
    |x < y = False
-- que pasa si x le resto muchas veces x


