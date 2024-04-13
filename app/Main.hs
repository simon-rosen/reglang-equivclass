module Main (main) where

import           Data.List       (all, (\\))
import           Data.Maybe
import           Data.Set        (Set)
import qualified Data.Set        as Set
import           Lib
import           Text.Regex.TDFA

main :: IO ()
main = someFunc

alphabet = ["a", "b"]
strings = concat $ iterate (\prev -> (++) <$> prev <*> alphabet) [""]
regexToTest = "^(a*|ba)*$"

eqCondition :: String -> String -> String -> Bool
eqCondition x y z =
  ((x <> z) =~ regexToTest :: Bool) == ((y <> z) =~ regexToTest :: Bool)

eqClass :: String -> [String] -> [String]
eqClass x stringsToTest = [y | y <- stringsToTest, all (== True) [eqCondition x y z | z <- stringsToTest]]

-- the Int is the number of strings to test on from Sigma^*
partition :: Int -> [[String]]
partition numStrings = go "" strings'
  where
    strings' = take numStrings strings
    go first strings''
      | strings'' == [] = []
      | otherwise = let eqs = eqClass first strings'
                        stringsLeft = strings'' \\ eqs
                        first' = head stringsLeft
                    in  eqs : (go first' stringsLeft)
