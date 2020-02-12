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

# freemarket_sample_68th DB設計
## usersテーブル
|Column|Type|Options|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|confirm_password|string|null: false|
|name|string|null: false|
|name_zenkaku|string|null: false|
|birthday|string|null: false|
|phone_number|string|null: false|
### Association
- has_one :credit_card
- has_one :useraddress
- has_many :products

## credit_cardsテーブル
|Column|Type|Options|
|cardnumber|int|null: false|
|month|int|null: false|
|year|int|null: false|
|css_number|int|null: false|
|user_id|int|null: false, foreign_key: true|


### Association
- belongs_to :user

## useraddressesテーブル
|Column|Type|Options|
|prefecture|text|null: false|
|postal_code|int|null: false|
|city|string|null: false|
|address|text|null: false|
|building|text|null: false|
|phone_number|int|null: false|
|user_id|int|null: false, foreign_key: true|
|prefecture_id|int|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture





## productsテーブル
|Column|Type|Options|
|name|string|null: false|
|content|text|null: false|
|condition|int|null: false|
|status|string|null: false|
|payment|string|null: false|
|delivery_date|int|null: false|
|derivery_method|string|null: false|
|price|int|null: false|
|user_id|int|null: false, foreign_key: true|
|brand_id|int|null: false, foreign_key: true|
|category_id|int|null: false, foreign_key: true|
|prefecture_id|int|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images
- belongs_to_active_hash :prefecture

## imagesテーブル
|Column|Type|Options|
|image|text|null: false|
|product_id|int|null: false, foreign_key: true|


### Association
- belongs_to :product

## brandsテーブル
|Column|Type|Options|
|name|string|null: false|

### Association
- has_many :products

## categoriesテーブル
|Column|Type|Options|
|name|int|null: false|
|ancestory|text|---|

### Association
- has_many :products
- has_ancestory

