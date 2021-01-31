# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| birthday           | date   | null: false |
| encrypted_password | string | null: false |

### Association

has_many :items
has_many :comments

## items テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| title       | string     | null: false                     |
| content     | text       | null: false                     |
| category_id | integer    | null: false                     |
| status_id   | integer    | null: false                     |
| age_id      | integer    | null: false                     |
| user        | references | null: false, foreign_key: true  |

### Association

has_many :comments
belongs_to :user

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

belongs_to :item
belongs_to :user