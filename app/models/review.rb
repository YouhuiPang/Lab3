class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :stars, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
