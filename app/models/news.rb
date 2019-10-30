class News < ApplicationRecord
  belongs_to :keyword
  validates :title, uniqueness: { case_sensitive: false }
  validates :url, uniqueness: { case_sensitive: false }
  default_scope { order(delivery_date: :desc) }
  self.per_page = 10
end
