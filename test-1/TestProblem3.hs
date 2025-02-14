import Data.List (nub)

checkIfPrime :: Int -> Bool
checkIfPrime n
  | n < 2 = False
  | otherwise = null [x | x <- [2..floor (sqrt (fromIntegral n))], n `mod` x == 0]

uniquePriFac :: Int -> [Int]
uniquePriFac n = nub [x | x <- [2..n-1], n `mod` x == 0, checkIfPrime x]

sumPriFac :: Int -> Int
sumPriFac n = sum (concat [uniquePriFac x | x <- [2..n-1]])

main :: IO ()
main = do
   print $ sumPriFac 3000




















