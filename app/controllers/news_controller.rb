class NewsController < ApplicationController
    before_action :logged_in_user
    
    def index
        @news = News.where(keyword_id: users_keyword_ids)
    end
    def show
        @news = News.find(params[:id])
    end

    private
        def users_keyword_ids
            current_user.users_keywords.ids
        end
end
