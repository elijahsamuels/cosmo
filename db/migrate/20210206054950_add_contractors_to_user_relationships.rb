class AddContractorsToUserRelationships < ActiveRecord::Migration[6.1]
  change_table(:user_relationships) do |t|
      t.integer :contractor_id
  end
end
