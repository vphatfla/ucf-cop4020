checkIfPrime :: Integer -> Bool
checkIfPrime n = n > 1 && all (\x -> n `mod` x /= 0) [2..isqrt n]
  where isqrt = floor . sqrt . fromIntegral

checkPalin :: Integer -> Bool
checkPalin n = show n == reverse (show n)

sumEven :: Integer -> Integer
sumEven n = sum [read [x] | x <- show n, read [x] `mod` 2 == 0]

solveProblem2 :: Integer -> Integer
solveProblem2 n = sum [sumEven x | x <- [2..n], checkIfPrime x, checkPalin x]

main :: IO ()
main = do
    print $ "n=100000: " ++ show (solveProblem2 100000)
    print $ "n=1000000: " ++ show (solveProblem2 1000000)
