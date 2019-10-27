require "#{Rails.root}/app/helpers/news_helper"
include NewsHelper

namespace :news_crawling do

    desc "登録されてるキーワードからニュースをDBへ挿入するタスク"
    task get_all_news: :environment do
        Keyword.all.each do |keyword|
            keyword_get_news(keyword: keyword.name,keyword_id: keyword.id)
        end
    end
end
