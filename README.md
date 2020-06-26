# Tooling-Patner

# 概要
## ツーリングに役立つ情報の交換まとめサイト
* インターネットで点在している、ツーリングに関する情報やブログをまとめる、案内板的存在
* お悩み相談室でツーリングにバイクに関する不安をサイトに投げかけ、chat形式で会話を進める
* 共有したい情報をブログのように投稿できる
* 投稿された情報は各カテゴリに分けてまとめられ、欲しい情報に沿った場所から探すことができる
* ユーザーではなくても、相談室や投稿は閲覧できるが、投稿や相談はユーザーのみが使用できる

# 本番環境(デプロイ先　テストアカウント＆ID)
## デプロイ先
* AWS
* URL : http://54.65.53.35/
* ID : toolingptr
* Pass : toolingptr00
## テスト用アカウント
### ①吾郎
* メールアドレス : 555@555.555
* パスワード : 5555555
### ②八郎
* メールアドレス : 888@888.888
* パスワード : 8888888

# 制作背景(意図)
* インターネットに点在しているツーリングに関する情報やブログの案内板であり、出発点でありたいことを意識して制作しました。
* インターネットで検索するといろんな情報が検索結果が出てきますが、相談をしたいが込み入った相談相手がいないとき、おすすめ情報を探してもブログの記事内容からの検索でジャンル分けがされていないなどで情報を見つけづらいとき、そんな悩みをこのtooling-ptrを案内板として活用し、欲しい情報への近道として活用できるサイトになればと思い制作しました。　

# DEMO
## TOPページ
[![Image from Gyazo](https://i.gyazo.com/72000b083251d87efcee78f7665d4a65.png)](https://gyazo.com/72000b083251d87efcee78f7665d4a65)
* 左側：上部にログイン中のユーザー名を表示し、横のアイコンに「マイネニュー」と「投稿」を用意
* 左側：下部に各カテゴリごとの掲示板へ移動可能
* 上部：タイトルロゴはホーム画面へ移動、横の検索から投稿の検索を実施

## お悩み相談室
[![Image from Gyazo](https://i.gyazo.com/6bbf2cbf0df81ca21fa81422ef89aefb.png)](https://gyazo.com/6bbf2cbf0df81ca21fa81422ef89aefb)
[![Image from Gyazo](https://i.gyazo.com/d4914c38cd5e14a560c8b64096d01c06.png)](https://gyazo.com/d4914c38cd5e14a560c8b64096d01c06)
* 投稿者自身であれば編集と削除を表示
* 自身のコメントは緑色、他者はオレンジ色と区別
* 非同期通信でchatが可能で、画像の投稿も可能
* 新規作成から相談室を新規作成できる

## 投稿画面
[![Image from Gyazo](https://i.gyazo.com/bada0be760edb0c49e909c431935216b.png)](https://gyazo.com/bada0be760edb0c49e909c431935216b)
[![Image from Gyazo](https://i.gyazo.com/2aa1b5f63aaafcfc6e2defa03c29cbe0.png)](https://gyazo.com/2aa1b5f63aaafcfc6e2defa03c29cbe0)
[![Image from Gyazo](https://i.gyazo.com/741df547e9c1cf7519d0907df7c81211.png)](https://gyazo.com/741df547e9c1cf7519d0907df7c81211)
* サイドバー上部のアイコンから投稿を選択するか、マイメニューから投稿ボタンを押すことで投稿が可能
* 画像は「ファイルを選択」で最大3枚まで登録、削除、変更が可能
* カテゴリーと該当都道府県は必須、なお都道府県は最下部に「ー」を用意することで、カテゴリによる該当がない場合にも対応
* 投稿者自身であれば編集と削除を表示

## カテゴリ一覧(抜粋)
[![Image from Gyazo](https://i.gyazo.com/a413e74f9a7d0ad304f5ccc3221d477f.png)](https://gyazo.com/a413e74f9a7d0ad304f5ccc3221d477f)
[![Image from Gyazo](https://i.gyazo.com/aa7fa9d219c8135133d43bcf8bbb4148.png)](https://gyazo.com/aa7fa9d219c8135133d43bcf8bbb4148)
* 投稿で選択されたカテゴリを元に振り分けを実施
* 上部のパンくず、投稿詳細からのパンくずから移動可能

# 工夫したポイント
* chatでは投稿者の区別をつけるため、自分の投稿は緑色、他者のはオレンジ色と色分けを施しました。
* ユーザーの投稿にカテゴリを必須で選んでもらい、そのカテゴリをもとに掲載掲示板を振り分ける
* ログインしていれば、右端に自身が投稿したお悩み相談室の一覧と最後の投稿が表示される
* ユーザーかそうでないか、また投稿者自身かどうかでユーザー新規登録へのジャンプ、投稿、編集、削除の振り分けを各ポイントで実施
* 投稿の検索はタイトルと本文から検索

# 使用技術(開発環境)
## 開発環境
* Ruby version 2.5.1p57
* Ruby on Rails
* JQuery-rails (4.4.0)
* My SQL
* Github
* AWS
* VisualStudio Code

## 開発期間と平均作業時間
* 開発期間 : 5/15~5/18, 6/10~6/25
* 1日あたりの平均作業時間 : 11時間
## 開発体制
* 人数 : 1人

# 課題や今後実装したい機能
* 投稿へのコメント機能
* ユーザーの別サイトへのリンクスペースの搭載
* 投稿のサムネイル
* chat画面における最下部へ移動ボタン
* chatの自動更新とtext field reset問題解決
* いいね機能
* グループ機能
* 運営からのお知らせ機能・ページ
* 新着情報機能・ページ
* お問い合わせページ
* 画像拡大機能
* プロフィール画像編集においてプレビュー表示


# DB
※全てcreate_tableにid: :integerを指定

## users table

|Column|Type|Option|
|------|----|------|
|nickname     |string|null: false, unique: true|
|mail         |string|null: false, unique: true|
|password     |string|null: false|
|prefecture_id|integer||
|bike         |string||
image         |string||

- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages
- has_many :posts
- has_many :room_users
- has_many :rooms, through: :rooms_users
- has_many :chat
- validates :nickname, presence: true, uniqueness: true
- attribute :prefecture_id, :integer, default: 48
- mount_uploader :image, ImageUploader



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
|group   |references|foreign_key: true|
|user    |references|foreign_key: true|

- belongs_to :group
- belongs_to :user
- has_one :images


## posts table

|Column|Type|Option|
|------|----|------|
|title          |string    |null: false|
|content        |text      |null: false|
|prefecrure_id  |integer   |null: false|
|category       |references|type: :integer foreign_key: true|
|parent_category|integer   |null: false|
|child_category |integer   |null: false|
|user           |references|type: :integer foreign_key: true|

- add_foreign_key :posts, :categories, column: :parent_category
- add_foreign_key :posts, :categories, column: :child_category

- belongs_to :user
- has_many :images
- belongs_to :category
- accepts_nested_attributes_for :images
- belongs_to :category, optional: true
- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


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
|content|string||
|image  |string||
|room   |references|type: :integer, foreign_key: true|
|user   |references|type: :integer, foreign_key: true|

- belongs_to :room
- belongs_to :user


## images tables

|Column|Type|Option|
|------|----|------|
|picture   |string ||
|message_id|integer   |foreign_key: true|
|post      |references|type: :integer, foreign_key: true|


- belongs_to :message
- mount_uploader :picture, ImageUpLoader
- belongs_to :post



## categories tables

|Column|Type|Option|
|------|----|------|
|name    |integer|null: false|
|ancestry|integer||

- has_many :posts
- has_ancestry

<!-- * System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
