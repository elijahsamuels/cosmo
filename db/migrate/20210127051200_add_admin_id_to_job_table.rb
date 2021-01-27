class AddAdminIdToJobTable < ActiveRecord::Migration[6.1]
  change_table(:jobs) do |t|
    t.references :admin
  end
end
