class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :reviews
  validates :name, :food_type, :open_hour, presence: true
  def self.search(query, date, time, party_size)
    results = all

    if query.present?
      query = query.downcase
      results = results.where('LOWER(name) LIKE :query OR LOWER(food_type) LIKE :query OR LOWER(description) LIKE :query', query: "%#{query}%")
    end

    # Assuming we have availability logic based on reservations
    if date.present? && time.present? && party_size.present?
      datetime = DateTime.parse("#{date} #{time}")

      results = results.joins(:tables).where('tables.available_from <= :datetime AND tables.available_to >= :datetime AND tables.capacity >= :party_size', datetime: datetime, party_size: party_size)
    end

    results
  end
end
