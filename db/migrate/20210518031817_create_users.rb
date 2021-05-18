class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.references :account, null: false, foreign_key: true
      t.string :email
      t.string :enc_password
      t.string :confirmation_token
      t.string :reset_password_token

      t.timestamps
    end
  end
end
