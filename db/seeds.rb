require 'faker'

User.create!(
  name: 'bibibi',
  email: 'bibibi@example.com',
  password: 'umeboshi',
  password_confirmation: 'umeboshi'
)

Place.create!(
  email: 'nasu@example.com',
  address: 'なすけん那須市,那須町',
  name: 'nasuoyaji',
  password: 'umeboshi',
  password_confirmation: 'umeboshi'
).build_rule(comment: "love my bi").save!

5.times do
  Place.create!(
    email: Faker::Internet.email,
    address: Faker::Address.state,
    name: Faker::Games::Pokemon.name,
    password: 'absolutegarbo',
    password_confirmation: 'absolutegarbo',
  ).build_rule(comment: "love my bi").save!
end

2.times do
  User.create!(
    name: Faker::JapaneseMedia::Doraemon.character,
    email: Faker::Internet.email,
    password: 'umeboshi',
    password_confirmation: 'umeboshi'
  )
end

User.first.blogs.create!(
  title: Faker::Games::WorldOfWarcraft.quote,
  content: "#{Faker::Games::WorldOfWarcraft.quote}
    #{Faker::Games::WorldOfWarcraft.quote}
    #{Faker::Games::WorldOfWarcraft.quote}"
)

# blog1 = User.second.blog.new(...)
# blog1.save!

User.first.comments.create!(
  blog_id: Blog.first.id,
  content: Faker::Games::WorldOfWarcraft.race
)