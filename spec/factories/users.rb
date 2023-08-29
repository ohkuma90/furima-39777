FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_ch{'佐藤'}
    first_name_ch{'次郎'}
    last_name{'サトウ'}
    first_name{'ジロウ'}
    date_of_birth{Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end