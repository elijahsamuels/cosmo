class Payments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.references :business, foreign_key: { to_table: :business }
      t.references :job, foreign_key: { to_table: :jobs }
      t.references :admin, foreign_key: { to_table: :users }
      t.references :client, foreign_key: { to_table: :users }
      t.references :contractor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
