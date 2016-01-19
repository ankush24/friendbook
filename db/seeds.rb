# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# roles = Role.create([{name: 'Voter'}, {name: 'Commenter'}])

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
# User.create!(email: "example@railstutorial.org",
#              password:              "password",
#              password_confirmation: "password")

# 99.times do |n|
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(email: email,
#                password:              password,
#                password_confirmation: password)
# end