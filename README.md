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
| delivery_address_id |integer       | null: false |
| delivery_day_id     | integer      | null: false |
| pay                 | integer      | null: false |

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
| address_building    | string       | null: false |
| telephone_number    | string       | null: false |
| user                | references   | null: false, foreign_key: true |
| item                | references   | null: false, foreign_key: true |

### Association

- belongs_to :buy_item
