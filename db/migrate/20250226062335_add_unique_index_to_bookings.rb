class AddUniqueIndexToBookings < ActiveRecord::Migration[8.0]
  def change
    def change
      add_index :bookings, :confirmation_code, unique: true
    end
  end
end
