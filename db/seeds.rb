# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'josh@example.com', password: 'passw0rd', password_confirmation: 'passw0rd')

Project.create(title: 'public project')
Project.create(title: 'private project(PW:1234)', password: '1234')