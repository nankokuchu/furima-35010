FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    nickname { Faker::Name.last_name }
    first_name { '田中' }
    last_name { '大浪' }
    first_name_reading { 'タナカ' }
    last_name_reading { 'ダイロウ' }
    birthday { '1930-01-01' }
  end
end
