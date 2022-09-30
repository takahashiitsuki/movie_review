class Movie < ApplicationRecord
  has_many :movies, dependent: :destroy
end
