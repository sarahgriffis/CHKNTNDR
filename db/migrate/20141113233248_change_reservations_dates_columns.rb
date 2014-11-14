class ChangeReservationsDatesColumns < ActiveRecord::Migration
  def change
    change_column :reservations, :preferred_date_start, :date, :default => Date.today
    change_column :reservations, :preferred_date_end, :date, :default => Date.today + 30
  end
end
