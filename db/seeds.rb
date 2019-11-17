# frozen_string_literal: true

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobarzoo',
             password_confirmation: 'foobarzoo',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'Kinjo315',
             email: 'shogo14kinjo@gmail.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

1.upto(3) do |n|
  UsersKeyword.create!(
    user_id: 1,
    keyword_id: n,
    delete_flg: false
  )
end

Keyword.create!(
  name: 'Ruby',
  delete_flg: false
)

Keyword.create!(
  name: 'PHP',
  delete_flg: false
)

Keyword.create!(
  name: 'ONE OK ROCK',
  delete_flg: false
)
