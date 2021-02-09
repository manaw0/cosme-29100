### :lipstick: アプリケーション名

## :lipstick: Cosmegram

## :lipstick: アプリケーション概要

化粧品の合う・合わないは人それぞれ。  
人気のある商品が自分にとって良いものとは限りません。  
使用してみてよかった化粧品の情報を投稿・共有ができるSNS型のアプリケーションです。  
自分と似た肌質・悩みを持つ人のおすすめを知ることができます。  

## :lipstick: URL

https://cosme-29100.herokuapp.com/

## :lipstick: ID/PW

・ID：admin  
・PW：1111

## :lipstick: テスト用アカウント

①  
・メールアドレス：test@test.com  
・パスワード：aaa123  
  
②  
・メールアドレス：testtest@test.com  
・パスワード：bbb123  

## :lipstick: 利用方法

・まず新規ユーザー登録を行い、ログインしてください。  
・「新規投稿」よりおすすめ化粧品の画像、おすすめポイント、投稿タイトルを記入することであなたのおすすめを発信できます。  
・投稿一覧の投稿画像、タイトルをクリックすると詳細ページに進みます。  
・詳細ページでは他の人の投稿にコメントをすることが可能です。自分の投稿内容の編集・削除もできます。  
※投稿一覧と投稿詳細は、ユーザー未登録・未ログイン状態でも確認可能です。  

## :lipstick: 制作意図

Cosmegramは、自分の持っているお気に入りの化粧品の情報を管理しつつ他人へ共有し、他の人のおすすめの化粧品情報を閲覧・お気に入りできるアプリです。  
悩みに合う化粧品や同じ悩みを持つ他者がおすすめする化粧品や自分のお気に入りの化粧品の情報だけをまとめて管理できるため、お店で試したり購入する際に簡単に確認することができます。  

## :lipstick: 洗い出した要件

<img width="1392" alt="要件定義" src="https://user-images.githubusercontent.com/71313417/107369820-90121c00-6b25-11eb-99d4-662e52ba8dfc.png">  

## :lipstick: 実装した昨日のDEMO

### ① 新規ユーザー登録・ログイン機能
投稿内容は未ログイン・ユーザー未登録状態でも閲覧可能です。  
ユーザー登録・ログインを行うと新規登録が可能となります。  

![ログイン](https://user-images.githubusercontent.com/71313417/107372383-b2596900-6b28-11eb-9440-23ddbab846ab.gif)  

### ② 新規投稿
おすすめしたい化粧品の情報を投稿することができます。  
他の人が見たり後から自分で見返したりする際にわかりやすいよう、画像の投稿も可能です。  
悩み・肌質・年代はプルダウンで選択します。  
同じ悩み・肌質・年代のおすすめ化粧品を知ることができます。  
![新規投稿](https://user-images.githubusercontent.com/71313417/107373064-7541a680-6b29-11eb-9523-18541d70bd88.gif)

### ③ 詳細画面
詳細画面では投稿のテキストを確認することができます。  
ログインしている状況であればコメントを残すこともできます。  
![詳細画面](https://user-images.githubusercontent.com/71313417/107373811-47109680-6b2a-11eb-966f-b4b64aa42def.gif)

### ④ 投稿編集
投稿したユーザーは詳細画面から投稿内容の編集することができます。  
※投稿者以外のユーザーは編集画面へのリンクが表示されません。  
![投稿編集](https://user-images.githubusercontent.com/71313417/107374165-a53d7980-6b2a-11eb-98f1-869843a1d5b8.gif)

### ⑤ 投稿削除
投稿したユーザーは詳細画面から投稿内容を削除することができます。  
※投稿者以外のユーザーは削除画面へのリンクが表示されません。 
![投稿削除](https://user-images.githubusercontent.com/71313417/107374651-2c8aed00-6b2b-11eb-9670-26b3d4e33fbd.gif)

### ⑥ 投稿検索
任意のキーワードで投稿内容を検索することができます。  
投稿のテキスト本文と検索キーワードが合致した場合、検索結果で確認できます。  
![投稿検索](https://user-images.githubusercontent.com/71313417/107374947-88ee0c80-6b2b-11eb-92a9-7d7af9a190f2.gif)


## :lipstick: 実装中、実装予定の追加機能

・ユーザーマイページ、ユーザー情報編集ページ
・SNS認証（Googleアカウント、Facebookアカウント）  
・投稿のタグ付け機能  
・投稿お気に入り機能
・レスポンシブデザイン
・エラー文の日本語化
・AWSへの画像アップロード

# :lipstick: テーブル設計

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