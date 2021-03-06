# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "管理ユーザ",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "testman",
             email: "test@example.com",
             password:              "testpass",
             password_confirmation: "testpass",
             admin: false)

(1..10).each do |i|
    User.create!(name:  "太郎#{i}",
                email: "taro#{i}@example.com",
                password:              "password",
                password_confirmation: "password",
                admin: false)
    i += 1
end

User.create!(name:  "おさかなくん",
             email: "osakana@example.com",
             password:              "testpass",
             password_confirmation: "testpass",
             admin: false)