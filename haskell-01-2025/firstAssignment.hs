import Distribution.SPDX (LicenseId(MPL_2_0, OLDAP_2_6))
-- 1
mulTwoNum :: Int -> Int -> Int
mulTwoNum x y = x * y 
-- 2
mulThreeNum :: Int -> Int -> Int -> Int
mulThreeNum x y z = x * y * z 
-- 3
first_a :: Int -> [Int]
first_a n = [x | x <- [1..n], x `mod` 6 == 0 || x `mod` 11 == 0 ]

-- 4
isMult6Or11 :: Int -> Bool
isMult6Or11 x = x `mod` 6 == 0 || x `mod` 11 == 0

first_b :: Int -> [Int]
first_b n = [ x | x <- [1..n], isMult6Or11 x]

-- 5 
second_a :: Int -> [Int]
second_a n = [x | x <- [1..n], show x == reverse(show x) && head (show x) == '3']

-- 6
isPalindromeThatStartsWithDigit3 :: Int -> Bool
isPalindromeThatStartsWithDigit3 x = show x == reverse( show x ) && head (show x) == '3'

second_b :: Int -> [Int]
second_b n = [x | x <- [1..n], isPalindromeThatStartsWithDigit3 x]

main :: IO()

main = do 
    print(mulTwoNum 2 5)

    print(mulThreeNum 5 3 2)

    print(first_a 9)

    print(first_b 20)

    print(second_a 33)

    print(second_b 40)
