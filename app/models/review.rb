class Review < ApplicationRecord
   belongs_to :user
   belongs_to :movie
   has_many :comments,dependent: :destroy
   
#   def self.looks(search, word)
#     @reviews = Review.where("title LIKE ?", "%#{words}%")
#   end
end
