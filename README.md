# README

## User名

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | text   | null: false |
| last_name          | text   | null: false |
| first_name_kana    | text   | null: false |
| last_name_kana     | text   | null: false |
| age_year           | text   | null: false |
| age_month          | text   | null: false |
| age_day            | text   | null: false |



### Association

- has_many :items
- has_one  :get_user


## item テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| image       | ActiveStorage| null: false |
| title       | string       | null: false |
| comment     | text         | null: false |
| item_category| text        | null: false |
| item_show   | text         | null: false |
| delivery_pay| text         | null: false |
| delivery_address| text     | null: false |
| delivery_day| text         | null: false |
| pay         | text         | null: false |


### Association

- belongs_to :user
- has_one    :buy_item


## buy_item テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| nickname    | references   | null: false, foreign_key: true |
| item        | references   | null: false, foreign_key: true |
| comment     | text         | null: false |

### Association

- belongs_to :item
- has_one    :get_user


## get_user テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| postal_code | string       | null: false |
| address_prefecture| string | null: false |
| address_city| string       | null: false |
| address_number| text       | null: false |
| telephone_number | string  | null: false |

### Association

- belongs_to :buy_item
- belongs_to :user