leadSix :: Integer -> Bool
leadSix n = head (show n) == '6'

solveProblem1 :: Integer -> [Integer]
solveProblem1 n = [x | x <- [1..n], 
                       x `mod` 2 == 0,        
                       x `mod` 5 == 0,        
                       leadSix x]       
main :: IO ()
main = do
  print $ solveProblem1 10000  
  print $ solveProblem1 100000 

