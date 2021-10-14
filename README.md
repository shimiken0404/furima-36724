# README

## Users名

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true ,null: false|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| age                | date   | null: false |

### Association

- has_many :items
- has_many :buy_items



## items テーブル

| Column              | Type         | Options     |
| ------------------- | ------------ | ----------- |
| title               | string       | null: false |
| comment             | text         | null: false |
| item_category_id    | integer      | null: false |
| item_show_id        | integer      | null: false |
| delivery_pay_id     | integer      | null: false |
| delivery_address_id | integer      | null: false |
| delivery_day_id     | integer      | null: false |
| pay                 | integer      | null: false |
| user                | references   | null: false, foreign_key: true |

### Association

- has_one    :buy_item
- belongs_to :user


## buy_items テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| user        | references   | null: false, foreign_key: true |
| item        | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :get_user
- belongs_to :user



## get_users テーブル

| Column              | Type         | Options     |
| ------------------- | ------------ | ----------- |
| postal_code         | string       | null: false |
| delivery_address_id | integer      | null: false |
| address_city        | string       | null: false |
| address_number      | string       | null: false |
| address_building    | string       |
| telephone_number    | string       | null: false |
| buy_item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :buy_item



アプリケーション名  

フリマアプリの実装
アプリケーション概要  フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。そして、入力ミスがあれば日本語でエラーのメッセージを表示します。

URL
https://furima-36724.herokuapp.com/

テスト用アカウント

購入者用
メールアドレス: shimizu.0404@gamil.com
パスワード: shimizu0404
購入用カード情報
番号：4242424242424242
期限：本日以降
セキュリティコード：123

出品者用
メールアドレス名: kenta.0404@gmail.com
パスワード: kenta0404

利用方法
出品、購入の基本操作

目指した課題解決
CtoC、BtoCの両者の利益を大きくする

洗い出した要件
エラーコードの日本語化

実装した機能

デバイスの実装
[![Image from Gyazo](https://i.gyazo.com/fe6c107fbe42f7b6b4b6e7c4790c83bd.gif)](https://gyazo.com/fe6c107fbe42f7b6b4b6e7c4790c83bd)

出品機能の実装
[![Image from Gyazo](https://i.gyazo.com/0d9c571d14e161e2fe7cfb03d08ba94e.gif)](https://gyazo.com/0d9c571d14e161e2fe7cfb03d08ba94e)

一覧機能の実装
[![Image from Gyazo](https://i.gyazo.com/047008bd85ba7897e6ff5af73d68723a.png)](https://gyazo.com/047008bd85ba7897e6ff5af73d68723a)

詳細機能の実装
[![Image from Gyazo](https://i.gyazo.com/6bf7017080498899bbfeef378e69bce3.gif)](https://gyazo.com/6bf7017080498899bbfeef378e69bce3)

編集機能の実装
[![Image from Gyazo](https://i.gyazo.com/333c6d80d3fa4649dea333248def5785.gif)](https://gyazo.com/333c6d80d3fa4649dea333248def5785)

削除機能の実装
[![Image from Gyazo](https://i.gyazo.com/5d3022eaf359887525aaaa68584e0a2a.gif)](https://gyazo.com/5d3022eaf359887525aaaa68584e0a2a)

購入機能の実装
[![Image from Gyazo](https://i.gyazo.com/1da8f2947e1355a7df8d6121283ddb74.gif)](https://gyazo.com/1da8f2947e1355a7df8d6121283ddb74)
[![Image from Gyazo](https://i.gyazo.com/7cdb4c44f3398f645bf8757a75684875.png)](https://gyazo.com/7cdb4c44f3398f645bf8757a75684875)

エラーメッセージの日本語化
[![Image from Gyazo](https://i.gyazo.com/c2755f8230e5cce4cfa7933f8db9e773.gif)](https://gyazo.com/c2755f8230e5cce4cfa7933f8db9e773)

ER図
[![Image from Gyazo](https://i.gyazo.com/ac3da88b5019b1f3b34394cfe8a19085.png)](https://gyazo.com/ac3da88b5019b1f3b34394cfe8a19085)

