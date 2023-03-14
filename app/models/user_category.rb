class UserCategory < ApplicationRecord
  belongs_to :user
  has_many :bookmark_categories
  has_many :bookmarks, through: :bookmark_categories
end
