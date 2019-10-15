class NewsKeyword < ApplicationRecord
    belongs_to :news, optional: true
    belongs_to :keyword, optional: true
end
