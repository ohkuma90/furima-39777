FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.sentence }
    category_id { rand(2..Category.count) }
    condition_id { rand(2..Condition.count) }
    delivery_charge_id { rand(2..DeliveryCharge.count) }
    prefecture_id { rand(2..Prefecture.count) }
    days_to_ship_id { rand(2..DaysToShip.count) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
