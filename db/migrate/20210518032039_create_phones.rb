class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.boolean :alertable
      t.time :alert_after
      t.time :alert_before
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
