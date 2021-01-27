class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone, limit: 15
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :zip
      t.string :state

      t.timestamps
    end
  end
end
