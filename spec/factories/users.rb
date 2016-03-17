FactoryGirl.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    admin false
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    admin true
  end
end
