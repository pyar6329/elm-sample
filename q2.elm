module Main exposing (..)

import Html exposing (..)


{- Q.
   Teature型の値またはStudent型の値を受け取り
   "名前(年齢)"の形でStringを返す関数 "info" を定義せよ
   ---------------------------------------------
     main
     --> 田中太郎(15)
     --> 中田次郎(35)
-}


type alias Student =
    { name : String
    , age : String
    }


type alias Teature =
    { name : String
    , age : String
    , subject : String
    }



-- union型を作るのではなく、annotationでパターンマッチさせる


info : { a | name : String, age : String } -> String
info person =
    person.name ++ "(" ++ person.age ++ ")"


student : Student
student =
    Student "田中太郎" "15"


teature : Teature
teature =
    Teature "中田次郎" "35" "Japanese"


main =
    div []
        [ info student
            |> text
        , br [] []
        , info teature
            |> text
        ]
