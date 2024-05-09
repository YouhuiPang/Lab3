class User < ApplicationRecord
  has_one :restaurant, dependent: :destroy
  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :restaurant
  has_many :reviews, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Returns true if the user is a customer
  def customer?
    status == 'customer'
  end
  
  # Returns true if the user is a restaurant user
  def restaurant_user?
    status == 'restaurant'
  end
end
