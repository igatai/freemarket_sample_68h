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
|phone-number|string|null: false|
### Association
- has_one :credit_card
- has_one :useradress
- has_many :products

## credit_cardsテーブル
|Column|Type|Options|
|cardnumber|int|null: false|
|month|int|null: false|
|year|int|null: false|
|css_number|int|null: false|
|user_id|int|null: false, foreign_key: true|


### Association
- has_one :user

## useraddressesテーブル
|Column|Type|Options|
|prefecture|text|null: false|
|postal_code|int|null: false|
|city|string|null: false|
|address|text|null: false|
|building|text|null: false|
|phone_number|int|null: false|
|user_id|int|null: false, foreign_key: true|

### Association
- has_one :user



## prefectureテーブル
|Column|Type|Options|
|name|string|null: false|

### Association
- has_one :useraddress
- has_many :products

## productsテーブル
|Column|Type|Options|
|name|string|null: false|
|content|text|null: false|
|condition|int|null: false|
|status|string|null: false|
|payment|string|null: false|
|prefecture|string|null: false|
|delivery_date|int|null: false|
|derivery_method|string|null: false|
|price|int|null: false|
|user_id|int|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :categories
- has_many :blands
- has_many :images

## imagesテーブル
|Column|Type|Options|
|image|text|null: false|
|product_id|int|null: false, foreign_key: true|


### Association
- belongs_to :product

## blandsテーブル
|Column|Type|Options|
|name|string|null: false|
|product_id|int|null: false, foreign_key: true|


### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|parent_category|string|null: false|
|middle_category|string|null: false|
|child_category|string|null: false|
|product_id|int|null: false, foreign_key: true|


### Association
- belongs_to :product

