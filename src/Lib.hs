module Lib
    ( partition
    ) where

import           Data.List       (all, (\\))
import           Data.Maybe
import           Data.Set        (Set)
import qualified Data.Set        as Set
import           Text.Regex.TDFA


stringsOver :: [String] -> [String]
stringsOver alphabet = concat $ iterate (\prev -> (++) <$> prev <*> alphabet) [""]

eqCondition :: String -> String -> String -> String -> Bool
eqCondition regexToTest x y z =
  ((x <> z) =~ regexToTest :: Bool) == ((y <> z) =~ regexToTest :: Bool)

eqClass :: String -> String -> [String] -> [String]
eqClass regex x stringsToTest = [y | y <- stringsToTest, all (== True) [eqCondition regex x y z | z <- stringsToTest]]

-- | partitions an the strings over an alphabet (or really a subset of some size given) into
-- groups that belong to the same equivalence class with respect
-- to some regular language given as a regex.
partition :: String -> [String] -> Int -> [[String]]
partition regex alphabet numStrings = go "" strings
  where
    strings = take numStrings $ stringsOver alphabet
    fullRegex = "^" <> regex <> "$"
    go first stringsLeft
      | null stringsLeft = []
      | otherwise = let eqs = eqClass fullRegex first strings
                        stringsLeft' = stringsLeft \\ eqs
                        first' = head stringsLeft'
                    in  eqs : go first' stringsLeft'
