class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.boolean :alertable
      t.integer :enable_alert_at_mins_after_midnight
      t.integer :disable_alert_at_mins_after_midnight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
