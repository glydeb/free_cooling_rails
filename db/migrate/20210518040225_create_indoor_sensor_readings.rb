class CreateIndoorSensorReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :indoor_sensor_readings do |t|
      t.datetime :timestamp
      t.numeric :dry_bulb
      t.numeric :rh
      t.references :indoor_sensor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
