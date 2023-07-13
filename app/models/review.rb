class Review < ApplicationRecord
   belongs_to :user
   has_many :comments,dependent: :destroy
   has_many :review_tags,dependent: :destroy
   has_many :tags, through: :review_tags
   
   accepts_nested_attributes_for :tags, allow_destroy: true
   
   with_options presence: true, on: :publicize do
      validates :title
      validates :body
      validates :star
   end

#   def self.looks(search, word)
#     @reviews = Review.where("title LIKE ?", "%#{words}%")
#   end
end
