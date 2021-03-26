# README

## users

|Column       |Type   |Options    |
|-------------|-------|-----------|
|email        |sting  |null: false|
|password     |sting  |null: false|
|nickname     |sting  |null: false|
|first_name   |sting  |null: false|
|last_name    |sting  |null: false|
|name_reading |sting  |null: false|
|birthday     |integer|null: false|

### Association
-has_many :items
-has_many :addresses
-has_many :oders

## items

|Column        |Type           |Options    |
|--------------|---------------|-----------|
|name          |sting          |null: false|
|price         |integer        |null: false|
|description   |text           |null: false|
|catch_copy    |text           |null: false|
|shipping_cost |integer        |null: false|
|shiping       |integer        |null: false|
|image         |Active_Storage             |
|user          |references     |null: false|
|category_id   |integer        |null: false|

### Association
-has_one :oder
-extend ActiveHash::Associations::ActiveRecordExtensions
-belongs_to :category

## category (ActiveHashを使う)

|Column        |Type           |Options    |
|--------------|---------------|-----------|
|id                                        |
|name                                      |

### Association
-include ActiveHash::Associations
-has_many :item

## orders (odersとaddressesはformオブジェクトを使う)

|Column  |Type          |Options           |
|--------|--------------|------------------|
|price   |integer       |null: false       |
|user    |refrences     |foreign_key: true |
|item    |refrences     |foreign_key: true |
|token   |attr_accessor                    |

### Association
-belongs_to :user
-belongs_to :item
-has_one :address

## addresses(odersとaddressesはformオブジェクトを使う)

|Column        |Type      |Options           |
|--------------|----------|------------------|
|postal_code   |string    |null: false       |
|prefecture    |integer   |null: false       |
|city          |string    |null: false       |
|house_number  |string    |                  |
|building_name |string    |                  |
|phone_number  |integer   |null: false       |
|oder          |refrences |foreign_key: true |

### Association
-belongs_to user
-belongs_to oder