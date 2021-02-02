class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone, limit: 15
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :zip
      t.string :state
      t.string :ssn
      t.boolean :admin, default: false
      t.boolean :client, default: false
      t.boolean :contractor, default: false
      t.references :admin, foreign_key: { to_table: :users }
      t.references :client, foreign_key: { to_table: :users }
      t.references :contractor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
