require "#{Rails.root}/app/helpers/news_helper"
include NewsHelper

namespace :news_crawling do
    desc "Helloを表示するタスク"
    task say_hello: :environment do
        output = get_contents("https://headlines.yahoo.co.jp/hl?a=20191021-00000122-sph-ent")
      puts output
    end

    desc "登録されてるキーワードを表示するタスク"
    task print_keyword: :environment do
        Keyword.all.each do |keyword|
            puts keyword.name
        end
    end

    desc "登録されてるキーワードからニュースをDBへ挿入するタスク"
    task get_all_news: :environment do
        Keyword.all.each do |keyword|
            keyword_get_news(keyword: keyword.name,keyword_id: keyword.id)
        end
    end
end
