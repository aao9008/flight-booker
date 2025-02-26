class Booking < ApplicationRecord
  validates :confirmation_code, presence: true, uniqueness: true, format: { with: /\A[A-Z]{6}\z/, message: "must be exactly 6 uppercase letters" }
  validates :flight, presence: true
  validates :passengers, presence: { message: "must have at least one passenger" }

  belongs_to :flight
  has_and_belongs_to_many :passengers

  before_validation :generate_confirmation_code, on: :create

  private

  def generate_confirmation_code
    return if confirmation_code.present?  # Skip if already set

    loop do
      self.confirmation_code = SecureRandom.alphanumeric(6).upcase.gsub(/\d/, ("A".."Z").to_a.sample)
      break unless Booking.exists?(confirmation_code: confirmation_code)  # Ensure uniqueness
    end
  end
end
