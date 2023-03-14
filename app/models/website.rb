class Website < ApplicationRecord
  has_many :searches
  has_many :reviews
end
