## アプリケーション名
「EXERCISE」

## アプリケーション概要
普段の日常生活での身体を動かすという運動に対しての意識を高めることを目的としたアプリケーション

## URL
https://exercise-6i8n.onrender.com

## テスト用アカウント
・メールアドレス sample@sample.com

・パスワード sample01

## 利用方法

### 運動記録投稿
１．トップページのヘッダーからユーザー新規登録を行う

２．記録投稿ボタンから記録の内容（タイトル・テキスト・カテゴリー・場所）を入力し投稿する

## アプリケーションを作成した背景
自分自身が家での活動が主になっているので、あまり外に出ないことから「運動に対して苦手意識がある」という課題を抱えていることが分かった。

課題を分析した結果、「運動に対する認識が高い」ということが真因であると仮説を立てた。同様の問題を抱えている方も多いと推測し、真因を解決
する為に記録を共有し、ユーザー同士でコミュニケーションを促進できるアプリケーションを開発することにした。

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