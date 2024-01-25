bst :: Int -> Integer
bst = (map f [0..] !!)
    where
        f 0 = 1
        f 1 = 1
        f n = sum [ bst (i-1) * bst (n-i) | i <- [1..n]] `mod` (10^8 + 7) 
        
main :: IO()
main = do
    raw <- getContents
    mapM_ print $ map bst $ tail $ map (read :: String -> Int) $ lines raw
