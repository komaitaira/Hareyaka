# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/user.rb'
require './db/seeds/company.rb'
require './db/seeds/genre.rb'
require './db/seeds/article.rb'
require './db/seeds/room.rb'
require './db/seeds/message.rb'

# 管理者
Admin.create!(
  id: 1,
  email: 'admin@example.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin'
  )