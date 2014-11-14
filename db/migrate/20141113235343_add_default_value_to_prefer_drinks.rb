class AddDefaultValueToPreferDrinks < ActiveRecord::Migration
  def change
    change_column :reservations, :prefer_drinks, :boolean, :default => true
  end
end
