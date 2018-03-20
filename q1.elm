module Main exposing (..)

import Html exposing (..)


{- Q.
   Model中のselectedUserがNothingの場合は"無名",
   Justの場合はnameの末尾に"様"を加えて返す関数
   "withHonorific" を完成させよ。
   ---------------------------------------------
     main
     --> 無名
     --> 田中様
-}


type alias User =
    { name : String }


type alias Model =
    { selectedUser : Maybe User }


withHonorific : Model -> String
withHonorific model =
    case model.selectedUser of
        Nothing ->
            "無名"

        Just user ->
            user.name ++ "様"


main =
    div []
        [ Model Nothing
            |> withHonorific
            |> text
        , br [] []
        , Model (Just (User "田中"))
            |> withHonorific
            |> text
        ]
