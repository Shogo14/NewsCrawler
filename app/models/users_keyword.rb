class UsersKeyword < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :keyword, optional: true
end
