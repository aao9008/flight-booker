class AddFieldsToBookings < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :flight, foreign_key: true
    add_column :bookings, :confirmation_code, :string
  end
end
