FactoryGirl.define do
  factory :offer do
    message Faker::Lorem.sentence
    price Faker::Number.number(2)
  end
end