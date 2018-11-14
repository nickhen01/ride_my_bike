# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.new(
  email: 'nick@sprtlnce.com',
  password: '123456',
  password_confirmation: '123456'
)
user1.save!

user2 = User.new(
  email: 'mike@sprtlnce.com',
  password: '123456',
  password_confirmation: '123456'
)
user2.save!

user3 = User.new(
  email: 'kasia@sprtlnce.com',
  password: '123456',
  password_confirmation: '123456'
)
user3.save!

user4 = User.new(
  email: 'ariel@sprtlnce.com',
  password: '123456',
  password_confirmation: '123456'
)
user4.save!

