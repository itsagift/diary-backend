
require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here
Entry.create([
  {
    body: Faker::Quote.famous_last_words,
    emotion: "sad",
    user_id: 1
  },
  {
    body: Faker::Quote.famous_last_words,
    emotion: "happy",
    user_id: 1
  },
  {
    body: Faker::Quote.famous_last_words,
    emotion: "angry",
    user_id: 1
  }
]
)

User.create(name: "Bob")
puts "✅ Done seeding!"
