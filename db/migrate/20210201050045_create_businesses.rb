class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :zip
      t.string :state
      t.string :mailing_address_1
      t.string :mailing_address_2
      t.string :mailing_city
      t.integer :mailing_zip
      t.string :mailing_state
      t.string :url
      t.string :email
      t.string :phone, limit: 15
      t.text :description
      t.string :ein

      t.timestamps
    end
  end
end
