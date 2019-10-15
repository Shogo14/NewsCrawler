class News < ApplicationRecord
    has_many :news_keywords
    has_many :keywords, through: :news_keywords
end
