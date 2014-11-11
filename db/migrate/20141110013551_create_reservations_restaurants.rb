class CreateReservationsRestaurants < ActiveRecord::Migration
  def change
    create_table :reservations_restaurants do |t|
      t.integer :reservation_id
      t.integer :restaurant_id
    end
  end
end
