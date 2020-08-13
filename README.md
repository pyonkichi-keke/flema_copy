<!-- # README -->

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

  ***DB設計***

## Usersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null:false, limt:15, index:true|
  |password|integer|null:false|
  |introduction|text|-------|
  |first_name|string|null:false|
  |last_name|string|null:false|
  |first_name_kana|string|null:false|
  |last_name_kana|string|null:false|
  |birthday|string|null:false|
  |e_mail|string|null:false, unique:true|
### Association
- has_many :commnets
- has_many :products
- has_many :likes_product, through: :likes, source: :product
- has_many :comments dependent: :destroy
- has_many :likes dependent: :destroy
- has_many :products dependent: :destroy
- has_one :credit_card dependent: :destroy
- has_one :addresse dependent: :destroy
## Addressesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null:false, foreing_key:true|
  |postal_code|string|null:false|
  |prefecture_id(active_hash)|references|null:false|
  |city|string|null:false|
  |addresse|string|null:false|
  |apartment|string|-------|
  |first_name|string|null:false|
  |last_name|string|null:false|
  |first_name_kana|string|null:false|
  |last_name_kana|string|null:false|
  |tel|integer|------|
### Association
- belongs_to user
## Productsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null:false, foreing_key:true|
  |index_name|string|null:false|
  |price|string|null:false|
  |text|text|-------|
  |status_id(active_hash)|references|foreing_key:true|
  |size|string|null:false|
  |prefecture_id(active_hash)|references|null:false|
  |delivery(active_hash)|references|foreing_key:true|
  |delivery_time|string|null:false|
  |brand-id(active_hash)|references|foreing_key:true|
  |buy_user_id|references|foreing_key:true|
  |category_id(active_hash)|references|foreing_key:true|
### Association
- belongs_to :user
- has_many :comment_users, through: :comments, source: :user
- belongs_to :categories
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
## commentsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null:false, foreing_key:true|
  |comment|text|-------|
  |product|references|foreing_key:true|
### Association
- belongs_to :user
- belongs_to :product
## Credit_cardsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null:false, foreing_key:true|
  |customer_id|string|null:false|
  |card_token|string|null:false|
### Association
- belongs_to :user
## Likesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null:false, foreing_key:true|
  |product_id|references|foreing_key:true|
### Association
- belongs_to :user
- belongs_to :product
## Imagesテーブル
  |image|string|null:false|
  |product_id|references|foreing_key:true|
### Association
- belongs_to:product