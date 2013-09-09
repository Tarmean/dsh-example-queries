{-# LANGUAGE OverloadedStrings, MonadComprehensions, RebindableSyntax, ViewPatterns #-}

module Main where

import qualified Prelude as P
import Database.DSH
import Database.DSH.Compiler
import Database.X100Client

import Debug.Trace

-- Helper Functions and Queries

q :: Q [[(Integer, Integer)]]
q = [ singleton $ tuple2 x y
    | x <- (toQ [1,2,3,4,5,6])
    , y <- (toQ [10, 20, 30])
    ]

  
getConn :: IO X100Info
getConn = P.return $ x100Info "localhost" "48130" Nothing

main :: IO ()
main = getConn 
       -- P.>>= (\conn -> fromQX100 conn q P.>>= (\i -> putStrLn $ show i))
       P.>>= (\conn -> debugNKLX100 conn q P.>>= putStr)