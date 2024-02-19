## usersテーブル

| Column               | Type    | Options     |
|----------------------|---------|-------------|
| nickname             | string  | null: false |
| email                | string  | null: false unique: true|
| encrypted_password   | string  | null: false |
| age_id               | integer | null: false |
| gender_id            | integer | null: false |

### Association
has_many :posts
has_many :comments

## postsテーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false foreign_key: true |
| title              | string     | null: false |
| text               | text       | null: false |
| category_id        | integer    | null: false |
| place_id           | integer    | null: false |
| target_date        | date       | null: false |

### Association
belongs_to :user
has_many :comments

## commentsテーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| text               | text       | null: false |
| post               | references | null: false foreign_key: true |
| user               | references | null: false foreign_key: true |

### Association
belongs_to :user
belongs_to :post