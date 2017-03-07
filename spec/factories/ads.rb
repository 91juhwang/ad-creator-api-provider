FactoryGirl.define do
  factory :ad do
    title Faker::Lorem.word
    price Faker::Number.number(2)
    description Faker::Lorem.sentence
    association :user
  end
end
