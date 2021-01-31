# アプリ名
### GameFavorite

# 概要
このアプリでできることは、ゲームの評価や、レビューを閲覧すること、レビューを投稿するができます。  
新規登録・ログインをしていなくても、トップページの新着順のレビューの表示と、いいねの数に応じたランキング形式での表示ができますが、  
新規登録・ログインをすることで自分がオススメするゲームを画像つきのレビューを投稿することや、他の人や自分のレビューへのコメントを残すこと、  
気に入ったレビューに対していいねを押して、いいねを押した投稿のみの表示に切り替えることもできます。  
  
# 本番環境
URL: https://game-favorite.herokuapp.com/

・Eメール:test@sample.com

・パスワード:111111

# 作成背景(意図)
なぜこのアプリを作成したかというと、私自身ゲームが好きでよくゲームをするのですが、意外とこういった誰でも投稿できるゲームレビューサイトが少なく、  
誰か一人の主観のみでゲームの内容を評価する記事やサイトばかりだと常々感じていたので、様々な人が感想を投稿して共有できるサイトがあれば、  
客観的に色々な感想や意見を取り入れた上で、そのゲームを購入するか否かを決める判断材料が増えて良質なゲームを取捨選択できるようになると思ったからです。


# DEMO
### トップページ

[![Image from Gyazo](https://i.gyazo.com/f8815f398c201c8b512dbd7f8411daa7.png)](https://gyazo.com/f8815f398c201c8b512dbd7f8411daa7)


# 工夫したポイント


# 使用技術(開発環境)
## バックエンド
Ruby,Ruby on Rails

## フロントエンド
Haml,Sass,JavaScript,JQuery,Ajax

## データベース
MySQL,Sequel Pro

## インフラ
Heroku

## ソース管理
GitHub,GitHubDesktop

## テスト


## エディタ
VSCode

# 課題や今後実装したい機能
・新規投稿画面または投稿編集画面で、画像を添付した際のプレビュー機能。  
・新規投稿画面または投稿編集画面で、添付した画像をAWSのS3設定で保存し、時間が経過しても画像が消えないようにする。  
・投稿されたレビューにコメントを残したあと、コメントした本人がそのコメントを削除する機能。

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

