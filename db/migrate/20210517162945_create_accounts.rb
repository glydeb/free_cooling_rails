class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.integer :owner_id, null: true, default: nil
      t.string :name

      t.timestamps
    end
  end
end
