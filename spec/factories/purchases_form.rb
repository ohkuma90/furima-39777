FactoryBot.define do
  factory :purchases_form do
    item_id { 1 }
    user_id { 1 }
    post_code { '000-0000' }
    prefecture_id { 23 }
    municipalities { '田町' }
    street_address { '4-4-4' }
    building_name { '田町ハイツ' }
    telephone_number { '0000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
