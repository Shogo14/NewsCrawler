class NewsController < ApplicationController
    def index
        @top_topic_url = top_topic_url('https://news.yahoo.co.jp/')
        keyword_url = make_url("one ok rock")
        @keyword_topics = keyword_topic_url(keyword_url)
    end
    def show
        @newss = News.all
    end
end
