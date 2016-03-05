FactoryGirl.define do
  pw = Faker::Internet.password
  factory :user do
    email "jtan712@bloc.com"
    password pw
    password_confirmation pw
  end
end
