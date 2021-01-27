class AddAdminIdToUserTable < ActiveRecord::Migration[6.1]
  change_table(:users) do |t|
    t.references :admin
  end
end
