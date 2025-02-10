class Flight < ApplicationRecord
  validates :departure_airport, presence: true
  validates :arrival_airport, presence: true
  validates :start_datetime, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validate :departure_and_arrival_cannot_be_same

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  private

  def departure_and_arrival_cannot_be_same
    if departure_airport_id == arrival_airport_id
      errors.add(:arrival_airport, "cannot be the same as the departure airport")
    end
  end
end
