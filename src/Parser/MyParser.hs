module Parser.MyParser where

import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char

type Parser = Parsec Void String

type Name = String

data Expr
  = Var Name
  | App Expr Expr
  | Lam Name Expr
  | Lit Lit
  deriving (Show)

data Lit
  = LInt Int
  | LBool Bool
  deriving (Show)

varP :: Parser Expr
varP = do
  name <- some alphaNumChar
  return $ Var name

lamP :: Parser Expr
lamP = do
  char '\\'
  name <- some alphaNumChar
  char '.'
  body <- termP
  return $ Lam name body

termP :: Parser Expr
termP = varP <|> lamP

parenthesised = between (symbol "(") (symbol ")")

singleLetterP :: Parser Char
singleLetterP = char 'h'

doubleLetterP :: Parser Char
doubleLetterP = do
  char 'x'
  char 'r'

wordP :: Parser String
wordP = some alphaNumChar
