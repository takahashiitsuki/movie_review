class Tag < ApplicationRecord
  has_many :review_tags,dependent: :destroy
end
