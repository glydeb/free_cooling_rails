class CreateIndoorSensors < ActiveRecord::Migration[6.1]
  def change
    create_table :indoor_sensors do |t|
      t.string :device_id
      t.string :device_hash
      t.references :location, null: false, foreign_key: true
      t.string :access_token
      t.string :name
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
