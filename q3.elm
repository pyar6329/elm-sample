module Main exposing (..)

import Html exposing (..)


{- Q.
   与えられたStringをIntに変換する関数toIntを完成させよ。
   ただし，変換できない文字列を渡された場合は0を返すものとする。
   ---------------------------------------------
     main
     --> 1001
     --> 0
-}


toInt : String -> Int
toInt x =
    x
        |> String.toInt
        |> Result.withDefault 0


main =
    div []
        [ "1001"
            |> toInt
            |> toString
            |> text
        , br [] []
        , "10A1"
            |> toInt
            |> toString
            |> text
        ]
