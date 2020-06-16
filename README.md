# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin19]

# DB
※全てcreate_tableにid: :integerを指定

## users table

|Column|Type|Option|
|------|----|------|
|nickname     |string|null: false, unique: true|
|mail         |string|null: false, unique: true|
|password     |string|null: false|
|prefecture_id|integer||

- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages
- has_many :posts
- has_many :room_users
- has_many :rooms, through: :rooms_users
- has_many :chat
- validates :nickname, presence: true, uniqueness: true


## group_users table

|Column|Type|Option|
|------|----|------|
|group |references|type: :integer, foreign_key: true
|user  |reserences|type: :integer, foreign_key: true

- belongs_to :group
- belongs_to :user


## groups table

|Column|Type|Option|
|------|----|------|
|name    |string|null: false|

- has_many :group_users
- has_many :users, through: :group_users
- has_many :messages
- validates :name, presence: true, uniquness: true


## message

|Column|Type|Option|
|------|----|------|
|content |string|null: false|
|group_id|references|foreign_key: true|
|user_id |references|foreign_key: true|

- belongs_to :group
- belongs_to :user
- has_many :images


## posts table

|Column|Type|Option|
|------|----|------|
|user_id      |integer|null: false, foreign_key: true|
|content      |string|null: false|
|category_id  |integer|null: false|
|prefecrure_id|integer|null: false|

- belongs_to :user
- has_many :images
- belongs_to :category


## rooms table

|Column|Type|Option|
|------|----|------|
|name     |string|null:  false|
|status_id|integer|null: false|

- has_many :room_users
- has_many :users, through: :room_users
- has_many :chat
- attribute :status_id, :integer, default: 1


## room_users table

|Column|Type|Option|
|------|----|------|
|room |references|type: :integer, foreign_key: true
|user |reserences|type: :integer, foreign_key: true

- belongs_to :room
- belongs_to :user


## chats tables

|Column|Type|Option|
|------|----|------|
|content|string|
|image  |string|
|room   |references|type: :integer, foreign_key: true|
|user   |references|type: :integer, foreign_key: true|

- belongs_to :room
- belongs_to :user


## images tables

|Column|Type|Option|
|------|----|------|
|message_id|integer|null: false, foreign_key: true|
|post_id   |integer|null: false, foreign_key: true|
|chat_id   |integer|null: false, foreign_key: true|

- belongs_to :message
- belongs_to :post
- belongs_to :chat


<!-- * System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
