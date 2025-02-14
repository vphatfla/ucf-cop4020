-- part 1

isPrime :: Int -> Bool
isPrime n
    | n < 2 = False
    | otherwise = null [x | x <- [2..floor (sqrt (fromIntegral n))], n `mod` x == 0]

problem1 :: Int -> [Int]
problem1 count = take count [p | (p, i) <- zip primes [0..], even i]
  where
    primes = [x | x <- [2..], isPrime x]

-- part 2

fiboTo :: Int -> [Int]
fiboTo n = fibHelper 1 1
  where
    fibHelper a b
      | a > n     = []
      | otherwise = a : fibHelper b (a + b)

problem2 :: Int -> [Int]
problem2 n = filter (\x -> x `mod` 10 == 3) (fiboTo n)

-- part 3

isMulFive :: Int -> Bool
isMulFive x = x `mod` 5 == 0

threeFac :: Int -> Bool
threeFac n = isPerfectSquare n && isPrime (integerSquareRoot n)
  where
    isPerfectSquare x = (round . sqrt $ fromIntegral x) ^ 2 == x
    integerSquareRoot x = floor . sqrt $ fromIntegral x
    isPrime p
      | p < 2     = False
      | otherwise = null [d | d <- [2..floor (sqrt (fromIntegral p))], p `mod` d == 0]

problem3 :: Int -> [Int]
problem3 n = [x | x <- [1..n], isMulFive x || threeFac x]

main :: IO ()
main = do
    print( problem1 10)
    
    print( problem2 10000)
    
    print( problem3 100)

