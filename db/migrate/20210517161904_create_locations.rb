class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.numeric :latitude
      t.numeric :longitude

      t.timestamps
    end
  end
end
