FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { Faker::Date.between(from: '1990-01-01', to: '2010-12-31') }
  end
end
