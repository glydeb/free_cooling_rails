class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.datetime :timestamp
      t.boolean :open
      t.references :indoor_sensor, null: false, foreign_key: true
      t.references :weather_reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
