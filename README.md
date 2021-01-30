# アプリ名

GameFavorite

# 概要

このアプリでできることは、ゲームの評価や、レビューを閲覧することや、気に入ったレビューに対していいねを押したり、いいねの数に応じてランキング形式での表示もできます。

また、新規登録することで自分がオススメするゲームを画像つきでレビューすることができます。
# 本番環境
URL: https://game-favorite.herokuapp.com/

・Eメール:

・パスワード:

# 作成背景(意図)


# DEMO
## トップページ

[![Image from Gyazo](https://i.gyazo.com/f8815f398c201c8b512dbd7f8411daa7.png)](https://gyazo.com/f8815f398c201c8b512dbd7f8411daa7)


# 工夫したポイント


# 使用技術(開発環境)


# 課題や今後実装したい機能


# DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :posts
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post
- has_many :comments

## postsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false, add_index: true|
|title|string||
|text|text|null:false|
|image|string||
### Association
- belongs_to :user
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :comments

## commentsテーブル
|Column|Type|Option|
|------|----|------|
|user|integer|references|null: false, foreign_key: true|
|post|integer|references|null: false, foreign_key: true|
|text|text||
### Association
- belongs_to :user
- belongs_to :post

## likesテーブル
|Column|Type|Option|
|------|----|------|
|user|integer|references|null: false, foreign_key: true|
|post|integer|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post
