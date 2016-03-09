admin = User.new(
    email:                  ENV["creator_email"],
    password:               ENV["creator_password"],
    password_confirmation:  ENV["creator_password"],
    admin:                  true
)

admin.skip_confirmation!
admin.save!

member = User.new(
    email:                  ENV["member_email"],
    password:               ENV["member_password"],
    password_confirmation:  ENV["member_password"]
)

member.skip_confirmation!
member.save!

anakin = User.new(
    email:                  Faker::Internet.email,
    password:               "password",
    password_confirmation:  "password"
)
anakin.skip_confirmation!
anakin.save!

users = User.all

fitness = Topic.create!(title: "Fitness", user: admin)
books = Topic.create!(title: "Books To Read", user: admin)
events = Topic.create!(title: "Upcoming exciting events", user: admin)
ruby = Topic.create!(title: "RubyOnRails", user: admin)
js = Topic.create!(title: "JavaScript", user: admin)
htmlcss = Topic.create!(title: "HTML & CSS", user: admin)
starwars = Topic.create!(title: "StarWars", user: admin)

topics = Topic.all

5.times do
  Bookmark.create!(
    user: users.sample,
    topic: starwars,
    title: Faker::StarWars.character,
    url: "http://www.starwars.com/",
    description: Faker::StarWars.quote
  )
end

10.times do
  Bookmark.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::StarWars.character,
    url: "http://www.starwars.com/",
    description: Faker::StarWars.quote
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
