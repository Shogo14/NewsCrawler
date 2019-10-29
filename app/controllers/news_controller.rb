class NewsController < ApplicationController
    before_action :logged_in_user
    
    def index
        @news = News.where(keyword_id: users_keyword_ids).order(delivery_date: "DESC")
        @keywords = Keyword.where(id: users_keyword_ids)
    end
    
    def show
        @news = News.find(params[:id])
    end

end
