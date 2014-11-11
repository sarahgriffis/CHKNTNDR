class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :formatted_address
      t.string :formatted_phone
      t.string :price_tier
      t.string :rating, default: 0
      t.string :number_of_ratings
      t.string :photo_url

      t.timestamps
    end
  end
end
