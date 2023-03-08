# README

users table

|Column            |Type      |Options                      |
| ---------------- | -------- | --------------------------- | 
|email             |string    |null: false,unique: true     |
|nick_name         |string    |null: false                  |
|encrypted_password|string    |null: false                  |
|first_name        |string    |null: false                  |
|last_name         |string    |null: false                  |
|first_kana_name   |string    |null: false                  |
|last_kana_name    |string    |null: false                  |
|birth_day         |date      |null: false                  |
 Association
- has_many :items
- has_many :purchases

items table
|Column            |Type      |Options                      |
| ---------------- | -------- | --------------------------- | 
|item_name         |string    |null: false                  |
|item_column       |text      |null: false                  |
|item_price        |interger  |null: false                  |
|item_category_id  |interger  |null: false                  |
|item_status_id    |interger  |null: false                  |
|delivery_charge_id|interger  |null: false                  |
|user              |references|foreign_key: true,null: false|
|purchase          |references|foreign_key: true,null: false|
 Association
- has_one :purchase
- belongs_to :user

purchases table
|Column            |Type      |Options                      |
| ---------------- | -------- | --------------------------- | 
|users             |references|foreign_key: true,null: false|
|items             |references|foreign_key: true,null: false|
 Association
- belongs_to :user
- belongs_to :item
- has_one :place

places table
|Column            |Type      |Options                      |
| ---------------- | -------- | --------------------------- | 
|prefecture_id     |interger  |                             |
|place_date_id     |interger  |                             |
|city              |string    |null: false                  | 
|address           |string    |null: false                  | 
|phone_number      |string    |null: false                  |    
|post_code         |string    |null: false                  | 
|building_name     |string    |                             |
 Association
- belongs_to :purchase