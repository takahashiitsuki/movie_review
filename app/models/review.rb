class Review < ApplicationRecord
   belongs_to :user
   has_many :comments,dependent: :destroy
   has_many :review_tags,dependent: :destroy
   
   with_options presence: true, on: :publicize do
      validates :title
      validates :body
      validates :star
   end

#   def self.looks(search, word)
#     @reviews = Review.where("title LIKE ?", "%#{words}%")
#   end
end
