class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :ratingm, presence: true

end
