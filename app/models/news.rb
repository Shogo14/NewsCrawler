class News < ApplicationRecord
  belongs_to :keyword
  validates :title, uniqueness: { case_sensitive: false }
  validates :url, uniqueness: { case_sensitive: false }
end
