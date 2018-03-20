module Main exposing (..)

import Html exposing (..)


{- Q.
   自然数を "Nat = O | S Nat" と定義する。
   このとき二つの自然数を和を求める関数 "add" を定義せよ。
   また，"add a b = a +. b" となる演算子 "+." を定義せよ。
   さらに，NatをIntに変換する関数 "toInt" を定義せよ。
   ---------------------------------------------
     main
     --> S (S (S (S (S (S O)))))
     --> S (S (S (S (S (S O)))))
     --> 6
-}


type Nat
    = O
    | S Nat


add : Nat -> Nat -> Nat
add a b =
    toInt a + toInt b



-- ここに演算子 "+." を定義する


toInt : Nat -> Int
toInt nat =
    let
        ( a, b ) =
            nat
    in
        case a of
            O ->
                0

            S ->
                1


v1 : Nat
v1 =
    S (S (S (S O)))


v2 : Nat
v2 =
    S (S O)


v3 : Nat
v3 =
    O


v4 : Nat
v4 =
    S


main =
    div []
        [ add v3 v4
            |> toString
            |> text
        , br [] []
        ]
