class CreateWeatherReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_readings do |t|
      t.datetime :timestamp
      t.numeric :dry_bulb
      t.numeric :rh
      t.numeric :precip_chance_60
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
