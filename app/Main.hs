module Main (main) where

import           Data.List          (intersperse)
import           Lib
import           System.Environment

main :: IO ()
main = do
  (regex, alphabet, numStrings) <- parseArgs
  let equivalenceClasses = partition regex alphabet numStrings
  let withEpsilon = map (map (\c -> if c == "" then "ε" else c)) equivalenceClasses
  let withCommas = map (concat . (intersperse ", ")) withEpsilon
  putStrLn $ concat . (intersperse "\n\n") $ withCommas


parseArgs :: IO (String, [String], Int)
parseArgs = do
  [regex, alphabet, numStrings] <- getArgs
  pure (read regex :: String, read alphabet :: [String], read numStrings :: Int)
