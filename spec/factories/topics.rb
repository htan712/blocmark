FactoryGirl.define do
  factory :topic do
    title Faker::StarWars.planet
    user
  end
end
