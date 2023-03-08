# README

users table

|Column|Type|Options|
|email|string|null: false,unique: true |
|nick_name|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|
|name|string|null: false|
|kana_name|string|null: false|
|birth_day|datetime|null: false|
|items_id|references|null: false,foreign_key: true|
|purchases_id|references|null: false,foreign_key: true|
|places_id|references|null: false,foreign_key: true|
|phone_number|interger|null: false|
 Association
has_many :items
has_many :purchases
has_many :places

items table
|item_image|string|null: false|
|item_name|string|null: false|
|item_column|text|null: false|
|item_price|interger|null: false|
|item_category|string|null: false|
|item_status|string|null: false|
|delivery_charge|interger|null: false|
|users_id|references|foreign_key: true|
|purchases_id|references|foreign_key: true|
|places_id|references|foreign_key: true|
 Association
has_one :purchases
belongs_to :users
has_many :places

purchases table
|purchases_name|string||
|purchases_item|string||
|users_id|references|foreign_key: true|
|items_id|references|foreign_key: true|
|places_id|references|foreign_key: true|
 Association
belongs_to :users
belongs_to :items
has_many :places

places table
|prefecture|string||
|place_date|datetime||
|city|string|null: false|
|address|string|null: false|
|post_code|string|null: false|
|building_name|string||
|users_id|references|foreign_key: true|
|purchases_id|references|foreign_key: true|
 Association
belongs_to :users
belongs_to :purchases