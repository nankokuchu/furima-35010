FactoryBot.define do
  factory :item do
    name { 'test' }
    price { 8888 }
    description { 'test' }
    shipping_cost_id { 1 }
    items_status_id { 1 }
    days_to_ship_id { 1 }
    category_id { 1 }
    prefecture_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-car1.jpeg'), filename: 'test-car1.jpeg')
    end
  end
end
