# freemarket_sample_63e DB設計
## userテーブル
|column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null:false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|


### Association
- has_many :user_evaluations
- belongs_to_active_hash :prefecture
- has_many :items
- has_many :comments
- has_many :trade_histories



## addressテーブル
|column|Type|Option|
|------|----|------|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: true|
|phone_number|string|null: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture



## itemテーブル
|column|Type|Option|
|------|----|------|
|title|string|null: false|
|description|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|(出品者ID)
|prefecture_id|integer|null: false|
|shipping_charger_id|integer|null: false|
|shipping_method_id|integer|null: false|
|days_to_ship_id|integer|null: false|
|item_status_id|integer|null: false|
|trade_status_id|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_many :images
- belongs_to :brand
- belongs_to :category
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :trade_status
- belongs_to_active_hash :item_status
- belongs_to_active_hash :days_to_ship
- belongs_to_active_hash :shipping_charger
- belongs_to_active_hash :shipping_method
- has_many :comments
- has_one :trade_history



##  trade_historyテーブル
|column|Type|Option|
|------|----|------|
|seller_id|references|null: false, foreign_key: true|(user_id)
|buyer_id|references|null: false, foreign_key: true|(user_id)
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user




## brandテーブル
|column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association
- has_many :items
- has_many :brand_categories
- has_many :categories, through: :brand_categories



## categoryテーブル
|column|Type|Option|
|------|----|------|
|name|string|null: false|
|ancestry|string|null: false|


### Association
- has_many :items
- has_many :brand_categories
- has_many :brands, through: :brand_categories
- has_ancestry


## brand_categoryテーブル
|column|Type|Option|
|------|----|------|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :brand
- belongs_to :category


## imageテーブル
|column|Type|Option|
|------|----|------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## evaluationテーブル
|column|Type|Option|
|------|----|------|
|status|string|null: false|

### Association
- has_many :user_evaluations


## user_evaluationテーブル
|column|Type|Option|
|------|----|------|
|evaluater_id|references|null: false, foreign_key: true|(評価する人 user_id)
|evaluatee_id|references|null: false, foreign_key: true|(評価される人 user_id)
|evaluation_id|references|null: false, foreign_key: true|
|comment|string|null: false|
|created_at|datetime|null: false|

### Association
- belongs_to :evaluation
- belongs_to :user

## commentテーブル
|column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|string|null: false|
|created_at|datetime|null: false|

### Association
- belongs_to :item
- belongs_to :user
