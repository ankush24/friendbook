# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 # roles = Role.create([{name: 'Voter'}, {name: 'Commenter'}])
# User.create!(username: "Demo-Voter",
# 						 email: "voter@test.com",
#              password:              "password",
#              password_confirmation: "password",
#              role_id: "Voter")

# 50.times do |n|
# 	username = "Demo_Voter-#{n+1}"
#   email = "demovoter-#{n+1}@railstutorial.org"
#   password = "password"
#   role = "Voter"
#   User.create!(username: username,
#   						 email: email,
#                password:              password,
#                password_confirmation: password,
#                role_id: role)
# end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
