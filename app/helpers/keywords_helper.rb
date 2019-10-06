module KeywordsHelper
    require 'uri'

    def make_url(keyword)
        ec_keyword = URI.encode(keyword)
        url = "https://news.yahoo.co.jp/search/?p=#{ec_keyword}&ei=utf-8&fr=news_sw"
        return url
    end
end
