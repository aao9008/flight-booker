class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: { case_sensitive: false }, length: { is: 3 },  format: { with: /\A[A-Z]+\z/,
  message: "only allows uppercase letters" }
end
