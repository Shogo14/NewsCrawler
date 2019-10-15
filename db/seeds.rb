User.create!(first_name:  "Example",
             last_name:  "User",
             email: "example@railstutorial.org",
             password:              "foobarzoo",
             password_confirmation: "foobarzoo",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
99.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name:  first_name,
               last_name:  last_name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

UsersKeyword.create!(
  user_id: 1,
  keyword_id: 1,
  delete_flg: false
)

Keyword.create!(
  keywords_contents: "Ruby",
  delete_flg: false
)

100.times do |n|
  keywordId = 1
  title = "#{n}個目のニュースのタイトルです。"
  contents = "#{n}個目のニュースのコンテンツです。"
  img = "img_src#{n}"
  url = "url#{n}"
  delDate = Time.zone.now
  
  News.create!(
    title: title,
    contents: contents,
    img_src: img,
    url: url,
    delivery_date: delDate,
    delete_flg: false
  )

end
