class NewsController < ApplicationController
    before_action :logged_in_user
    
    def index
        @news = News.where(keyword_id: users_keyword_ids).paginate(page: params[:page])
        #ALL表示用　後でリファクタリングする必要あり
        @news_id = 0
    end
    
    def show
        @news = News.find(params[:id])
    end

end
