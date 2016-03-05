creator = User.new(
    email:                  ENV["creator_email"],
    password:               ENV["creator_password"],
    password_confirmation:  ENV["creator_password"],
)

creator.skip_confirmation!
creator.save!

fitness = Topic.create!(title: "Fitness", user: creator)

books = Topic.create!(title: "Books To Read", user: creator)

events = Topic.create!(title: "Upcoming exciting events", user: creator)

nightlife = Topic.create!(title: "Nightlife", user: creator)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
