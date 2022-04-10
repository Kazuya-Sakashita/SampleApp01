# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do |n|
#   # 一般ユーザー
#   User.create!(
#     email: "test+#{n + 1}@test.com",
#     password: "password",
#     password_confirmation: "password"
#   )
# end


5.times do |n|
  Post.create!(
    category:"test",
    content:"おはようございます+#{n + 1}",
    user_id:3,
  )

end