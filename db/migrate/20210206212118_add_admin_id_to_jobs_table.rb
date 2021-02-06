class AddAdminIdToJobsTable < ActiveRecord::Migration[6.1]
  change_table(:jobs) do |t|
    t.integer :admin_id
  end
end
