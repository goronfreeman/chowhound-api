FactoryGirl.define do
  factory :business do
    name Faker::Company.name
    email Faker::Internet.email
    phone Faker::PhoneNumber.phone_number
    website Faker::Internet.url
  end
end
