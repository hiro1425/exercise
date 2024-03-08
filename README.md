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

## 実装した機能についての画像やGIF及びその説明
### トップページ
[![Image from Gyazo](https://i.gyazo.com/31f01e8c584fedb03a58797591a5c3dc.png)](https://gyazo.com/31f01e8c584fedb03a58797591a5c3dc)

### 新規登録ページ
[![Image from Gyazo](https://i.gyazo.com/9d8d3bc7dfc1ca71f5060781afc95762.gif)](https://gyazo.com/9d8d3bc7dfc1ca71f5060781afc95762)

ニックネームとメールアドレスとパスワードを入力してユーザー登録できる。

### ログインページ
[![Image from Gyazo](https://i.gyazo.com/7ef80303cc322860b1fe7f55d80765d0.gif)](https://gyazo.com/7ef80303cc322860b1fe7f55d80765d0)

メールアドレスとパスワードを入力してログインできる。

### 記録投稿ページ
[![Image from Gyazo](https://i.gyazo.com/7092da75c3a7bfd518433816630a5e06.gif)](https://gyazo.com/7092da75c3a7bfd518433816630a5e06)

トップページの右上にある記録投稿ボタンから記録投稿ページへ遷移し、記録タイトルや運動記録詳細、カテゴリ、場所、実施日を入力することで投稿することができる。

### 投稿詳細ページ
[![Image from Gyazo](https://i.gyazo.com/7be5fe1c6eb2ff383a7c37f390896a6d.png)](https://gyazo.com/7be5fe1c6eb2ff383a7c37f390896a6d)

#### コメント投稿機能
[![Image from Gyazo](https://i.gyazo.com/839b7bae33545e67fb657a0d3b781b5f.gif)](https://gyazo.com/839b7bae33545e67fb657a0d3b781b5f)

投稿詳細ページ内にてログインしているユーザーであれば、コメントが投稿できる。

##### コメント編集機能
[![Image from Gyazo](https://i.gyazo.com/f0a519fb6683f8b72fdd9898ffd478ba.gif)](https://gyazo.com/f0a519fb6683f8b72fdd9898ffd478ba)

詳細ページのコメントをクリックすることでコメント編集ページへ遷移し、変更したコメントを入力し、「コメントする」をタップすることでコメント内容を変更することができる。

##### コメント削除機能
[![Image from Gyazo](https://i.gyazo.com/cfa21275ef705eaf0672661728fe0e40.gif)](https://gyazo.com/cfa21275ef705eaf0672661728fe0e40)

コメント編集ページにて「コメント削除」ボタンをクリックすることで、そのコメントを削除することができる。


## 実装予定の機能
現在、フォロー機能を実装中
今後、お気に入り機能や検索機能を実装予定


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