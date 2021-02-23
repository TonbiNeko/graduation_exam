require 'faker'

User.create!(
  name: "bibibi",
  email: "bibibi@example.com",
  password: "umeboshi",
  password_confirmation: "umeboshi"
)

Place.create!(
  email: "nasu@example.com",
  address: "東京都中央区日本橋横山町７−１９",
  name: "nasuoyaji",
  description: "平日午前はごみ拾いした方アイスクリーム半額です",
  password: "umeboshi",
  password_confirmation: "umeboshi",
).build_rule(comment: "びん、カン、燃えるゴミ、燃えないゴミ袋を分けてください").save!

30.times do
  Place.create!(
    email: Faker::Internet.email,
    address: Faker::Address.state,
    name: Faker::Games::Pokemon.name,
    password: 'absolutegarbo',
    password_confirmation: 'absolutegarbo',
  ).build_rule(comment: "びん、カン、燃えるゴミ、燃えないゴミ袋を分けてください").save!
end

30.times do
  User.create!(
    name: Faker::JapaneseMedia::Naruto.character,
    email: Faker::Internet.email,
    password: 'umeboshi',
    password_confirmation: 'umeboshi'
  )
end

10.times do
  User.first.blogs.create!(
    title: Faker::Games::WorldOfWarcraft.quote,
    content: "#{Faker::JapaneseMedia::StudioGhibli.quote}
      #{Faker::Games::WorldOfWarcraft.quote}
      #{Faker::Games::StreetFighter.quote}"
  )
end

10.times do
  User.second.blogs.create!(
    title: Faker::Games::WorldOfWarcraft.quote,
    content: "#{Faker::JapaneseMedia::StudioGhibli.quote}
      #{Faker::Games::WorldOfWarcraft.quote}
      #{Faker::Games::StreetFighter.quote}"
  )
end

10.times do
  User.third.blogs.create!(
    title: Faker::Games::WorldOfWarcraft.quote,
    content: "#{Faker::JapaneseMedia::StudioGhibli.quote}
      #{Faker::Games::WorldOfWarcraft.quote}
      #{Faker::Games::StreetFighter.quote}"
  )
end

User.last.comments.create!(
  blog_id: Blog.first.id,
  content: Faker::Games::WorldOfWarcraft.race
)