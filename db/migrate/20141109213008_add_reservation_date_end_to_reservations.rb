class AddReservationDateEndToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :preferred_date_end, :date
  end
end
