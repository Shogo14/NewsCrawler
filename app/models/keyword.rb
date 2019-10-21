class Keyword < ApplicationRecord
    validates :name,   presence: true, length: { maximum: 20 },
                                    uniqueness: { case_sensitive: false }
    has_many :users_keywords
    has_many :users, through: :users_keywords
    has_many :news
end
