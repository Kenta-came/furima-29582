# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user_id         | integer    | null: false |
| item_name       | string     | null: false |
| detail          | text       | null: false |
| category_id     | integer    | null: false |
| condition_id    | integer    | null: false |
| ship_cost_id    | integer    | null: false |
| ship_pref_id    | integer    | null: false |
| ship_day_id     | integer    | null: false |
| price           | integer    | null: false |

## comments テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user_id         | integer    | null: false ,foreign_key: true |
| item_id         | integer    | null: false ,foreign_key: true |
| comment         | text       | null: false |

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | integer    | null: false, foreign_key: true |
| user_id | integer    | null: false, foreign_key: true |

## addresses テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| buyer_id        | integer    | null: false ,foreign_key: true|
| post_num        | string     | null: false                   |
| pref            | string     | null: false                   |
| city            | string     | null: false                   |
| house_num       | string     | null: false                   |
| building        | string     |                               |
| tel             | string     | null: false                   |
