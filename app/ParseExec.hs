module Main where

import Parser.MyParser (termP)
import System.Environment
import Text.Megaparsec

main :: IO ()
main
  -- TODO dont use head here
 = do
  input <- fmap head getArgs
  parseTest termP input
