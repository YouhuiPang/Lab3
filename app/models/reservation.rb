class Reservation < ApplicationRecord
  belongs_to :restaurant
  validates :date, :party_size, presence: true
end
