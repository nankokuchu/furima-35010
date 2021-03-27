# README

## users

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|email               |sting  |null: false, unique: true|
|encrypted_password  |sting  |null: false              |
|nickname            |sting  |null: false              |
|first_name          |sting  |null: false              |
|last_name           |sting  |null: false              |
|first_name_reading  |sting  |null: false              |
|last_name_reading   |sting  |null: false              |
|birthday            |date   |null: false              |

### Association
-has_many :items
-has_many :orders

## items

|Column           |Type           |Options          |
|-----------------|---------------|-----------      |
|name             |sting          |null: false      |
|price            |integer        |null: false      |
|description      |text           |null: false      |
|shipping_cost_id |integer        |null: false      |
|prefecture_id    |integer        |null: false      |
|days_to_ship_id  |integer        |null: false      |
|items_status_id  |integer        |null: false      |
|user             |references     |foreign_key: true|
|category_id      |integer        |null: false      |

### Association
-has_one :order
-belongs_to :user

## orders 

|Column  |Type          |Options            |
|--------|--------------|-------------------|
|user    |references     |foreign_key: true |
|item    |references     |foreign_key: true |


### Association
-belongs_to :user
-belongs_to :item
-has_one :address

## addresses

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|postal_code      |string     |null: false       |
|prefecture_id    |integer    |null: false       |
|city             |string     |null: false       |
|house_number     |string     |null: false       |
|building_name    |string     |                  |
|phone_number     |string     |null: false       |
|order            |references |foreign_key: true|

### Association
-belongs_to order