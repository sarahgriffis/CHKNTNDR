class AddInactiveAtColumnToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :inactived_at, :datetime
  end
end
