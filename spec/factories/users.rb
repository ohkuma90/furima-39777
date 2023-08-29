FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_ch{}
    first_name_ch{}
    last_name{}
    first_name{}
    date_of_birth{}
  end
end