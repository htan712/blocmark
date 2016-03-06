FactoryGirl.define do
  factory :user do
    email "jtan712@bloc.com"
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end
