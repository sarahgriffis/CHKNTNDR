class ChangeReservationsTimeColumn < ActiveRecord::Migration
  def change
    change_column :reservations, :preferred_reservation_time, :time, :default => '2000-01-01 19:00:00'
  end
end
