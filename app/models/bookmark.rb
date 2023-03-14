class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :search
  has_many :bookmark_categories, dependent: :destroy
  has_many :categories, through: :bookmark_categories, source: :user_category
end
