FactoryGirl.define do
  factory :bookmark do
    url Faker::Internet.url
    title Faker::StarWars.character
    description Faker::StarWars.quote
    topic
    user
  end
end
