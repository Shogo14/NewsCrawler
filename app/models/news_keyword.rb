class NewsKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :news
end
