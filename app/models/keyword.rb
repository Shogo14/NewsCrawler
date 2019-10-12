class Keyword < ApplicationRecord
    has_many :users_keywords
    has_many :users, through: :users_keywords
end
