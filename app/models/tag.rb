class Tag < ApplicationRecord
  has_many :review_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :reviews, through: :review_tags
  
  validates :review_id, presence: true
  validates :tag_id, presence: true
end