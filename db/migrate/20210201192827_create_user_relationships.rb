class CreateUserRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :user_relationships do |t|

      t.integer :client_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
