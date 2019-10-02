class NewsController < ApplicationController
    def index
        @newss = News.first
    end
    def show
        @newss = News.all
    end
end
