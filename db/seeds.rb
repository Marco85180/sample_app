# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

99.times do
  users = User.create!(name: Faker::Name.name, email: Faker::Internet.email,
        password: "password", password_confirmation: "password")
end

users = User.all
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content:content) }
end

user = users.first
followed_users = users[2..50]
followers = users[3..40]
followed_users.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }