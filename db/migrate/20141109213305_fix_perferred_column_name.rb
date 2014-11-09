class FixPerferredColumnName < ActiveRecord::Migration
  def change
    rename_column :reservations, :perferred_date, :preferred_date_start
  end
end
