# elm-sample

# 目的

elmは文法が単純なため、チュートリアルをやれば一通りの実装は可能になる。  
ただし、冗長なコードが増えれば保守性や可読性に影響するため、関数や一部の特殊な文法を用いることでよりスマートなコードを書けるようになることを目指す。

また、elmによる開発において重要な elm-packages の読み方などについても触れる。

# 内容

[http://elm-lang.org/try](http://elm-lang.org/try) 上で下記のコードの実装を行い、リファクタリングをする。  
リファクタリングする必要のないコードだらけの場合は、質問大会で。

# 準備

書き設問に目を通しておく。時間があれば、実装してみる。

# Q1. Maybe型の処理

```elm
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
  -- ここを実装

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
```

# Q2. レコード型の抽象化

```elm
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
  
info : -- 型定義
info -- ここを実装

student : Student
student = Student "田中太郎" "15"

teature : Teature
teature = Teature "中田次郎" "35" "Japanese"

main = 
  div []
  [ info student
    |> text 
  , br [] []
  , info teature
    |> text
  ]
```

# Q3. Result型の処理

```elm
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
toInt =
  -- ここを実装

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
```

# Q4. 再帰 / Union型

```elm
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
  -- ここを実装
      
-- ここに演算子 "+." を定義する

toInt : Nat -> Int
toInt nat =
  -- ここを実装

v1 : Nat
v1 = S (S ( S (S O)))

v2 : Nat
v2 = S (S O)

v3 : Nat
v3 = O

main = 
  div []
  [ add v1 v2
    |> toString
    |> text 
  , br [] []
  , (v1 +. v3 +. v2)
    |> toString
    |> text
  , br [] []
  , v1 +. v2
    |> toInt
    |> toString
    |> text
  ]
```
