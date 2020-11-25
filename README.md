# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| nick_name       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user_id         | references | null: false |
| item_name       | string     | null: false |
| detail          | text       | null: false |
| category        | string     | null: false |
| condition       | string     | null: false |
| ship_cost       | integer    | null: false |
| ship_pref       | string     | null: false |
| ship_day        | string     | null: false |
| price           | integer    | null: false |

## comments テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user_id         | references | null: false ,foreign_key: true |
| item_id         | string     | null: false ,foreign_key: true |
| comment         | text       | null: false |

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

## addresses テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| buyer_id        | references | null: false ,foreign_key: true|
| post_num        | integer    | null: false                   |
| pref            | string     | null: false                   |
| city            | string     | null: false                   |
| house_num       | string     | null: false                   |
| building        | string     | null: false                   |
| tel             | integer    | null: false                   |
