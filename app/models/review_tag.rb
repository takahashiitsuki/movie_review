class ReviewTag < ApplicationRecord
  belongs_to :review, optional: true
  belongs_to :tag
end
