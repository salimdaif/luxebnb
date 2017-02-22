class CreateBookingsServicesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :bookings, :services
  end
end
