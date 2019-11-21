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
- belongs_to :prefecture
- has_many :items
- has_many :comments
- has_many :trade_histories



## addressテーブル
|column|Type|Option|
|------|----|------|
|post_code|string|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: true|
|phone_number|string|null: false|

### Association
- belongs_to :user




## itemテーブル
|column|Type|Option|
|------|----|------|
|title|string|null: false|
|description|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|(出品者ID)
|prefecture_id|references|null: false, foreign_key: true|
|shipping_charger_id|references|null: false, foreign_key: true|
|days_to_ship_id|references|null: false, foreign_key: true|
|item_status_id|references|null: false, foreign_key: true|
|trade_status_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :prefecture
- has_many :images
- belongs_to :brand
- belongs_to :category
- has_many :trade_statuses
- has_many :item_statuses
- has_many :days_to_ships
- has_many :shipping_chargers
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



## shipping_chargerテーブル
|column|Type|Option|
|------|----|------|
|kind|string|null: false|

### Association
- belongs_to :item


## days_to_shipテーブル
|column|Type|Option|
|------|----|------|
|term|string|null: false|

### Association
- belongs_to :item



## item_statusテーブル
|column|Type|Option|
|------|----|------|
|status|string|null: false|

### Association
- belongs_to :item


## trade_statusテーブル
|column|Type|Option|
|------|----|------|
|status|integer|default: 0|

### Association
- belongs_to :item


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
