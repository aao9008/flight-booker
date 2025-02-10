# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airports = [
  { code: "JFK" },
  { code: "LGA" },
  { code: "MCO" },
  { code: "XNA" },
  { code: "GYE" },
  { code: "LAX" }
]


airports.each do |airport|
  Airport.create(airport)
end

puts "Seeded #{Airport.count} airports!"

# Create flights (duration in minutes)
Flight.create!(
  departure_airport: Airport.where(code: "LGA").first,
  arrival_airport: Airport.where(code: "MCO").first,
  start_datetime: DateTime.new(2025, 3, 1, 10, 0, 0),
  duration: 360  # 6 hours
)

Flight.create!(
  departure_airport: Airport.where(code: "MCO").first,
  arrival_airport: Airport.where(code: "XNA").first,
  start_datetime: DateTime.new(2025, 3, 2, 14, 30, 0),
  duration: 345  # 5 hours 45 minutes
)

Flight.create!(
  departure_airport: Airport.where(code: "JFK").first,
  arrival_airport: Airport.where(code: "XNA").first,
  start_datetime: DateTime.new(2025, 4, 5, 8, 15, 0),
  duration: 275  # 4 hours 35 minutes
)

Flight.create!(
  departure_airport: Airport.where(code: "LGA").first,
  arrival_airport: Airport.where(code: "GYE").first,
  start_datetime: DateTime.new(2025, 5, 12, 6, 45, 0),
  duration: 180  # 3 hours
)

Flight.create!(
  departure_airport: Airport.where(code: "JFK").first,
  arrival_airport: Airport.where(code: "LAX").first,
  start_datetime: DateTime.new(2025, 6, 20, 9, 0, 0),
  duration: 240  # 4 hours
)
