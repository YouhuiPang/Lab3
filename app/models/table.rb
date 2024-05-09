# app/models/table.rb
class Table < ApplicationRecord
  belongs_to :restaurant

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'available'  # default status
  end
end
