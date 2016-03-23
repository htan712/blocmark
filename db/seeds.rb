admin = User.create!(
    email:                  ENV["CREATOR_EMAIL"],
    password:               ENV["CREATOR_PASSWORD"],
    password_confirmation:  ENV["CREATOR_PASSWORD"],
    role:                  2
)

admin.skip_confirmation!
admin.save!

member = User.create!(
    email:                  ENV["MEMBER_EMAIL"],
    password:               ENV["MEMBER_PASSWORD"],
    password_confirmation:  ENV["MEMBER_PASSWORD"]
)

member.skip_confirmation!
member.save!

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    role: 0,
    confirmed_at: Date.today
  )
end

users = User.all

fitness = Topic.create!(title: "Fitness", user: admin)
books = Topic.create!(title: "Books To Read", user: admin)
events = Topic.create!(title: "Upcoming exciting events", user: admin)
ruby = Topic.create!(title: "RubyOnRails", user: admin)
js = Topic.create!(title: "JavaScript", user: admin)
htmlcss = Topic.create!(title: "HTML & CSS", user: admin)
starwars = Topic.create!(title: "StarWars", user: admin)

topics = Topic.all

20.times do
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
