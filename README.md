## アプリケーション名

Cosmegram

## アプリケーション概要

使用してよかった化粧品の情報を投稿・共有ができるアプリケーションです。

## URL

https://cosme-29100.herokuapp.com/

## ID/PW

・ID：admin  
・PW：1111

## テスト用アカウント

・メールアドレス：test@test.com

・パスワード：aaa123

## 利用方法

・ログイン→トップページから新規投稿を押下→投稿内容入力→投稿

## 目指した課題解決

悩みに合う化粧品や同じ悩みを持つ他者が使ってよかったと言っている化粧品をまとめて店頭で確認できるよう保存をしたいが既存のSNSのお気にいり、ブックマークなどでは化粧品以外の情報が分散している。

一つにまとめて管理、閲覧できるようにしたい。

## 洗い出した要件

### トップページ
■ 詳細  
・サインイン/ログインページへ遷移できるボタンがある  
・ログイン時は、ログアウトできるボタンがある  
・投稿の詳細ページへ遷移できるボタンがある  
・ログイン時はマイページに進めるボタンがある  

■ ストーリー  
・投稿を一覧で見ることができる  
・投稿者のニックネームを見ることができる  

### サインイン・ログインページ
■ 詳細  
・新規登録できるフォームがある  
・サインインできるフォームがある  

■ ストーリー  
・新規登録できる  
・新規登録が完了しているとログインできる  
・登録情報を編集できる  
・ログアウトできる  

### 投稿の詳細・編集ページ
■ 詳細  
・編集・削除ができるボタンがある  
・投稿を編集できるフォームがある  

■ ストーリー  
・投稿内容の詳細を確認できる  
・投稿内容を編集できる  
・投稿内容を削除できる  

### マイページ
■ 詳細  
・マイページで自分の投稿を管理する  

■ ストーリー  
・自分の投稿を一覧で見ることができる  

### SNS認証
■ 詳細  
・SNSアカウント（Googleアカウント、Facabookアカウント）を利用したログイン方法を選択肢として追加する  

■ ストーリー  
・ユーザーアカウントの登録方法を「手打ち入力」「Googleアカウントを利用」「Facabookアカウントを利用」の3つから選べるようにする  

### 投稿検索機能
■ 詳細  
・投稿を検索できるフォームとボタンがある  

■ ストーリー  
・好きなキーワードで投稿を検索できる  

### タグ付け機能
■ 詳細  
・投稿フォームにタグ付け項目がある  
・タグ付けは検索リンクになっている  

■ ストーリー  
・ブランド名や商品名などでタグ付けの投稿ができる  
・タグのリンクから関連する投稿が検索できる  

### AWSへの画像アップロード
■ 詳細  
・AWSへ画像をアップロードする  

■ ストーリー  
・投稿された画像が常に確認できる

## 実装予定の機能

・SNS認証  
・タグ付け機能  
・AWSへの画像アップロード

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