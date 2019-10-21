User.create!(first_name:  "Example",
             last_name:  "User",
             email: "example@railstutorial.org",
             password:              "foobarzoo",
             password_confirmation: "foobarzoo",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
50.times do |n|
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

1.upto(3) do |n|
  UsersKeyword.create!(
    user_id: 1,
    keyword_id: n,
    delete_flg: false
  )
end

Keyword.create!(
  name: "Ruby",
  delete_flg: false
)

Keyword.create!(
  name: "PHP",
  delete_flg: false
)

Keyword.create!(
  name: "JavaScript",
  delete_flg: false
)


keywordId = 1
50.times do |n|
  title = "#{n}個目のRubyニュースのタイトルです。"
  contents = "#{n}個目のRubyニュースのコンテンツです。"
  img = "img_src#{n}"
  url = "url#{n}"
  delDate = Time.zone.now
  
  News.create!(
    title: title,
    content: contents,
    img_src: img,
    url: url,
    keyword_id: keywordId,
    delivery_date: delDate,
    delete_flg: false
  )

end

keywordId = 2
50.times do |n|
  title = "#{n}個目のPHPニュースのタイトルです。"
  contents = "#{n}個目のPHPニュースのコンテンツです。"
  img = "img_src#{n}"
  url = "url#{n}"
  delDate = Time.zone.now
  
  News.create!(
    title: title,
    content: contents,
    img_src: img,
    url: url,
    keyword_id: keywordId,
    delivery_date: delDate,
    delete_flg: false
  )
end
