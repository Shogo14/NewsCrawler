# frozen_string_literal: true

class News < ApplicationRecord
  belongs_to :keyword
  validates :title, uniqueness: { case_sensitive: false }, presence: true
  validates :url, uniqueness: { case_sensitive: false }, presence: true
  validates :content, presence: true

  default_scope { order(delivery_date: :desc) }
  self.per_page = 10
end
