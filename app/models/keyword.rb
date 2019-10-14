class Keyword < ApplicationRecord
    validates :keywords_contents,   presence: true, length: { maximum: 20 },
                                    uniqueness: { case_sensitive: false }
    has_many :users_keywords
    has_many :users, through: :users_keywords
end
