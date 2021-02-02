class CreateUserRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :user_relationships do |t|

      t.bigint :client_id
      t.bigint :admin_id

      t.timestamps
    end
  end
end
