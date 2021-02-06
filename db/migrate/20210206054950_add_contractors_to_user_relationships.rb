class AddContractorsToUserRelationships < ActiveRecord::Migration[6.1]
  change_table(:user_relationships) do |t|
      t.bigint :contractor_id
  end
end
