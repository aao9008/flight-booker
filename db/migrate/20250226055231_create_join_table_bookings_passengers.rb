class CreateJoinTableBookingsPassengers < ActiveRecord::Migration[8.0]
  def change
    create_join_table :bookings, :passengers do |t|
      t.index :booking_id
      t.index :passenger_id
      t.index [ :booking_id, :passenger_id ], unique: true
    end
  end
end
