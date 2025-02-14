-- part 1
doubleNu :: [Int] -> [Int]
doubleNu = map (*2)

-- part 2
getEven :: [Int] -> [Int]
getEven = filter even

-- part 3

mulThree :: [Int] -> [Int]
mulThree = map (* 3)

-- part 4

sSqOdds :: [Int] -> Int
sSqOdds = sum . map (^ 2) . filter odd

main :: IO ()
main = do 
    print(doubleNu [1,5,-18,99])
    print (getEven [1..100])
    print (mulThree [1,3..77])
    print (sSqOdds [1,2,3,4,5,7,8,1,43,25,65,22])
