# README

## User名

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |

### Association

- has_many :iteme
- has_one  :get_user


## iteme テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| title       | string       | null: false |
| comment     | text         | null: false |
| contents    | text         | null: false |
| image       | ActiveStorage| null: false |

### Association

- belongs_to :user
- has_one    :buy_iteme


## buy_iteme テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| name        | string       | null: false |
| get_name    | string       | null: false |
| iteme       | text         | null: false |

### Association

- belongs_to :iteme
- has_one    :get_user


## get_user テーブル

| Column      | Type         | Options     |
| ----------- | ------------ | ----------- |
| get_name    | string       | null: false |
| email       | string       | null: false |
| password    | string       | null: false |
| address     | text         | null: false |

### Association

- belongs_to :buy_iteme
- belongs_to :user