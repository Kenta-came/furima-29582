## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

# users アソシエーション 
has_many :items
has_many :comments
has_one  :buyers

## items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user_id         | integer    | null: false , foreign_key: true |
| name            | string     | null: false                     |
| detail          | text       | null: false                     |
| category_id     | integer    | null: false                     |
| condition_id    | integer    | null: false                     |
| ship_cost_id    | integer    | null: false                     |
| ship_pref_id    | integer    | null: false                     |
| ship_day_id     | integer    | null: false                     |
| price           | integer    | null: false                     |

# items アソシエーション 
belongs_to :user
has_many   :comments
has_one    :buyers

## comments テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user_id         | integer    | null: false ,foreign_key: true |
| item_id         | integer    | null: false ,foreign_key: true |
| comment         | text       | null: false |

# comments アソシエーション 
belongs_to :user
belongs_to :item

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | integer    | null: false, foreign_key: true |
| user_id | integer    | null: false, foreign_key: true |

# buyers アソシエーション 
belongs_to :user
belongs_to :item
has_one    :addresses

## addresses テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| buyer_id        | integer    | null: false ,foreign_key: true|
| post_num        | string     | null: false                   |
| ship_pref_id    | integer    | null: false                   |
| city            | string     | null: false                   |
| house_num       | string     | null: false                   |
| building        | string     |                               |
| tel             | string     | null: false                   |

# addresses アソシエーション 
belongs_to :buyer
