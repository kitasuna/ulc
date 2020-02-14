module Main where

import Split.LibSplit (ourSplit)

main :: IO ()
main = do
  input <- getLine
  let result = ourSplit input
  print result

