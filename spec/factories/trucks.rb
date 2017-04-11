FactoryGirl.define do
  factory :truck do
    name Faker::Company.name
    description Faker::Lorem.sentence
  end
end
