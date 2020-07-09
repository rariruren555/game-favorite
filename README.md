# GameFavorite DB設計
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
|game_name|string|null: false, add_index: true|
|game_hard|string|null: false, add_index: true|
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