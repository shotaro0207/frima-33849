# DB設計

# usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :destinations


# itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| state_id       | integer    | null: false                    |
| delivery_fee_id| integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| days_id        | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one_attached :image
- belongs_to :user
- has_one :sold_out


# sold_outsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------  | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination


# destinationsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | ------------------------------ |
| phone_number     | string     | null: false                    |
| sold_out         | references | null: false, foreign_key: true |

### Association

- belongs_to :sold_out