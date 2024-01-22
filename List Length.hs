

len    :: [a] -> Int
len xs = lenAcc xs 0

lenAcc          :: [a] -> Int -> Int
lenAcc []     n = n
lenAcc (_:ys) n = lenAcc ys (n+1)
