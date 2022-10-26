class Movie < ApplicationRecord
  has_many :reiews,dependent: :destroy
end
