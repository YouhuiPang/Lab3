class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  belongs_to :table

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'pending'
  end

end
