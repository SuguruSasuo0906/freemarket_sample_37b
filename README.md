# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#最終課題
メルカリのクローンサイト(フリーマーケット)

##実装予定機能
(1) ユーザーの新規登録（ニックネーム、メールアドレス、パスワード、名前、カナ、住所、電話[任意]、建物[任意]、誕生日、紹介文、支払い方法[クレジットカード]）
(2)ユーザのログイン、ログアウト
(3)カテゴリ別の商品一覧表示
(4)商品出品
(4-1)出品する商品の登録(名前、価格、説明、売り手、カテゴリ、サイズ、ブランド、状態、取引状態、配送方法、配送料、配送元の地域、配送予定日など)
(4-2)クレジットカードによる支払い
(5)商品の詳細表示
(6)出品した商品の編集
(7)出品した商品の削除
(8)パンくず表示
(9)商品検索機能(通常検索およびカテゴリ検索など商品絞り込み検索)

##ER図
https://drive.google.com/file/d/1LigQ5Lw3vgyLxmpJne4sSXfXoEVRXuNK/view?usp=sharing

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|introduction|string|
|birthday|date|

### Association
- has_many :items, dependent: :destroy
- has_many :deals, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :payment, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building|string|
|telephone|integer|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|token|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|large_category_id|integer|null: false, foreign_key: true|
|medium_category_id|integer|null: false, foreign_key: true|
|small_category_id|integer|foreign_key: true|
|size_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|condition|string|null: false|
|deal_condition|string|null: false|
|delivery_id|integer|null: false, foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
- belongs_to :seller_id, class_name: 'User'
- belongs_to :buyer_id, class_name: 'User'
- has_many :photos, dependent: :destroy
- belongs_to :large_category
- belongs_to :medium_category
- belongs_to :small_category
- belongs_to :size
- belongs_to :brand
- has_one :delivery, dependent: :destroy
- has_one :deal, dependent: :destroy

## dealsテーブル
|Column|Type|Options|
|------|----|-------|
|dealt_at|datetime|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_burden|string|null: false|
|origin_region|string|null: false|
|shipping_days|string|null: false|
|shipping_method|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :medium_categories, dependent: :destroy

## medium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|large_category_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- belongs_to :large_category
- has_many :small_categories, dependent: :destroy

## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|large_category_id|integer|null: false, foreign_key: true|
|medium_category_id|integer|null: false, foreign_key: true|
|sub_size_id|integer|foreign_key: true|

### Association
- has_many :items
- has_many :sub_sizes
- belongs_to :large_category
- belongs_to :medium_category

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## main_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :sub_sizes, dependent: :destroy


## sub_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|main_size_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- belongs_to :main_size
- belongs_to :small_category

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|photo|string|null: false|
|photo_num|integer|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|

### Association
- belongs_to :item

