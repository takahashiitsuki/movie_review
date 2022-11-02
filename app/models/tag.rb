class Tag < ApplicationRecord
  has_many :review_tags,through: :reviews
end
