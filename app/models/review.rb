class Review < ApplicationRecord
   belongs_to :user
   has_many :comments,dependent: :destroy

#   def self.looks(search, word)
#     @reviews = Review.where("title LIKE ?", "%#{words}%")
#   end
end
