class BookmarkCategory < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user_category
end
