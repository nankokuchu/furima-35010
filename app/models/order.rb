class Order < ApplicationRecord
  has_one :addresses
  belongs_to :item
  belongs_to :user
end
