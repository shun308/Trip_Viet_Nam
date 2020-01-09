# README

# Trip Viet Nam DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|
|email|string|null: false|
|encrypted_password|string|null: false|

### Association
- has_many :favorites
- has_many :items, through: :favorites

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|japanese|string||
|vietnamese|string||
|intonation|string||

### Association
- has_many :favorites
- has_many :users, through: :favorites

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|item_id|bigint|null: false|

### Association
- belongs_to :user
- belongs_to :item