class Review < ApplicationRecord
   belongs_to :user
   belongs_to :movie
   
#   def self.looks(search, word)
#     @reviews = Review.where("title LIKE ?", "%#{words}%")
#   end
end
