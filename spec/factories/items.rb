FactoryBot.define do
  factory :item do
    title             { Faker::Name.initials(number: 2) }
    content           { Faker::Lorem.sentence }
    category_id       { 2 }
    status_id         { 2 }
    age_id            { 2 }
    association :user
  end
end