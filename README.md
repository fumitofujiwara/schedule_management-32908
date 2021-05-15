# README

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| last_name_furigana   | string  | null: false               |
| first_name_furigana  | string  | null: false               |
| department           | integer | null: false               |
| position             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               | 



### Association

- has_many :schedules
- has_many :schedule_comments
- has_many :reports
- has_many :report_comments

## schedules テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| start_date  | datetime   | null: false                    |#開始
| ending_date | datetime   | null: false                    |#終了
| content     | string     | null: false                    |#内容
| detail      | text       | null: false                    |#詳細
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :schedule_comments
- has_many :reports
- has_many :report_comments

## schedule_comments テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ | 
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| schedule    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :schedule

## reports テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ | 
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| schedule    | references | null: false, foreign_key: true |

### Association

- belongs_to :schedule
- belongs_to :user
- has_many :report_comments

## report_comments テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ | 
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :schedule
- belongs_to :report

