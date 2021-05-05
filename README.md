# README

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| last_name_furigana   | string  | null: false               |
| first_name_furigana  | string  | null: false               |
| department           | string  | null: false               |
| position             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               | 



### Association

- has_many :items
- has_many :orders
- has_many :comments
- has_many :favorites

## schedule テーブル

| Column      | Type          | Options                        |
| ------------| --------------| -------------------------------|
| start_date  | data          | null: false                    |#開始
| start_time  | time          | null: false                    |
| ending_date | data          | null: false                    |#終了
| ending_time | time          | null: false            　      |
| with_name   | integer       | null: false                          |#誰と
| content     | integer       | null: false                    |#内容
| details     | integer       | null: false                    |#詳細
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments
- has_one :favorite

## comments テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ | 
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## favorites テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ | 
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ | 
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ | 
| postal_code        | string     | null: false                    |#郵便番号
| delivery_area_id   | integer    | null: false                    |#都道府県(配送元地域)
| municipal_district | string     | null: false                    |#市町村区
| address            | string     | null: false                    |#番地
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

- belongs_to :order
